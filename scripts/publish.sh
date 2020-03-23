#!/bin/sh

if [ $# -ne 1 ]; then
  echo "usage: $0 <version>"
  exit 1
fi

VERSION=$1

cat Assets/GradientShader/package.json | jq -rM ".version = \"$VERSION\"" > /tmp/package.json.tmp
mv /tmp/package.json.tmp Assets/GradientShader/package.json
git add Assets/GradientShader/package.json
git commit -m ":up: Bump up version $VERSION"
git subtree split --prefix=Assets/GradientShader --branch upm
git tags $VERSION upm
git push origin --tags

