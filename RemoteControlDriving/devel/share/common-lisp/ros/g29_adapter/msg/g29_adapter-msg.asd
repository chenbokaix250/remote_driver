
(cl:in-package :asdf)

(defsystem "g29_adapter-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Info" :depends-on ("_package_Info"))
    (:file "_package_Info" :depends-on ("_package"))
  ))