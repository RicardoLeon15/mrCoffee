import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Colores/degradado.dart';

class PedidoEnCurso extends StatefulWidget {
  const PedidoEnCurso({Key? key}) : super(key: key);

  @override
  State<PedidoEnCurso> createState() => _PedidoEnCursoState();
}

class _PedidoEnCursoState extends State<PedidoEnCurso> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Pedido").snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          return ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: snapshot.data!.docs.map((snap) {
                return FutureBuilder(
                    future: FirebaseFirestore.instance.collection("Cafeteria").doc(snap["Cafeteria"]).get(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print(snap["Hora"].toDate().toString());
                        return PedidoActivo(
                          cafeteria: snapshot.data["Nombre"],
                          hora: snap["Hora"],
                          status: snap["Status"],
                          urlImg: snapshot.data["Imagen"],
                        );
                      } else if (snapshot.hasError) {
                        return const Icon(Icons.error_outline);
                      } else {
                        return const Center(
                            child:CircularProgressIndicator()
                        );
                      }
                    });
              }).toList()
          );
        },
      ),
    );
  }
}

class PedidoActivo extends StatelessWidget {

  final String cafeteria;
  final Timestamp hora;
  final String status;
  final String urlImg;
  const PedidoActivo({Key? key, required this.cafeteria, required this.hora, required this.status, required this.urlImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: hexStringToColor('#FFFFFF'),
        borderRadius: const BorderRadius.all(Radius.circular(20.0),),
        boxShadow: [
          const BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            padding: const EdgeInsets.only(top: 10.0,left: 20.0, bottom: 5.0),
            child: const Text("Pedido Activo",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(48),
                          child: Image.network(urlImg, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                ),
                Flexible(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text( cafeteria, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox( height: 6),
                          Text(hora.toDate().toString(), style: const TextStyle( fontWeight: FontWeight.normal, fontSize: 12),),
                          const SizedBox( height: 10),
                          Text(status, style: const TextStyle( fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20)),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                                  onPressed: () {

                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

