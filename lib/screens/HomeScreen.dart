import 'package:flutter/material.dart';
import 'package:neuro_notes/widgets/node/NodeWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      alignment: Alignment.center,
      child: NodeWidget(),
    );
  }
}
