#!/bin/bash

echo Deploying OLL Lab Scripts and Templates

scp -oStrictHostKeyChecking=no -r /OLL olltech@192.168.12.104:~/DELME

