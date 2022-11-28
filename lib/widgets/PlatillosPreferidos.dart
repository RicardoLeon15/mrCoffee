import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mrcoffee/Colores/degradado.dart';

class PlatillosPreferidos extends StatefulWidget {
  const PlatillosPreferidos({Key? key}) : super(key: key);

  @override
  State<PlatillosPreferidos> createState() => _PlatillosPreferidosState();
}

class _PlatillosPreferidosState extends State<PlatillosPreferidos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Platillos").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          return Container(
            child: ListView(
              shrinkWrap: true,
              //scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((snap){
                return PlatilloPreferido(
                  urlImg: snap["Imagen"],
                  platillo: snap["Nombre"],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class PlatilloPreferido extends StatelessWidget {

  final String urlImg;
  final String platillo;
  const PlatilloPreferido({Key? key, required this.urlImg, required this.platillo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(
          color: hexStringToColor("#FFFFFF"),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ]
        ),
        child: SizedBox(
          width: 120,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(60.0),
                  child: Image.network(urlImg, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 5.0,),
              Text(platillo,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),)
            ],
          ),
        ),
      ),
      onTap: (){

      },
    );
  }
}
