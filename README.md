This is a demo for using scikit-build-core, cmake and python virtual environments in unison to support multiple python packages each with native code and python bindings.

usage:

1. create and activate a virtual environment.
2. export `LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VIRTUAL_ENV/lib`. This lets python find shared libraries we install into the virtual environment.
3. export `CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$VIRTUAL_ENV/cmake`. This lets python find cmake packages we install into the virtual environment.
4. export pybind11_DIR=$VIRTUAL_ENV/lib/python*/site-packages/pybind11/share/cmake/pybind11. This lets cmake find our pip install pybind. This isn't required if you have a system pybind11 installed.
5. pip install pybind11 and scikit-build-core
6. move into project a and pip install .
7. check that python -c 'import a.a' works
8. move into project b and run cmake .; make


