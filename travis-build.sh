#!/bin/bash

EXIT_STATUS=0


./grailsw refresh-dependencies --non-interactive
./grailsw compile --non-interactive
./grailsw test-app :unit --non-interactive
./grailsw war --non-interactive

exit $EXIT_STATUS
