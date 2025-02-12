This is a demo for using scikit-build-core, cmake and python virtual environments in unison to support multiple python packages each with native code and python bindings.

usage:

1. create and activate a virtual environment.
2. export `LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VIRTUAL_ENV/lib`. This lets python find shared libraries we install into the virtual environment.
3. export `CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$VIRTUAL_ENV/cmake`. This lets python find cmake packages we install into the virtual environment.
4. pip install pybind11 and scikit-build-core
5. move into project a and pip install .
6. check that python -c 'import a.a' works
7. move into project b and run cmake .; make


