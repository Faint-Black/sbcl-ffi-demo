;; Define the filepaths to load the libraries
(sb-alien:load-shared-object "./my-lib-src/libfoo.so") ; local lib
(sb-alien:load-shared-object "libm.so.6")              ; system lib

;; (sb-alien:define-alien-routine ("LibFnName" my-lisp-wrapper-name) <return_type>
;;   (arg1 <arg1_type>)
;;   (arg2 <arg2_type>)
;;   ...
;;   (argN <argN_type>))
(sb-alien:define-alien-routine ("CheckParen" c-checkparen) sb-alien:boolean
  (str sb-alien:c-string))
(sb-alien:define-alien-routine ("log2" c-log2) sb-alien:double-float
  (str sb-alien:double-float))

;; Have fun using pre-compiled C functions inside Lisp!
(defun my-intlog2(NUM)
  (values (floor (c-log2 (coerce (cond
                                   ((stringp NUM) (values (read-from-string NUM)))
                                   (t NUM))
                                 'double-float)))))

;; Open a sbcl REPL and try it out yourself,
;; below are some examples:
;;
;; (my-intlog2 8)
;; (my-intlog2 8.4)
;; (my-intlog2 "8.4")
;; (c-checkparen "(+ (+ 1 2) (- 3 4))")
;; (c-checkparen "(+ (+ 1 2) (- 3 4)")
;; (c-checkparen "(a{b)c}")
;; (c-checkparen "({[({[({[ huzzah! ]})]})]})")
