#!/usr/bin/env bash
#Oneline for full directory name see: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e
docker build "$DIR/../base" -t wikibase/wikibase:1.34 -t wikibase/wikibase:1.34-base
docker build "$DIR/../bundle" -t wikibase/wikibase:1.34-bundle

if [ "$SHOULD_DOCKER_PUSH" = true ]; then
    docker push wikibase/wikibase:1.34
    docker push wikibase/wikibase:1.34-base
    docker push wikibase/wikibase:1.34-bundle
fi
