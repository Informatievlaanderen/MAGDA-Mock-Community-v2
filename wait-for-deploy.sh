#!/bin/sh

# Version should be written to a file
VERSION=`cat target/pom_version`

# If it's a snapshot release, use the commit id instead
if [[ "$VERSION" =~ .*SNAPSHOT$ ]]; then
    FIELD='.commit_id'
    EXPECTED=$BITBUCKET_COMMIT
else
    FIELD='.version'
    EXPECTED=$VERSION
fi

get_url() {
    cat newman-test/$NAMESPACE-config.json | jq '.values[] | select(.key=="base_uri") | .value' -r
}

poll_version() {
    curl -s -L $POLL_URL | jq $FIELD -r
}

epoch_time() {
    date +%s
}

MAX_POLL_TIME=600 # seconds
BASE_URL=$(get_url)
POLL_URL="$BASE_URL/version"
echo "Polling $POLL_URL until version/commit $EXPECTED is deployed..."
ACTUAL_VERSION=$(poll_version)
START_TIME=$(epoch_time)
while [[ "$ACTUAL_VERSION" != "$EXPECTED" && "$TIMEOUT" == "" ]]; do
    echo "Actual version/commit-id: $ACTUAL_VERSION"
    sleep 5
    ACTUAL_VERSION=$(poll_version)
    NOW=$(epoch_time)
    ELAPSED=$((NOW - START_TIME))
    if [[ $ELAPSED -gt $MAX_POLL_TIME ]]; then
	echo "Timeout exceeded"
	TIMEOUT=yes
    fi
done
if [[ "$TIMEOUT" == "" ]]; then
    echo "Version deployed"
    exit 0
else
    exit 1
fi