;; Auto-generated. Do not edit!


(when (boundp 'remote_truck::line)
  (if (not (find-package "REMOTE_TRUCK"))
    (make-package "REMOTE_TRUCK"))
  (shadow 'line (find-package "REMOTE_TRUCK")))
(unless (find-package "REMOTE_TRUCK::LINE")
  (make-package "REMOTE_TRUCK::LINE"))

(in-package "ROS")
;;//! \htmlinclude line.msg.html


(defclass remote_truck::line
  :super ros::object
  :slots (_xpoint _ypoint _type _delay ))

(defmethod remote_truck::line
  (:init
   (&key
    ((:xpoint __xpoint) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ypoint __ypoint) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:type __type) 0)
    ((:delay __delay) 0)
    )
   (send-super :init)
   (setq _xpoint __xpoint)
   (setq _ypoint __ypoint)
   (setq _type (round __type))
   (setq _delay (round __delay))
   self)
  (:xpoint
   (&optional __xpoint)
   (if __xpoint (setq _xpoint __xpoint)) _xpoint)
  (:ypoint
   (&optional __ypoint)
   (if __ypoint (setq _ypoint __ypoint)) _ypoint)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:delay
   (&optional __delay)
   (if __delay (setq _delay __delay)) _delay)
  (:serialization-length
   ()
   (+
    ;; float32[] _xpoint
    (* 4    (length _xpoint)) 4
    ;; float32[] _ypoint
    (* 4    (length _ypoint)) 4
    ;; int32 _type
    4
    ;; int32 _delay
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _xpoint
     (write-long (length _xpoint) s)
     (dotimes (i (length _xpoint))
       (sys::poke (elt _xpoint i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _ypoint
     (write-long (length _ypoint) s)
     (dotimes (i (length _ypoint))
       (sys::poke (elt _ypoint i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _type
       (write-long _type s)
     ;; int32 _delay
       (write-long _delay s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _xpoint
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _xpoint (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _xpoint i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _ypoint
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ypoint (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ypoint i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _delay
     (setq _delay (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get remote_truck::line :md5sum-) "d5f2a218ee1b0d9478d7b95fc7aca5e5")
(setf (get remote_truck::line :datatype-) "remote_truck/line")
(setf (get remote_truck::line :definition-)
      "float32[] xpoint
float32[] ypoint
int32 type
int32 delay

")



(provide :remote_truck/line "d5f2a218ee1b0d9478d7b95fc7aca5e5")


