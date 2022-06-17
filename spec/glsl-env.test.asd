; vim: ft=lisp et
(in-package :asdf)
(defsystem "glsl-env.test"
  :version
  "0.0.0"
  :depends-on
  (:jingoh "glsl-env")
  :components
  ((:file "glsl-env"))
  :perform
  (test-op (o c) (declare (special args))
   (apply #'symbol-call :jingoh :examine :glsl-env args)))