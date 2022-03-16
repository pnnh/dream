all : build_server copy_web

DIR := $(CURDIR)

setup :
	-mkdir $(DIR)/gen
	-mkdir $(DIR)/build
	-echo "package gen\nvar RunVersion = \"`openssl rand -base64 3 | md5sum | cut -c1-8`\"" > $(DIR)/gen/gen.go

build_server : setup
	GOOS=linux go build -o build/dream dream/main

copy_web :
	-cd $(DIR) && cp -r main/web build

clean :
	-rm -f ./build