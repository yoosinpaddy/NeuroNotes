import 'package:flutter/material.dart';

import 'NodePainter.dart';
import 'dart:math' as Math;

class NodeWidget extends StatelessWidget {
  final bool hasChild;
  final Widget? child;

  NodeWidget({required this.hasChild, this.child});

  @override
  Widget build(BuildContext context) {
    double width = Math.min(MediaQuery.sizeOf(context).width, 100);
    double height = Math.min(MediaQuery.sizeOf(context).height, 100);
    double rightPadding = ((width/2.0) - Math.sqrt(2 * Math.pow(width/2, 2)) / 2) - 4;
    double verticalPadding = ((height/2.0)  - Math.sqrt(2 * Math.pow(height/2, 2)) / 2) - 4;
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: NodePainter(hasChild: hasChild),
          child: SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: width,
                    height: height,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned(
                  right: rightPadding,
                  bottom: verticalPadding,
                  child: GestureDetector(
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        border: Border.all(color: Colors.white, width: 1),

                      ),
                      child: Icon(Icons.menu, size: 15, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  right: rightPadding,
                  top: verticalPadding,
                  child: GestureDetector(
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Icon(Icons.add, size: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasChild && child != null)
          Positioned(
            bottom: -60,
            child: Column(
              children: [
                CustomPaint(
                  size: const Size(2, 50),
                  painter: LinePainter(),
                ),
                child!,
              ],
            ),
          ),
      ],
    );
  }
}