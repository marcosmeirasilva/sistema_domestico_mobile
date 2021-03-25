import 'dart:async';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _streamController = StreamController<String>();
  String _nome;

  @override
  void initState() {
    super.initState();

    _esperarDados();
  }

  _esperarDados() async {
    await Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        this._nome = "Nicolly";
        _streamController.add(this._nome);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue,
      child: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Tem erro');
            return Center(
                child: Text(
              "Ocorreu um erro",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ));
          }
          if (!snapshot.hasData) {
            print('Não tem dados');
            return Center(child: Text("Aguarde..."));
          }
          print('Tem dados');
          return Center(child: Text(_nome));
        },
      ),
    );
  }
}

class I {}
