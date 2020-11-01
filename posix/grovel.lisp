(in-package posix)

(include "signal.h")
(include "unistd.h")

(constant (+sig-block+ "SIG_BLOCK"))
(constant (+sig-unblock+ "SIG_UNBLOCK"))
(ctype pid-t "pid_t")
(cstruct sigset-t "sigset_t")
