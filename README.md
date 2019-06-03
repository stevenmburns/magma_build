# magma_build
Simple repo to build Stanford AHA in a docker container

To build the image run:

```bash
docker build -t magma_image .
```

To run tests (currently not working):

```bash
docker run -it magma_image /bin/bash -c "source stanford/bin/activate && cd magma && pytest tests"
```