(defpackage :cl-yesql/lang
  (:use :cl :serapeum :cl-yesql)
  (:shadow :read-module)
  (:export :read-module :module-progn)
  (:documentation "Define a reader and expander for concrete Yesql languages to inherit."))
(in-package :cl-yesql/lang)

(defun read-module (path stream)
  `(module-progn
     ,@(yesql-reader path stream)))

(defmacro module-progn (&body body)
  (let ((exports (mapcar (op `(function ,(second _))) body)))
    `(simple-module ,exports
       ,@body)))
