#!/bin/bash

set -e

gpg --import /keys/priv.key
gpg --import /keys/pub.key

mkdir -p /share-rw/incoming

inoticoming --foreground /share-rw/incoming --suffix .changes reprepro -s --basedir /repo processincoming dcbe {} \;
