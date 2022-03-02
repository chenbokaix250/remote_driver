# G29 按键对应情况

```c++
sensor_msgs/Joy.msg
# Reports the state of a joysticks axes and buttons.
Header header           # timestamp in the header is the time the data is received from the joystick
float32[] axes          # the axes measurements from a joystick
int32[] buttons         # the buttons measurements from a joystick 

```


## axes[0-5]

| axes | 范围| 默认值|描述|备注|
|----|----|----|----|----|
|0|-1~1|0|转向|左正右负|
|1|-1~1|-1|离合|踩下|
|2|-1~1|-1|油门|踩下|
|3|-1~1|-1|刹车|踩下|
|4|-1&1|0|方向左右|左1右-1|
|5|-1&1|0|方向上下|上1下-1|


---


## buttons[0-24]
|buttons|范围|默认|描述|备注|
|----|----|----|----|----|
|0|0,1|0|×|按下|
|1|0,1|0|口|按下|
|2|0,1|0|△|按下|
|3|0,1|0|〇|按下|
|4|0,1|0|右拨片|按下|
|5|0,1|0|左拨片|按下|
|6|0,1|0|R2|按下|
|7|0,1|0|L2|按下|
|8|0,1|0|SHARE|按下|
|9|0,1|0|OPTIONS|按下|
|10|0,1|0|R3|按下|
|11|0,1|0|L3|按下|
|12|0,1|0|D1|直接挂入|
|13|0,1|0|D2|直接挂入|
|14|0,1|0|D3|直接挂入|
|15|0,1|0|D4|直接挂入|
|16|0,1|0|D5|直接挂入|
|17|0,1|0|D6|直接挂入|
|18|0,1|0|R1|按下挂入|
|19|0,1|0|＋|按下|
|20|0,1|0|－|按下|
|21|0,1|0|右旋|旋转结束时恢复0|
|22|0,1|0|左旋|旋转结束时恢复0|
|23|0,1|0|↵|按下|
|24|0,1|0|PlayStation|按下|

