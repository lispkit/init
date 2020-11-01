(in-package init)

(defun main ()
  "Main is an init (short for initialization) which is the first process started during booting of the computer system. Init is a daemon process that continues running until the system is shut down. It is the direct or indirect ancestor of all other processes and automatically adopts all orphaned processes. Init is started by the kernel during the booting process; a kernel panic will occur if the kernel is unable to start it. Init is typically assigned process identifier 1."
  (cffi:with-foreign-objects ((set '(:struct posix:sigset-t))
			      (status 'posix:pid-t))
    (when (eq (posix:getpid) 1)
      (posix:sigfillset set)
      (posix:sigprocmask posix:+sig-block+ set 0)
      (if (not (eq (posix:fork) 0))
	  (loop do (posix:wait status))
	  (cffi:with-foreign-objects ((argv ':string 2)
				      (envp ':string 1))
	    (posix:sigprocmask posix:+sig-unblock+ set 0)
	    (posix:setsid)
	    (posix:setpgid 0 0)
	    (setf (cffi:mem-aref argv ':string 0) "rc")
	    (setf (cffi:mem-aref argv ':string 1) 0)
	    (setf (cffi:mem-aref envp ':string 0) 0)
	    (posix:execve "/etc/rc" argv envp))))))
