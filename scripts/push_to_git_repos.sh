#!/bin/bash
export REPO_NAME=protos-modeldb-python
export REPO_DIR=tmp/protos-modeldb-python
mkdir -p tmp
git clone https://github.com/VertaAI/"$REPO_NAME" "$REPO_DIR"
rm -rf "$REPO_DIR"/*
cp -R ../output/python/protos/* "$REPO_DIR"
cd "$REPO_DIR"
git add .
git commit -m "updated python proto bindings"
git push origin master
cd ../../
rm -rf tmp
rm -rf ../output/python/*
echo "Done w/cleanup"

export REPO_NAME=protos-modeldb-go
export REPO_DIR=tmp/protos-modeldb-go
mkdir -p tmp
git clone https://github.com/VertaAI/"$REPO_NAME" "$REPO_DIR"
rm -rf "$REPO_DIR"/*
cp -R ../output/go/* "$REPO_DIR"
cd "$REPO_DIR"
git add .
git commit -m "updated go proto bindings"
git push origin master
cd ../../
rm -rf tmp
rm -rf ../output/go/*
echo "Done w/cleanup"
