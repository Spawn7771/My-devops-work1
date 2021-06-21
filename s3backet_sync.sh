#!/bin/bash

s3backetfrom=testbacket1spawn
s3backetto=testbacket2spawn

aws s3 sync s3://$s3backetfrom/ s3://$s3backetto/ --recursive --exclude "*" --include "*.png"

