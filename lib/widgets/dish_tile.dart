import 'package:flutter/material.dart';
import 'package:mrcoffee/Colores/degradado.dart';

class DishTile extends StatelessWidget {


  final String nombre;
  const DishTile({Key? key, required this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 10),
      child: Row(
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: hexStringToColor('#4CAF50'),
                    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topLeft: Radius.circular(10))
                ),
                width: double.infinity,
                padding: EdgeInsets.all(0),
                height: 130,
                child: Image.asset( "assets/food2.jpeg"),
              )
          ),
          Flexible(
              flex: 2,
              child: Container(
                height: 130,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, top: 20, right: 10),
                decoration: BoxDecoration(
                  color: hexStringToColor('#f0f7f2'),
                  borderRadius: BorderRadius.only( bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text( nombre, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox( height: 6),
                    Text("Macarrão ao molho branco, fughi e cheiro verde das montanhas", style: TextStyle( fontWeight: FontWeight.normal, fontSize: 12),),
                    SizedBox( height: 10),
                    Text("\$ 19,0", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20)),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
