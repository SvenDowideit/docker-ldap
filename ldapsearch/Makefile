.PHONY: run debug clean exec ldapssearch client build


run: build clean
	docker run -it --rm ldapsearch

build:
	docker build -t ldapsearch .
