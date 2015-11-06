;;;; or-test.asd

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

(asdf:defsystem #:or-test
  :description "Tests for the system cl-opsresearch"
  :author "Donald Anderson <dranderson@opsresearch.com>"
  :license "GPL3"
  :depends-on(
	#:fiveam
	#:cl-opsresearch
	#:or-glpk
	#:or-gsl
  #:or-fann)
  :serial t
  :components (
	(:file "package")
	(:module tests
  		:serial t
		:components ((:file "test-opsresearch")
					(:file "test-gsl")
          (:file "test-glpk")
          (:file "test-fann")
					(:file "test")))
	(:file "or-test")))

