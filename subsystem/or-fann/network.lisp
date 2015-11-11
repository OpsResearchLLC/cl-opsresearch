;;;; network.lisp

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

(cffi:defcenum fann_nettype_enum :FANN-NETTYPE-LAYER :FANN-NETTYPE-SHORTCUT)

;; COMMON BASE
(defclass Network (cl-opsresearch:Problem)
  ((name :reader name)
   (fann-net :reader fann-net)))

(defmethod release ((net Network))
  (fann:fann-destroy (fann-net net)))

(defmethod randomize-weights ((net Network) min max)
  (fann:fann-randomize-weights (fann-net net) min max))

(defmethod run ((net Network) inputs)
  (or-cffi:with-foreign-alloc
    (array :double :initial-contents inputs)
    (fann:fann-run (fann-net net) array)))

(defmethod initialize-instance :after ((net Network) &key (net-type :STANDARD) (name "Anonymous") (layers nil) (connection-rate nil))
  (unless layers (error "The keyword argument :layers must be provides for an OR-FANN:NETWORK !!!"))
  (or-cffi:with-foreign-alloc 
    (array :unsigned-int :initial-contents layers)
    (setf (slot-value net 'name) name) 
    (setf (slot-value net 'fann-net)
          (cond 
            ((eq net-type :SPARSE)
             (unless connection-rate (error "The keyword argument :connection-rate must be provided for a :SPARSE type of OR-FANN:NETWORK !!!"))
             (fann:fann-create-sparse-array connection-rate (length layers) array))
            ((eq net-type :SHORTCUT) (fann:fann-create-shortcut-array (length layers) array))
            ((eq net-type :STANDARD) (fann:fann-create-standard-array (length layers) array))
            (T (error (format nil "The keyword argument :net-type is unrecognized: ~A" net-type)))))))

(defmacro with-network ((var &rest init-options) &body body)
  (let ((obj (gensym)))
    `(let (,var ,obj)
       (unwind-protect
         (progn (setq ,obj (make-instance 'Network ,@init-options)
                      ,var ,obj)
                ,@body)
         (unless (null ,obj)
           (release ,obj))))))

