import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Platillo extends StatelessWidget {
  final QueryDocumentSnapshot data;
  const Platillo({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 300,
          child: Image.network(data["Imagen"],width: double.infinity,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
