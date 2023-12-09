#!/bin/bash
#read variable till ht enter key ie blankvariable
v=1
while [ -n "$v" ]
do
  echo "enter the text. end with enter key.."
  read v
  echo "you entered: $v"
done
