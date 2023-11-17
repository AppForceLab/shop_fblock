import 'package:flutter/material.dart';

Widget buildPage({required int idx}) {
  List<Widget> widget = [
    const Center(child: Text('home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Profile')),
  ];

  return widget[idx];
}
