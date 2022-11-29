import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mrcoffee/Colores/degradado.dart';

class CafeteriasPreferidas extends StatefulWidget {
  const CafeteriasPreferidas({Key? key}) : super(key: key);

  @override
  State<CafeteriasPreferidas> createState() => _CafeteriasPreferidasState();
}

class _CafeteriasPreferidasState extends State<CafeteriasPreferidas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Cafeteria").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          return Container(
            height: 220,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((snap){
                return CafeteriaPreferida(
                  urlImg: snap["Imagen"],
                  nombre: snap["Nombre"],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class CafeteriaPreferida extends StatelessWidget {

  final String urlImg;
  final String nombre;
  const CafeteriaPreferida({Key? key, required this.urlImg, required this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
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
          width: 160,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(80.0),
                  child: Image.network(urlImg, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 5.0,),
              Container(
                padding: EdgeInsets.only(left: 6,right: 6),
                child: Text(nombre,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),),
              ),
            ],
          ),
        ),
      ),
      onTap: (){

      },
    );
  }
}
