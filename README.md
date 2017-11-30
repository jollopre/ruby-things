# ruby-things

## Load specific ruby file into irb

```
	irb -r PATH_TO_FILE
```

## Execute tests

Please, make sure the docker image is built first by typing:

```
	docker build -t ruby .
```

and after create a container for that image, connect to it and execute the tests:

```
	docker run --rm -it -v "$PWD":/usr/src/app ruby /bin/bash
	rake test
```
