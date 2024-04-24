#!/bin/bash

course="devops from current scriptr 12"

echo "Before calling other script, calling::$course"
echo "PID of current script::$$"

souce ./13.calling-demo-script.sh
echo "after calling other script, calling: $course"