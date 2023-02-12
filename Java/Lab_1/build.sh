#!/bin/bash

jar -c --file=./build/program.jar --manifest=./res/manifest.mf -C ./classes/ .
