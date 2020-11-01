(defsystem "init"
  :author "Jarrod Jeffrey Ingram <jarrod.jeffi@gmail.com>"
  :maintainer "Jarrod Jeffrey Ingram <jarrod.jeffi@gmail.com>"
  :license "GPLv3+"
  :version "0.1.0"
  :homepage "https://github.com/lispkit/init"
  :bug-tracker "https://github.com/lispkit/init/issues"
  :source-control (:git "git@github.com:lispkit/init")
  :description "An init process for LispKit Linux"
  :defsystem-depends-on ("cffi-grovel")
  :depends-on ("cffi")
  :serial t
  :components
  ((:file "package")
   (:module "posix"
    :depends-on ("package")
    :components
    ((:cffi-grovel-file "grovel")
     (:file "posix")))
   (:file "init" :depends-on ("posix"))))
