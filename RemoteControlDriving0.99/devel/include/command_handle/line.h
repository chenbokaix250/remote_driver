// Generated by gencpp from file command_handle/line.msg
// DO NOT EDIT!


#ifndef COMMAND_HANDLE_MESSAGE_LINE_H
#define COMMAND_HANDLE_MESSAGE_LINE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace command_handle
{
template <class ContainerAllocator>
struct line_
{
  typedef line_<ContainerAllocator> Type;

  line_()
    : xpoint()
    , ypoint()
    , type(0)  {
    }
  line_(const ContainerAllocator& _alloc)
    : xpoint(_alloc)
    , ypoint(_alloc)
    , type(0)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _xpoint_type;
  _xpoint_type xpoint;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _ypoint_type;
  _ypoint_type ypoint;

   typedef int32_t _type_type;
  _type_type type;





  typedef boost::shared_ptr< ::command_handle::line_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::command_handle::line_<ContainerAllocator> const> ConstPtr;

}; // struct line_

typedef ::command_handle::line_<std::allocator<void> > line;

typedef boost::shared_ptr< ::command_handle::line > linePtr;
typedef boost::shared_ptr< ::command_handle::line const> lineConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::command_handle::line_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::command_handle::line_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::command_handle::line_<ContainerAllocator1> & lhs, const ::command_handle::line_<ContainerAllocator2> & rhs)
{
  return lhs.xpoint == rhs.xpoint &&
    lhs.ypoint == rhs.ypoint &&
    lhs.type == rhs.type;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::command_handle::line_<ContainerAllocator1> & lhs, const ::command_handle::line_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace command_handle

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::command_handle::line_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::command_handle::line_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::command_handle::line_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::command_handle::line_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::command_handle::line_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::command_handle::line_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::command_handle::line_<ContainerAllocator> >
{
  static const char* value()
  {
    return "19e372dcd9e76db80532a2b8e7a27932";
  }

  static const char* value(const ::command_handle::line_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x19e372dcd9e76db8ULL;
  static const uint64_t static_value2 = 0x0532a2b8e7a27932ULL;
};

template<class ContainerAllocator>
struct DataType< ::command_handle::line_<ContainerAllocator> >
{
  static const char* value()
  {
    return "command_handle/line";
  }

  static const char* value(const ::command_handle::line_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::command_handle::line_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] xpoint\n"
"float32[] ypoint\n"
"int32 type\n"
;
  }

  static const char* value(const ::command_handle::line_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::command_handle::line_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.xpoint);
      stream.next(m.ypoint);
      stream.next(m.type);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct line_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::command_handle::line_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::command_handle::line_<ContainerAllocator>& v)
  {
    s << indent << "xpoint[]" << std::endl;
    for (size_t i = 0; i < v.xpoint.size(); ++i)
    {
      s << indent << "  xpoint[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.xpoint[i]);
    }
    s << indent << "ypoint[]" << std::endl;
    for (size_t i = 0; i < v.ypoint.size(); ++i)
    {
      s << indent << "  ypoint[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.ypoint[i]);
    }
    s << indent << "type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.type);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COMMAND_HANDLE_MESSAGE_LINE_H