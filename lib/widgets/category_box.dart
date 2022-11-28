import 'package:flutter/material.dart';
import 'package:mrcoffee/Colores/degradado.dart';

class CategoryBox extends StatelessWidget {
  final IconData icon;
  final String title;
  CategoryBox({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only( right: 10),
      decoration: BoxDecoration(
          color: hexStringToColor('#f0f7f2'),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon( icon, size: 60, color: hexStringToColor('#4CAF50')),
          SizedBox( height: 20 ),
          Text(
            title ?? "",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 19),
          )
        ],
      ),
    );
  }
}
