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
;;;; GNU Lesser General Public License for more details.
;;;; 
;;;; You should have received a copy of the GNU Lesser General Public License
;;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;; 
;;;; ;;;;; END LICENSE BLOCK ;;;;;

(in-package #:or-glpk)

(defun test-all ()
  (5am:explain! (5am:run 'test-all)))

(5am:test test-all

	(with-problem (problem :name "test-name" )
      (5am:is ( equal (glp:get-prob-name (glp-prob problem)) "test-name"))
	)

	(with-problem (problem :name "test-mpl" )
      (5am:is ( equal (glp:get-prob-name (glp-prob problem)) "test-mpl"))
	))