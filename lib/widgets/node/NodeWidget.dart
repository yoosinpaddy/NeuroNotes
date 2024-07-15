import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'NodePainter.dart';

class NodeWidget extends StatefulWidget {
  final IconData menuIconData;
  final IconData plusIconData;
  final bool hasChild;

  NodeWidget({ this.menuIconData = Icons.menu,  this.plusIconData = Icons.add, this.hasChild = false});

  @override
  _NodeWidgetState createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  ui.Image? menuIcon;
  ui.Image? plusIcon;

  @override
  void initState() {
    super.initState();
    loadIcons();
  }

  Future<void> loadIcons() async {
    menuIcon = await iconToImage(widget.menuIconData);
    plusIcon = await iconToImage(widget.plusIconData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (menuIcon == null || plusIcon == null) {
      return Container(); // Return an empty container while the icons are loading.
    }

    return CustomPaint(
      painter: NodePainter(menuIcon: menuIcon!, plusIcon: plusIcon!, hasChild: widget.hasChild),
      size: Size(100, 100), // You can adjust the size as needed.
    );
  }
}

Future<ui.Image> iconToImage(IconData iconData, {double size = 100.0, Color color = Colors.black}) async {
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final paint = Paint()..color = color;
  final textPainter = TextPainter(textDirection: TextDirection.ltr);

  textPainter.text = TextSpan(text: String.fromCharCode(iconData.codePoint), style: TextStyle(fontSize: size, fontFamily: iconData.fontFamily, color: color));
  textPainter.layout();
  textPainter.paint(canvas, Offset.zero);

  final picture = pictureRecorder.endRecording();
  final image = await picture.toImage(size.toInt(), size.toInt());

  return image;
}
