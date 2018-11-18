#!/bin/bash

EXIT_STATUS=0


./gradlew --stop
./gradlew clean classes --no-daemon
./gradlew testClasses --no-daemon

exit $EXIT_STATUS
