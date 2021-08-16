# IGV-VM
Build IGV instance that can take screenshots without a GUI or X11

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
-v singularity/:/output \
--privileged -t --rm \
quay.io/singularity/docker2singularity \
igv

```

# Running 

```



singularityImage=/path/to/igv-...sif
# Directory containing `.igv` files. `.igv` files need to be set up to use the directories that have been mapped from msi/local to "/output/", "/dataDir/", etc. See https://github.com/PankratzLab/IGV-VM/blob/main/example.igv

igvBatchDir=./
# where screenshots will be created
pngOutputDir=/path/to/outputDir/
# where bam/vcf file defined in the .igv file are located
bamVcfDir=/path/to/bam_vcfDir/
singularity run \
--bind $pngOutputDir:/output/ \
--bind $bamVcfDir:/dataDir/ \
--bind $igvBatchDir:/igv/ \
$singularityImage \
--batch /igv/example.igv
```
