# IGV-VM
Build IGV instance that can take screenshots without a GUI or X11


# quick test

- just starts IGV and does nothing else
	- need to pass --batch etc to actually generate screenshots

`singularity run /home/pankrat2/shared/bin/igvVM/igv.sif`

# Create

1. install docker (on OSX, linux using only singularity may be easier) https://www.docker.com , https://www.cprime.com/resources/blog/docker-on-mac-with-homebrew-a-step-by-step-tutorial/

```
git clone https://github.com/PankratzLab/IGV-VM.git
cd IGV-VM
# build docker image
docker build -t igv .
# convert image to singularity
mkdir singularity
docker run -v /var/run/docker.sock:/var/run/docker.sock \
-v /full/path/to/singularity/:/output \
--privileged -t --rm \
quay.io/singularity/docker2singularity \
igv

```
Then transfer the `.sif` file to where it will be run (e.g. msi)

```
rsync -avzP /full/path/to/singularity/*.sif msi:/home/pankrat2/shared/bin/igvVM/

```

# Running 

```
# where the .sif file is
singularityImage=/path/to/igv-...sif

# where screenshots will be created
snapshotDirectory=/path/to/snap/

# where bam/vcf file defined in the .igv file are located
bamVCFDir=/path/to/data/

# Directory containing `.igv` files. 
igvScriptDir=/path/to/igvs/

# run using singularity after mapping directories

singularity run \
--bind $snapshotDirectory \
--bind $bamVCFDir \
--bind $igvScriptDir \
$singularityImage \
--batch $igvScriptDir/test.igv

```
