
(cl:in-package :asdf)

(defsystem "remote_truck-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Info" :depends-on ("_package_Info"))
    (:file "_package_Info" :depends-on ("_package"))
    (:file "line" :depends-on ("_package_line"))
    (:file "_package_line" :depends-on ("_package"))
  ))