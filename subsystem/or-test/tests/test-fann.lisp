;;;; test.lisp

;;;; ;;;;; BEGIN LICENSE BLOCK ;;;;;
;;;; 
;;;; Copyright (C) 2015 OpsResearch LLC (a Delaware company)
;;;; 
;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU General Public License, version 3,
;;;; as published by the Free Software Foundation.
;;;; 
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU General Public License for more details.
;;;; 
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;; 
;;;; ;;;;; END LICENSE BLOCK ;;;;;

(in-package #:or-test)

(defun test-fann ()
  (5am:explain! (5am:run 'test-fann)))

(5am:test test-fann
          (or-fann:with-network 
            (net :name "Standard" :layers '(5 4 5))
            (or-fann:randomize-weights net 1.0D0 1.1D0)
            (or-fann:run net '(1.1D0 2.2D0 3.3D0 4.4D0 5.5D0))
            (5am:is (equal (or-fann:name net) "Standard"))
            (5am:is (equal (or-fann:get-network-type net) :FANN-NETTYPE-LAYER))) 
          
          (or-fann:with-network 
            (net :name "Sparse" :net-type :SPARSE :connection-rate 0.5 :layers '(5 4 5))
            (or-fann:randomize-weights net 1.0D0 1.1D0)
            (or-fann:run net '(1.1D0 2.2D0 3.3D0 4.4D0 5.5D0))
            (5am:is (equal (or-fann:name net) "Sparse"))
            (5am:is (equal (or-fann:get-network-type net) :FANN-NETTYPE-LAYER))) 
          
          (or-fann:with-network 
            (net :name "Shortcut" :net-type :SHORTCUT :layers '(5 4 5))
            (or-fann:randomize-weights net 1.0D0 1.1D0)
            (or-fann:run net '(1.1D0 2.2D0 3.3D0 4.4D0 5.5D0))
            (5am:is (equal (or-fann:name net) "Shortcut"))
            (5am:is (equal (or-fann:get-network-type net) :FANN-NETTYPE-SHORTCUT)))) 


