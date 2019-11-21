#!/bin/bash

# if [ "$TRAVIS_PULL_REQUEST_SLUG" = "$TRAVIS_REPO_SLUG" ]; then
#   GIT_DIFF_RESULT=$(eval $(echo bash diff_checking.sh remotes/origin/$TRAVIS_PULL_REQUEST_BRANCH remotes/origin/$TRAVIS_BRANCH))
# else
#   eval $(echo git remote add prBranch https://github.com/$TRAVIS_PULL_REQUEST_SLUG.git)
#   eval $(echo git fetch prBranch $TRAVIS_BRANCH) 
#   COMMIT_START=$(echo $TRAVIS_COMMIT_RANGE | cut -d '...' -f1)
#   COMMIT_END=$(echo $TRAVIS_COMMIT_RANGE | cut -d '...' -f2)
#   GIT_DIFF_RESULT=$(eval $(echo bash diff_checking.sh remotes/prBranch/$TRAVIS_BRANCH remotes/origin/$TRAVIS_BRANCH))
# fi

COMMIT_START=$(echo $TRAVIS_COMMIT_RANGE | cut -d '...' -f1)
COMMIT_END=$(echo $TRAVIS_COMMIT_RANGE | cut -d '...' -f2)

GIT_DIFF_RESULT=$(eval $(echo bash diff_checking.sh $COMMIT_START $COMMIT_END))

echo $GIT_DIFF_RESULT