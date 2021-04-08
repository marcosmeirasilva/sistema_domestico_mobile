import 'package:flutter/material.dart';
import 'package:sistema_domestico_mobile/login/usuario.dart';
import 'package:sistema_domestico_mobile/usuarios/usuarios_bloc.dart';

class Usuarios extends StatefulWidget {
  @override
  _UsuariosState createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  final _bloc = UsuariosBloc();

  @override
  void initState() {
    super.initState();
    _buscarUsuarios();
  }

  _buscarUsuarios() async {
    await _bloc.buscarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuário"),
      ),
      body: _streamBuiler(),
    );
  }

  _streamBuiler() {
    return StreamBuilder(
      stream: _bloc.getStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Usuario> usuarios = snapshot.data;

        return Container(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              Usuario usuario = usuarios[index];

              return Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        usuario.nome,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        usuario.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
