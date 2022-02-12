import 'package:flutter/material.dart';
import 'package:wanderwith/utils/colors.dart';

class HomePagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = tealColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

  Path path0 = Path();
    path0.moveTo(0,size.height*0.9464286);
    path0.quadraticBezierTo(size.width*0.1543750,size.height*0.8853571,size.width*0.2062500,size.height*0.8585714);
    path0.cubicTo(size.width*0.2441667,size.height*0.8303571,size.width*0.3035417,size.height*0.8282143,size.width*0.3570833,size.height*0.8028571);
    path0.cubicTo(size.width*0.3925000,size.height*0.7803571,size.width*0.4643750,size.height*0.7696429,size.width*0.4989583,size.height*0.7714286);
    path0.cubicTo(size.width*0.5402083,size.height*0.7689286,size.width*0.6131250,size.height*0.7885714,size.width*0.6518750,size.height*0.8046429);
    path0.cubicTo(size.width*0.7087500,size.height*0.8371429,size.width*0.7672917,size.height*0.8464286,size.width*0.8050000,size.height*0.8732143);
    path0.quadraticBezierTo(size.width*0.8566667,size.height*0.8989286,size.width,size.height*0.9467857);
    path0.lineTo(size.width,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height*0.9464286);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
