#!/bin/bash

# print outputs and exit on first failure
set -xe

if [ $TRAVIS_BRANCH == "main" ] ; then

    # setup ssh agent, git config and remote
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/travis_rsa
    git remote add deploy "admin@45.148.31.26:/var/www/html"
    git config user.name "Travis CI"
    git config user.email "travis@gmail.com"

    # commit compressed files and push it to remote
    rm -f .gitignore
    cp .travis/deployignore .gitignore
    git add .
    git status # debug
    git commit -m "Deploy compressed files"
    git push -f deploy HEAD:main

elif [ $TRAVIS_BRANCH == "staging" ] ; then

    # setup ssh agent, git config and remote
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/travis_rsa
    git remote add deploy "admin@45.148.31.26:/var/www/staging"
    git config user.name "Travis CI"
    git config user.email "travis@gmail.com"

    # commit compressed files and push it to remote
    rm -f .gitignore
    cp .travis/deployignore .gitignore
    git add .
    git status # debug
    git commit -m "Deploy compressed files"
    git push -f deploy HEAD:main

else

    echo "No deploy script for branch '$TRAVIS_BRANCH'"

fi