import 'package:flutter/material.dart';
import 'package:flutteragem/telas.dart';
import 'package:flutteragem/database.dart';
import 'package:flutteragem/list.dart';
import 'package:flutteragem/database.dart';
import 'package:sqflite/sqflite.dart';


class telaCriarLista extends StatefulWidget {
  @override
  _telaCriarListaState createState() => _telaCriarListaState();
}

class _telaCriarListaState extends State<telaCriarLista> {
  BancoHelper dataBase_test = BancoHelper();
  List<Lista> lista = [];
  TextEditingController _textFieldController = TextEditingController();

  Future<List<Lista>> fetchAllListasDeFilmes() async {
    return dataBase_test.getAllLista();
  }

  @override
  void initState() {
    super.initState();

    dataBase_test.getAllLista().then((value) {
      lista = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Filmes'),
      ),
      body: FutureBuilder<List<Lista>>(
        future: fetchAllListasDeFilmes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  List<Lista>? itensList = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32, top: 8),
                    child: Card(
                        elevation: 8.0,
                        child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  lista.removeAt(index);
                                });
                              },
                            ),
                            onTap: (){
                              print('click');
                              Navigator.pushNamed(context, Tela.telaCadastro,arguments:itensList?[index].id );
                            },
                            leading: Text('${index + 1}'),
                            title: Text('${itensList?[index].nome}'))),
                  );
                });
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }
          return new Container(
            alignment: AlignmentDirectional.center,
            child: new CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Nova Lista de Filmes'),
              content: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "Cinefilos"),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: ()async  {
                    await dataBase_test.insert(Lista(nome:_textFieldController.text));
                    setState(() {

                    });
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
  }


