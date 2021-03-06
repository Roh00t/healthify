import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconWidget  extends StatelessWidget{
  final IconData icon;
  final Color color;

  const IconWidget({
    Key key,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(shape: BoxShape.circle,color: color,),child: Icon(icon,color: Colors.white,),
  );

}