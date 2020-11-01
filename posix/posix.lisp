(in-package posix)

(cffi:defcfun ("getpid" getpid) pid-t
  "getpid() returns the process ID (PID) of the calling process. This is often used by routines that generate unique temporary filenames.")

(cffi:defcfun ("sigfillset" sigfillset) :int
  "sigfillset() initializes the signal set set to include all of the defined signals. The return value is always 0."
  (set (:pointer (:struct sigset-t))))

(cffi:defcfun ("sigprocmask" sigprocmask) :int
  "sigprocmask() is used to fetch and/or change the signal mask of the calling thread. The signal mask is the set of signals whose delivery is currently blocked for the caller."
  (how :int) (set (:pointer (:struct sigset-t))) (oldset (:pointer (:struct sigset-t))))

(cffi:defcfun ("fork" fork) pid-t
  "fork() creates a new process by duplicating the calling process. The new process is referred to as the child process.  The calling process is referred to as the parent process.")

(cffi:defcfun ("execve" execve) :int
  "execve() executes the program pointed to by filename. filename must be either a binary executable, or a script starting with a line of the form: #! interpreter [optional-arg]"
  (filename :string) (argv (:pointer (:pointer :char))) (envp (:pointer (:pointer :char))))

(cffi:defcfun ("setsid" setsid) pid-t
  "setsid() creates a new session if the calling process is not a process group leader.  The calling process is the leader of the new session (i.e., its session ID is made the same as its process ID). The calling process also becomes the process group leader of a new process group in the session (i.e., its process group ID is made the same as its process ID).")

(cffi:defcfun ("setpgid" setpgid) :int
  "getpgid() returns the PGID of the process specified by pid.  If pid is zero, the process ID of the calling process is used.  (Retrieving the PGID of a process other than the caller is rarely necessary, and the POSIX.1 getpgrp() is preferred for that task.)"
  (pid pid-t) (pgid pid-t))

(cffi:defcfun ("wait" wait) :int
  "The wait() system call suspends execution of the calling thread until one of its children terminates."
  (wstatus (:pointer :int)))
