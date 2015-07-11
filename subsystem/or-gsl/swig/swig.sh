#!/bin/bash

swig -cffi interface.swig 
echo '(in-package #:gsl)' > gsl-fixed.lisp
cat gsl.lisp \
	| sed 's/swig-lispify "gsl_sf_bessel_J/swig-lispify "gsl_sf_bessel_jj/' \
	| sed 's/swig-lispify "gsl_sf_bessel_Y/swig-lispify "gsl_sf_bessel_yy/' \
	| sed 's/swig-lispify "gsl_sf_bessel_I/swig-lispify "gsl_sf_bessel_ii/' \
	| sed 's/swig-lispify "gsl_sf_bessel_K/swig-lispify "gsl_sf_bessel_kk/' \
	>> gsl-fixed.lisp
mv -f gsl-fixed.lisp gsl.lisp
