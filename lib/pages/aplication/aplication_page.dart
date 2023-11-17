import 'package:flutter/material.dart';
import 'package:shop_fblock/pages/aplication/aplication_widgents.dart';

class AplicationPage extends StatefulWidget {
  const AplicationPage({super.key});

  @override
  State<AplicationPage> createState() => _AplicationPageState();
}

class _AplicationPageState extends State<AplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(idx: 2),
        ),
      ),
    );
  }
}
