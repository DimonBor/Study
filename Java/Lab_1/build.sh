#!/bin/bash

jar -c --file=./build/program.jar --manifest=./manifest.mf -C ./classes/ .
