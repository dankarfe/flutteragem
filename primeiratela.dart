import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteragem/list.dart';
import 'package:flutteragem/telas.dart';
import 'package:flutteragem/telafinal.dart';
import 'package:flutteragem/database.dart';
//import 'package:flutteragem/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:sqflite/sqflite.dart';

class primeiraTela extends StatefulWidget {
  @override
  Cadastro createState() => Cadastro();
}

class Cadastro  extends State<primeiraTela> {
  var lista = <Lista>[];
  final edtTxtItemController = TextEditingController();
  final edtTxtQntController = TextEditingController();
  Color? corCard;
  BancoHelper dataBaseHelper = BancoHelper();

  Future<List<Lista>> fetchAll() async {
    return dataBaseHelper.getAllLista();
  }

  @override
  void initState() {
    Ccor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastros"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(labelText: "Título",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.deepPurpleAccent,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2,
                                  )
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent,
                                    width: 2,
                                  )),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(labelText: "Gênero",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.deepPurpleAccent,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2,
                                  )
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent,
                                    width: 2,
                                  )),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(labelText: "Data de lançamento",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.deepPurpleAccent,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2,
                                  )
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent,
                                    width: 2,
                                  )),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(labelText: "Diretor",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.deepPurpleAccent,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2,
                                  )
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent,
                                    width: 2,
                                  )),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(labelText: "Sinopse",
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.deepPurpleAccent,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                    width: 2,
                                  )
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent,
                                    width: 2,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:20, bottom: 20),
                            child: Container(
                                height: 40,
                                child: RaisedButton(
                                  child: const Text('Salvar!'),
                                  color: Colors.white24,
                                  onPressed: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CriarLista()),
                                    );
                                  },
                                )
                            ),
                          ),
                        ])))));
  }

  void Ccor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cor = prefs.getString('corCards') ?? false;
    print(cor);
    setState(() {
      Color? teste = Tela.mapColors[cor];
      corCard = teste ?? Colors.white;
    });
  }
  /*void preferencias(cor) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('corCards', cor).then((value) =>
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Tela.telaCadastro, (Route<dynamic> route) => false)   );
  }
  void getPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cor = prefs.getString('corCards') ?? listaCor.keys.first;
    print(cor);
    setState(() {
      teste = cor;
    });
  }*/
}