build:
	docker build -t obs-plugin-builder .
	docker run --rm -v "$(PWD)":/plugin obs-plugin-builder
