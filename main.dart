import 'package:flutter/material.dart';
import 'package:flutteragem/primeiratela.dart';
//import 'package:flutteragem/telafinal.dart';

void main() {


  runApp(

    MaterialApp(
      title: 'App_Prova',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const Cinefilos(),
      debugShowCheckedModeBanner: false
    )
  );
}

class Cinefilos extends StatelessWidget {
  const Cinefilos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinéfilos'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text("Clique para entrar..."),
          color: Colors.white24,

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => primeiraTela()),
            );
          },
        ),
      ),
    );
  }
}





