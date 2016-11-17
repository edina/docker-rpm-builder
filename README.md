Building RPMs Using Docker
==========================

This is a collection of scripts used to build various RPMs for CentOS6/RHEL6 and CentOS7 using docker.

## Usage

```
cd <package>
./run.sh
```

The generated RPMs will appear in the package `output` folder.
*Note that all existing .rpm files will be deleted before the new rpm files are written.*
