// Auto-generated. Do not edit!

// (in-package info_test.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.mode = null;
      this.speed = null;
      this.gear = null;
      this.lb = null;
      this.hb = null;
      this.hnk = null;
      this.rotate = null;
      this.rearview = null;
      this.acc_p = null;
      this.clu_p = null;
      this.brk_p = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0;
      }
      if (initObj.hasOwnProperty('gear')) {
        this.gear = initObj.gear
      }
      else {
        this.gear = 0;
      }
      if (initObj.hasOwnProperty('lb')) {
        this.lb = initObj.lb
      }
      else {
        this.lb = 0;
      }
      if (initObj.hasOwnProperty('hb')) {
        this.hb = initObj.hb
      }
      else {
        this.hb = 0;
      }
      if (initObj.hasOwnProperty('hnk')) {
        this.hnk = initObj.hnk
      }
      else {
        this.hnk = 0;
      }
      if (initObj.hasOwnProperty('rotate')) {
        this.rotate = initObj.rotate
      }
      else {
        this.rotate = 0;
      }
      if (initObj.hasOwnProperty('rearview')) {
        this.rearview = initObj.rearview
      }
      else {
        this.rearview = 0;
      }
      if (initObj.hasOwnProperty('acc_p')) {
        this.acc_p = initObj.acc_p
      }
      else {
        this.acc_p = 0;
      }
      if (initObj.hasOwnProperty('clu_p')) {
        this.clu_p = initObj.clu_p
      }
      else {
        this.clu_p = 0;
      }
      if (initObj.hasOwnProperty('brk_p')) {
        this.brk_p = initObj.brk_p
      }
      else {
        this.brk_p = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Info
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.int16(obj.mode, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.int16(obj.speed, buffer, bufferOffset);
    // Serialize message field [gear]
    bufferOffset = _serializer.int16(obj.gear, buffer, bufferOffset);
    // Serialize message field [lb]
    bufferOffset = _serializer.int16(obj.lb, buffer, bufferOffset);
    // Serialize message field [hb]
    bufferOffset = _serializer.int16(obj.hb, buffer, bufferOffset);
    // Serialize message field [hnk]
    bufferOffset = _serializer.int16(obj.hnk, buffer, bufferOffset);
    // Serialize message field [rotate]
    bufferOffset = _serializer.int16(obj.rotate, buffer, bufferOffset);
    // Serialize message field [rearview]
    bufferOffset = _serializer.int16(obj.rearview, buffer, bufferOffset);
    // Serialize message field [acc_p]
    bufferOffset = _serializer.int16(obj.acc_p, buffer, bufferOffset);
    // Serialize message field [clu_p]
    bufferOffset = _serializer.int16(obj.clu_p, buffer, bufferOffset);
    // Serialize message field [brk_p]
    bufferOffset = _serializer.int16(obj.brk_p, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Info
    let len;
    let data = new Info(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gear]
    data.gear = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [lb]
    data.lb = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [hb]
    data.hb = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [hnk]
    data.hnk = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [rotate]
    data.rotate = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [rearview]
    data.rearview = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [acc_p]
    data.acc_p = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [clu_p]
    data.clu_p = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [brk_p]
    data.brk_p = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'info_test/Info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ae84e5fb4747e05b67e7c377e5c6576';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int16 mode
    int16 speed
    int16 gear
    int16 lb
    int16 hb
    int16 hnk
    int16 rotate
    int16 rearview
    int16 acc_p
    int16 clu_p
    int16 brk_p
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Info(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0
    }

    if (msg.gear !== undefined) {
      resolved.gear = msg.gear;
    }
    else {
      resolved.gear = 0
    }

    if (msg.lb !== undefined) {
      resolved.lb = msg.lb;
    }
    else {
      resolved.lb = 0
    }

    if (msg.hb !== undefined) {
      resolved.hb = msg.hb;
    }
    else {
      resolved.hb = 0
    }

    if (msg.hnk !== undefined) {
      resolved.hnk = msg.hnk;
    }
    else {
      resolved.hnk = 0
    }

    if (msg.rotate !== undefined) {
      resolved.rotate = msg.rotate;
    }
    else {
      resolved.rotate = 0
    }

    if (msg.rearview !== undefined) {
      resolved.rearview = msg.rearview;
    }
    else {
      resolved.rearview = 0
    }

    if (msg.acc_p !== undefined) {
      resolved.acc_p = msg.acc_p;
    }
    else {
      resolved.acc_p = 0
    }

    if (msg.clu_p !== undefined) {
      resolved.clu_p = msg.clu_p;
    }
    else {
      resolved.clu_p = 0
    }

    if (msg.brk_p !== undefined) {
      resolved.brk_p = msg.brk_p;
    }
    else {
      resolved.brk_p = 0
    }

    return resolved;
    }
};

module.exports = Info;
