class Lista{
  int? id;
  String? nome;
  String? genero;
  int? datalancamento;
  String? diretor;
  String? sinopse;


  Lista({ this.id, this.nome, this.genero, this.datalancamento, this.diretor, this.sinopse});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nome': nome,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
  Lista.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    genero = map['genero'];
    datalancamento = map['datalancamento'];
    diretor = map['diretor'];
    sinopse = map['sinopse'];
  }



}