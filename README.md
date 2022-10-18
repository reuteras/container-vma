# container-vma

Tool to extract disk from [Proxmox][pro] [VMA][vma] backup files. Inspired by https://github.com/akaihola/docker-vma.


## Download and build

    git clone https://github.com/reuteras/container-vma.git
    cd container-git
    docker build -t reuteras/container-vma .

## Usage

To use the container replace *<IMAGES DIRECTORY>* below with the directory containing the vma-files. That directory will be available under the directory */images* in the container.

    docker run -ti --rm  -v <IMAGES DIRECTORY>:/images reuteras/container-vma
    root@b428849c656e:/#  cd images/
    root@b428849c656e:/images# ls
    backup.vma
    root@b428849c656e:/images#

In the shell use the command **vma** to extract the *vma* file(s). Run **vma** without any argument to see the help:

    # vma
    usage: vma command [command options]

    vma list <filename>
    vma config <filename> [-c config]
    vma create <filename> [-c config] pathname ...
    vma extract <filename> [-r <fifo>] <targetdir>
    vma verify <filename> [-v]

If the file is compressed with [zstd][zst] you can use **unzstd** to uncompress the image first.

## Proxmox

Links to interesting pages in the Proxmox wiki.

- [Logical Volume Manager (LVM)][lvm]
- [Storage: LVM][slv]

  [lvm]: https://pve.proxmox.com/wiki/Logical_Volume_Manager_(LVM)
  [pro]: https://proxmox.com/en/
  [slv]: https://pve.proxmox.com/wiki/Storage:_LVM
  [vma]: https://pve.proxmox.com/wiki/VMA
  [zst]: https://github.com/facebook/zstd

