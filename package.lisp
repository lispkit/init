(defpackage #:posix
  (:use #:cffi-grovel #:cffi)
  (:export :getpid :sigfillset :sigprocmask :fork :execve :setsid
	   :setpgid :wait :sigset-t :pid-t :+sig-block+
	   :+sig-unblock+))

(defpackage #:init
  (:use #:cl #:cffi #:posix)
  (:export :main))
