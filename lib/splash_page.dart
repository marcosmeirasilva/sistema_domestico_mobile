import 'package:flutter/material.dart';
import 'package:sistema_domestico_mobile/login/login_page.dart';
import 'package:sistema_domestico_mobile/login/usuario.dart';
import 'package:sistema_domestico_mobile/usuarios/usuarios_show.dart';
import 'package:sistema_domestico_mobile/utils/nav.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future futureA = Future.delayed(Duration(seconds: 3));

    // Usuario
    Future<Usuario> futureB = Usuario.get();

    Future.wait([futureA, futureB]).then((List values) {
      Usuario user = values[1];
      print("Gruta    $user");

      if (user == null) {
        print("Gruta entrei no if do login");
        push(context, LoginPage(), replace: true);
      } else {
        print("Gruta entrei no else do login");
        push(context, Usuarios(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
