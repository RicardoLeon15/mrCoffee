import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrcoffee/Pages/Cliente/home.dart';
import '../widgets/reutilizables.dart';
import '../Pages/Registro.dart';
import 'CambioContra.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                    pass),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Iniciar Sesion", () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: pass.text).then((value) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      }).onError((error, stackTrace) {
                    print("Error");
                  });
                }),
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

