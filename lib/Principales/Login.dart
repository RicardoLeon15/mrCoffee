import 'package:flutter/material.dart';
import '../Principales/reutilizables.dart';
import '../Principales/CambioContra.dart';
import '../Principales/Registro.dart';
import '../Colores/degradado.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("FF9800"),
              hexStringToColor("FFE0B2"),
              hexStringToColor("FFE0B2"),
              //hexStringToColor("F57C00")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/imagenes/logo.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Usuario", Icons.person_outline, false, email),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Contraseña", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Iniciar Sesion", () {}),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

Row signUpOption() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("No tienes cuenta?",
          style: TextStyle(color: Colors.black54)),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Registro()));
        },
        child: const Text(
          " Registrate",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Olvidaste tu contraseña?",
        style: TextStyle(color: Colors.black54),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword())),
    ),
  );
}
}

