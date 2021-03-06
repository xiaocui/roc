#! /bin/bash
set -xe

brew update

brew tap Homebrew/bundle
brew bundle --file=scripts/travis/osx/Brewfile

scons -Q clean

scons -Q \
      --enable-werror \
      --enable-debug \
      --enable-sanitizers \
      --build-3rdparty=openfec,cpputest \
      test

scons -Q \
      --enable-werror \
      --build-3rdparty=openfec,cpputest \
      test

scons -Q \
      --enable-werror \
      --build-3rdparty=all \
      test
