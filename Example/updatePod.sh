#!/bin/bash

cd `dirname $0`
pod update --verbose --no-repo-update
