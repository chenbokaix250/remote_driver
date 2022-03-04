// Auto-generated. Do not edit!

// (in-package remote_truck.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class line {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.xpoint = null;
      this.ypoint = null;
      this.type = null;
    }
    else {
      if (initObj.hasOwnProperty('xpoint')) {
        this.xpoint = initObj.xpoint
      }
      else {
        this.xpoint = [];
      }
      if (initObj.hasOwnProperty('ypoint')) {
        this.ypoint = initObj.ypoint
      }
      else {
        this.ypoint = [];
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type line
    // Serialize message field [xpoint]
    bufferOffset = _arraySerializer.float32(obj.xpoint, buffer, bufferOffset, null);
    // Serialize message field [ypoint]
    bufferOffset = _arraySerializer.float32(obj.ypoint, buffer, bufferOffset, null);
    // Serialize message field [type]
    bufferOffset = _serializer.int32(obj.type, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type line
    let len;
    let data = new line(null);
    // Deserialize message field [xpoint]
    data.xpoint = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [ypoint]
    data.ypoint = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [type]
    data.type = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.xpoint.length;
    length += 4 * object.ypoint.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'remote_truck/line';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '19e372dcd9e76db80532a2b8e7a27932';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] xpoint
    float32[] ypoint
    int32 type
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new line(null);
    if (msg.xpoint !== undefined) {
      resolved.xpoint = msg.xpoint;
    }
    else {
      resolved.xpoint = []
    }

    if (msg.ypoint !== undefined) {
      resolved.ypoint = msg.ypoint;
    }
    else {
      resolved.ypoint = []
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    return resolved;
    }
};

module.exports = line;
