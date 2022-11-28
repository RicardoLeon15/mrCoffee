import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/reutilizables.dart';
import 'Login.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController nombre = TextEditingController();
  TextEditingController usuario = TextEditingController();
  TextEditingController pass = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  RegistrarUsuario() async {
    try{
      await firebase.collection('Usuarios').doc().set({

        "nombre":nombre.text,
        "usuario":usuario.text,
        "contrasena":pass.text
      });
    }
    catch(e){
      print("error" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.15, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/imagenes/logo.png"),
                const SizedBox(
                  height: 5,
                ),
                reusableTextField("Nombre",Icons.person_outline,false,nombre),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Usuario",Icons.person_outline,false,usuario),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Contraseña",Icons.person_outline,false,pass),
                const SizedBox(
                  height: 30,
                ),
                firebaseUIButton(context, "Registrar", (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword( email: usuario.text, password: pass.text).then((value) {
                    print("Created New Account");
                    RegistrarUsuario();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Row registroR() {
    return  Row(
      children: <Widget>[
        Expanded(
          child: Text('Deliver features faster', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
