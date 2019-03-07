#!/bin/bash
#export GOPATH=~/go

GATEWAY_FLAGS := -I.. -I/usr/local/include -I$(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis

PYTHON_GRPC_FLAGS := --grpc_python_out=../output/python/ --python_out=../output/python/
GO_GW_OUTPUT := ../output/go/

code:
	# note code paths are wrt scripts dir
	mkdir -p ../output/python
	python -m grpc_tools.protoc $(PYTHON_GRPC_FLAGS) $(GATEWAY_FLAGS) ../protos/public/modeldb/*.proto
	python -m grpc_tools.protoc $(PYTHON_GRPC_FLAGS) $(GATEWAY_FLAGS) ../protos/public/artifactstore/*.proto
	# python -m grpc_tools.protoc $(PYTHON_GRPC_FLAGS) $(GATEWAY_FLAGS) ../protos/public/uac/*.proto

	touch ../output/python/protos/public/__init__.py
	touch ../output/python/protos/public/modeldb/__init__.py
	touch ../output/python/protos/public/artifactstore/__init__.py
	# touch ../output/python/protos/public/uac/__init__.py

gw:
	mkdir -p ../output/go
	protoc $(GATEWAY_FLAGS) \
		--go_out=plugins=grpc:$(GO_GW_OUTPUT) \
		--grpc-gateway_out=logtostderr=true:$(GO_GW_OUTPUT) \
		../protos/public/modeldb/*.proto
	protoc $(GATEWAY_FLAGS) \
		--go_out=plugins=grpc:$(GO_GW_OUTPUT) \
		--grpc-gateway_out=logtostderr=true:$(GO_GW_OUTPUT) \
		../protos/public/artifactstore/*.proto

deps:
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
	go get -u github.com/golang/protobuf/protoc-gen-go