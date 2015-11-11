;;;; parameters.lisp

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

(in-package #:or-fann)
 
(defmethod print-parameters ((net Network))
  (fann:fann-print-parameters (fann-net net)))

(defmethod get-num-input ((net Network))
  (fann:fann-get-num-input (fann-net net)))

(defmethod get-total-neurons ((net Network))
  (fann:fann-get-total-neurons (fann-net net)))

(defmethod get-total-connections ((net Network))
  (fann:fann-get-total-connections (fann-net net)))

(defmethod get-connection-rate ((net Network))
  (fann:fann-get-connection-rate (fann-net net)))

(defmethod get-num-layers ((net Network))
  (fann:fann-get-num-layers (fann-net net)))

(defmethod get-network-type ((net Network))
  (cffi:foreign-enum-keyword 'fann_nettype_enum (cffi:pointer-address (fann:fann-get-network-type (fann-net net)))))

(defmethod get-layer-array ((net Network))
  (let ((n (get-num-layers net)))
    (cffi::with-foreign-object
      (array :uint n)
      (fann:fann-get-layer-array (fann-net net) array)
      (loop for i from 0 below n
            collect (cffi:mem-aref array :uint i)))))

(defmethod get-bias-array ((net Network))
  (let ((n (get-num-layers net)))
    (cffi::with-foreign-object
      (array :int n)
      (fann:fann-get-bias-array (fann-net net) array)
      (loop for i from 0 below n
            collect (cffi:mem-aref array :int i)))))

