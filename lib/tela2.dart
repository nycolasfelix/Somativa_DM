import 'package:flutter/material.dart';

class TelaMateriascadastro extends StatefulWidget {
  const TelaMateriascadastro({super.key});

  @override
  State<TelaMateriascadastro> createState() => _TelaMateriascadastroState();
}

class _TelaMateriascadastroState extends State<TelaMateriascadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciador de Task"),
        backgroundColor: Colors.blue[600],
      ),
      body: Column(
        children: [
          Materias(nomeMateria: "Banco de Dados", qtde: 10, data: "12/12/2024"),
          Materias(nomeMateria: "Desenvolvimento Mobile", qtde: 10, data: "15/12/2024"),
          Materias(nomeMateria: "Desenvolvimento Web", qtde: 15, data: "20/12/2024"),
          Materias(nomeMateria: "IA", qtde: 10, data: "25/12/2024"),
        ],
      ),
    );
  }
}

class Materias extends StatefulWidget {
  final String nomeMateria;
  final int qtde;
  final String data;

  Materias({required this.nomeMateria, required this.qtde, required this.data});
  @override
  State<Materias> createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adicionando espaçamento vertical entre os elementos.
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.purple[300],
                ),
              ),
              Positioned(
                top: 50, // Posição do texto no eixo Y
                left: 20, // Posição do texto no eixo X
                child: Text(
                  'Atribuir Task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20), // Espaçamento horizontal entre os widgets.
          Expanded( // Usado para permitir que a coluna ocupe o espaço restante.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.nomeMateria}", style: TextStyle(fontSize: 18)),
                Text("Quantidade $cont", style: TextStyle(fontSize: 18)),
                Text(
                  "Data: ${widget.data}", // Exibindo a data
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Qtde:", style: TextStyle(fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cont++;
                          });
                        },
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cont--;
                          });
                        },
                        child: Icon(Icons.restore, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
