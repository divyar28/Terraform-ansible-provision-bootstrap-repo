#!/bin/bash

echo "TEST_CLASS running: $TEST_CLASS"
echo "EXTRA_ENVS: $EXTRA_ENVS"

if [[ $TEST_CLASS == "All" ]]; then
    java -jar sre-hello-world-entire-tests.jar
else
    java -jar -DextraEnvs=$EXTRA_ENVS sre-hello-world-entire-tests.jar -s $TEST_CLASS
fi

# upload report files
sleep 300
