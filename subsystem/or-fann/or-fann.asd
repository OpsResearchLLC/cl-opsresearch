;;;; or-fann.asd

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

(asdf:defsystem #:or-fann
  :description "Subsystem - Fast Artificial Neural Network Library"
  :author "Donald Anderson <dranderson@OpsResearch.com>"
  :license "GPL3" 
  :depends-on (#:cl-opsresearch #:cffi)
  :serial t
  :components ((:file "package")
                (:module swig
                  :serial t   
                  :components ((:file "fann"))) 
               (:file "or-fann")))

