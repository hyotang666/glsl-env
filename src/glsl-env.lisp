(in-package :cl-user)

(defpackage :glsl-env
  (:use :cl)
  (:export #:notation #:stage #:*environment*))

(in-package :glsl-env)

(defun glsl-variables ()
  (loop :for symbol :being :each :external-symbol :of :glsl-symbols.variables
        :collect symbol))

(defun glsl-functions ()
  (uiop:while-collecting (acc)
    (dolist
        (p
         '(glsl-symbols.functions glsl-symbols.operators
           glsl-symbols.vector-constructors glsl-symbols.matrix-constructors))
      (do-external-symbols (s p) (acc s)))))

(defun keyword<-glsl-type (glsl-type)
  (cond ;; Known guabages.
        ((equal "[vec4" glsl-type) :vec4)
        ((equal "[float" glsl-type) :float)
        ((equal "gl_DepthRangeParameters" glsl-type) :unknown)
        (t
         (let ((*package* (find-package :keyword)))
           (read-from-string glsl-type)))))

(defun glsl-variable-declarations ()
  (let ((types (make-hash-table))
        (stages (make-hash-table))
        (notations (make-hash-table)))
    (loop :for spec :in glsl-spec:*variables*
          :for stage = (getf spec :stage)
          :for symbol = (uiop:find-symbol* (getf spec :lisp-name) :glsl-symbols)
          :do (push symbol
                    (gethash (keyword<-glsl-type (getf spec :type)) types))
              (setf (gethash symbol notations) (getf spec :name))
          :if stage
            :do (push stage (gethash symbol stages)))
    (uiop:while-collecting (acc)
      (maphash (lambda (k v) (acc (list* 'type k v))) types)
      (maphash (lambda (k v) (acc (list* 'stage k v))) stages)
      (maphash (lambda (k v) (acc (list 'notation k v))) notations))))

(defun glsl-function-signatures ()
  (loop :for spec
             :in (append glsl-spec:*functions* glsl-spec:*operators*
                         glsl-spec:*vector-constructors*
                         glsl-spec:*matrix-constructors*)
        :for symbol = (uiop:find-symbol* (getf spec :lisp-name) :glsl-symbols)
        :with notations = (make-hash-table)
        :collect `(ftype (function
                          ,(mapcar
                             (lambda (spec)
                               (list (car spec)
                                     (keyword<-glsl-type (cadr spec))))
                             (getf spec :args))
                          ,(keyword<-glsl-type (getf spec :return)))
                         ,symbol)
          :into ftypes
        :do (setf (gethash symbol notations) (getf spec :name))
        :finally (return
                  (append ftypes
                          (loop :for symbol :being :each :hash-key :of
                                     notations :using (:hash-value notation)
                                :collect `(notation ,symbol ,notation))))))

(eprot:defenv :glsl
  :variable (glsl-variables)
  :function (glsl-functions)
  :declare (append (glsl-variable-declarations) (glsl-function-signatures))
  :handler
  ((stage (eprot::var-name &rest keyword) (decl env) (declare (ignore env))
    "Specify the variable can be refered only in STAGE."
    (eprot:decl-spec-bind (decl-name var &rest stages)
        decl
      (values :variable (list (list var decl-name stages)))))
   (notation (symbol string) (decl env) (declare (ignore env))
    "Specify the glsl notation of the lisp SYMBOL."
    (values :bind
            (eprot:decl-spec-bind (decl-name lisp-symbol glsl-name)
                decl
              (list (list lisp-symbol decl-name glsl-name)))))))