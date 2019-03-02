#!/bin/bash
#export GOPATH=~/go

GATEWAY_FLAGS := -I.. -I/usr/local/include -I$(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis

PYTHON_GRPC_FLAGS := --grpc_python_out=../output/python/ --python_out=../output/python/
GO_GW_OUTPUT := ../output/go/

code:
	mkdir -p ../output/python
	python -m grpc_tools.protoc $(PYTHON_GRPC_FLAGS) $(GATEWAY_FLAGS) ../protos/modeldb/*.proto
	python -m grpc_tools.protoc $(PYTHON_GRPC_FLAGS) $(GATEWAY_FLAGS) ../protos/artifactstore/*.proto

	mv ../output/python/protos/* ../output/python/
	rm -rf ../output/python/protos
	touch ../output/python/__init__.py
	touch ../output/python/modeldb/__init__.py
	touch ../output/python/artifactstore/__init__.py

gw:
	mkdir -p ../output/go
	protoc $(GATEWAY_FLAGS) \
		--go_out=plugins=grpc:$(GO_GW_OUTPUT) \
		--grpc-gateway_out=logtostderr=true:$(GO_GW_OUTPUT) \
		../protos/modeldb/*.proto
	protoc $(GATEWAY_FLAGS) \
		--go_out=plugins=grpc:$(GO_GW_OUTPUT) \
		--grpc-gateway_out=logtostderr=true:$(GO_GW_OUTPUT) \
		../protos/artifactstore/*.proto

deps:
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
	go get -u github.com/golang/protobuf/protoc-gen-go