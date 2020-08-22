import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
            "https://www.google.com/maps/vt/data=Ipd-2VInRqxwfYUOazZCWVhw5a3kYLGq3OxIobu3vqqZYdYQISeJGnKGc-R3RhHWsfPjl_f2feVwxDRW3s9wwQz3dvb_629u-B70EX3Vo9p3j9Q4eAiswK3St2tC7m36BQhyaFH7-B6vYIum8LDxH5XsFmvp5JgrSdgfbB7LqMNIOP4fxiXyZ_5NTXqJhQFwsVfsoCbFPtRUnqYsrZxDc7UA9t6wmTz4pGFMcHNUGRiATw"));
  }
}
