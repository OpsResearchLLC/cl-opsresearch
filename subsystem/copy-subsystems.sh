#!/bin/sh

rm -rf ./or-gsl
cp -r ../../or-gsl .
rm -rf ./or-gsl/.git

rm -rf ./or-glpk
cp -r ../../or-glpk .
rm -rf ./or-glpk/.git