import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dish_tile.dart';

class Platillos extends StatefulWidget {
  const Platillos({Key? key}) : super(key: key);

  @override
  State<Platillos> createState() => _PlatillosState();
}

class _PlatillosState extends State<Platillos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Platillos").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          return ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: snapshot.data!.docs.map((snap) {
                return DishTile(nombre: snap["Nombre"]);
              }).toList()
          );
        },
      ),
    );
  }
}












