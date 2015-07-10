;;;; problem.lisp

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
;;;; GNU Lesser General Public License for more details.
;;;; 
;;;; You should have received a copy of the GNU General Public License
;;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;; 
;;;; ;;;;; END LICENSE BLOCK ;;;;;

(in-package #:or-glpk)

(defclass Problem (or-milp:Problem)(
	(glp-prob :reader glp-prob :initarg glp-prob :initform (glp:glp-create-prob))))

(defmethod initialize-instance :after ((p Problem) &key (name nil))
  (when name (glp:glp-set-prob-name (glp-prob p) name )))

(defmethod release ((problem Problem))
	(glp:glp-delete-prob (glp-prob problem)))

(defmethod name-of ((problem Problem))
  (glp:glp-get-prob-name (glp-prob problem)))

(defmethod read-mps ((problem Problem) path &key format)
  (if (eq format :fixed)
    (glp:glp-read-mps (glp-prob problem) glp:+GLP-MPS-DECK+ (cffi:null-pointer) (namestring path))
    (glp:glp-read-mps (glp-prob problem) glp:+GLP-MPS-FILE+ (cffi:null-pointer) (namestring path))))

(defmethod write-mps ((problem Problem) path &key format)
  (if (eq format :fixed)
    (glp:glp-write-mps (glp-prob problem) glp:+GLP-MPS-DECK+ (cffi:null-pointer) (namestring path))
    (glp:glp-write-mps (glp-prob problem) glp:+GLP-MPS-FILE+ (cffi:null-pointer) (namestring path))))

(defmethod read-cplex-lp ((problem Problem) path)
  (glp:glp-read-lp (glp-prob problem) (cffi:null-pointer) (namestring path)))

(defmethod write-cplex-lp ((problem Problem) path)
  (glp:glp-write-lp (glp-prob problem) (cffi:null-pointer) (namestring path)))


(defmacro with-problem ((var &rest init-options) &body body)
    (let ((obj (gensym)))
      `(let (,var ,obj)
         (unwind-protect
             (progn (setq ,obj (make-instance 'problem ,@init-options)
                          ,var ,obj)
                    ,@body)
           (unless (null ,obj)
             (release ,obj))))))
