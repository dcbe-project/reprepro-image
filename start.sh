#!/bin/bash

set -e

gpg --import /keys/repo-priv
gpg --import /keys/repo-pub

mkdir -p /repo/incoming
chmod 777 /repo/incoming

cat /keys/repo-pub | gpg --dearmor > /repo/dcbe.gpg

inoticoming --foreground /repo/incoming --suffix .changes reprepro -s --basedir /repo processincoming dcbe {} \;
