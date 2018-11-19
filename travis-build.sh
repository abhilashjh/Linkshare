#!/bin/bash

EXIT_STATUS=0


./grailsw refresh-dependencies --non-interactive
./grailsw compile --non-interactive

exit $EXIT_STATUS
