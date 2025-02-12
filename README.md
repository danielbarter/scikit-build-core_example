This is a demo for using scikit-build-core, cmake and python virtual environments in unison to support multiple python packages each with native code and python bindings.

The main ideas:

- we store shared libraries in `$VIRTUAL_ENV/lib`. 
- we store headers in `$VIRTUAL_ENV/include`.
- we store cmake package files in `$VIRTUAL_ENV/cmake`. For all but the most complex builds, these files can just be empty. It is their name and location which is important.

usage:

1. create and activate a virtual environment.
2. pip install pybind11 and scikit-build-core

3. set some environment variables:
```

# This lets python find shared libraries we install into the virtual environment.
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VIRTUAL_ENV/lib 


# This lets python find cmake packages we install into the virtual environment.
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$VIRTUAL_ENV/cmake


This lets cmake find our pip install pybind. This isn't required if you have a system pybind11 installed
export pybind11_DIR=$VIRTUAL_ENV/lib/python*/site-packages/pybind11/share/cmake/pybind11.
```

4. move into project a and pip install .
5. check that python -c 'import a.a' works
6. move into project b and run cmake .; make. Check that ./b works



tested on debian and nixos.
