#!/bin/bash

EXIT_STATUS=0


./grailsw refresh-dependencies --non-interactive
./grailsw compile --non-interactive
./grailsw test-app :unit --non-interactive
./grailsw war --non-interactive

zip -r target *
mkdir -p dpl_cd_upload
mv target.zip dpl_cd_upload/target.zip

exit $EXIT_STATUS
