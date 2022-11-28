import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrcoffee/widgets/PedidosenCurso.dart';
import 'package:mrcoffee/widgets/PlatillosPreferidos.dart';

import '../../widgets/Platillos.dart';
import '../../widgets/category_box.dart';


class Menu extends StatefulWidget {
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          PedidoEnCurso(),
                          SizedBox(height: 20),
                          Text( "Platillos Populares", style: TextStyle( color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox( height: 10),
                          PlatillosPreferidos(),
                          SizedBox( height: 30),
                          Text( "Platillos", style: TextStyle( color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),),
                          SizedBox( height: 20),
                          Platillos(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

