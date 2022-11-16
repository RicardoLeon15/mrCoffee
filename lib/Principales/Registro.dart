import 'package:flutter/material.dart';
import 'package:mrcoffee/Principales/Login.dart';
import '../Principales/reutilizables.dart';
import '../Principales/CambioContra.dart';
import '../Colores/degradado.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController email = TextEditingController();
  TextEditingController _usuarioR = TextEditingController();
  TextEditingController _contraR = TextEditingController();
  TextEditingController _correoR = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("FF9800"),
              hexStringToColor("FFE0B2"),
              hexStringToColor("FFE0B2"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.15, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/imagenes/logo.png"),
                const SizedBox(
                  height: 5,
                ),
                reusableTextField("Nombre",Icons.person_outline,false,_correoR),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Usuario",Icons.person_outline,false,_correoR),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Contraseña",Icons.person_outline,false,_contraR),
                const SizedBox(
                  height: 30,
                ),
                firebaseUIButton(context, "Registrar", (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
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
