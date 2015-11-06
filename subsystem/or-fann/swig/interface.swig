
%module fann

%feature("export");

%feature("intern_function","1");

%include "patched/2.2.0/doublefann.h"
%include "/usr/local/include/fann.h"