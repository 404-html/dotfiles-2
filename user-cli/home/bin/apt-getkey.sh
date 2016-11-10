#!/bin/bash

gpg --keyserver pgp.mit.edu --recv-keys $1
gpg --armor --export $1 | apt-key add -
