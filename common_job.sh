if [ -z "$TRAVIS_PULL_REQUEST_SLUG" ]; then
  GIT_DIFF_RESULT=$(eval $(echo bash diff_checking.sh remotes/origin/$TRAVIS_BRANCH remotes/origin/develop))
else
  if [ "$TRAVIS_PULL_REQUEST_SLUG" = "$TRAVIS_REPO_SLUG" ]; then
    GIT_DIFF_RESULT=$(eval $(echo bash diff_checking.sh remotes/origin/$TRAVIS_REPO_SLUG remotes/origin/develop))
  else
    eval $(echo git remote add prBranch https://github.com/$TRAVIS_PULL_REQUEST_SLUG.git)
    git fetch prBranch develop
    GIT_DIFF_RESULT=$(echo bash diff_checking.sh remotes/prBranch/develop remotes/origin/develop)
  fi
fi

echo GIT_DIFF_RESULT