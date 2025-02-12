#include <pybind11/pybind11.h>
#include <a/a.h>

PYBIND11_MODULE(_a, m) {
  m.def("a",&a);
}
