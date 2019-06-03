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

We have more or less the same probem with:

```bash
docker build -t magma_minimal_image -f Dockerfile-minimal .
```

Here is the current log message (for the minimal version):
```
(general) smburns@smburns-XPS-13-9370:~/Stanford/magma_build$ docker run -it magma_minimal_image /bin/bash -c "source stanford/bin/activate && cd magma && pytest tests"
ImportError while loading conftest '/magma/conftest.py'.
conftest.py:3: in <module>
    import magma.backend.coreir_
magma/backend/coreir_.py:11: in <module>
    import coreir
/stanford/lib/python3.6/site-packages/coreir/__init__.py:5: in <module>
    from coreir.global_value import COREGlobalValue_p
/stanford/lib/python3.6/site-packages/coreir/global_value.py:1: in <module>
    from .base import CoreIRType
/stanford/lib/python3.6/site-packages/coreir/base.py:2: in <module>
    from .lib import libcoreir_c
/stanford/lib/python3.6/site-packages/coreir/lib.py:27: in <module>
    libcoreir_sim_c = load_shared_lib("libcoreirsim-c")
/stanford/lib/python3.6/site-packages/coreir/lib.py:19: in load_shared_lib
    return cdll.LoadLibrary(libpath)
/usr/lib/python3.6/ctypes/__init__.py:426: in LoadLibrary
    return self._dlltype(name)
/usr/lib/python3.6/ctypes/__init__.py:348: in __init__
    self._handle = _dlopen(self._name, mode)
E   OSError: libcoreirsim.so: cannot open shared object file: No such file or directory
```
