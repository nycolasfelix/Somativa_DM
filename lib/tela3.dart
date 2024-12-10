import 'package:flutter/material.dart';

class Telacliente extends StatefulWidget {
  const Telacliente({super.key});

  @override
  State<Telacliente> createState() => _TelaclienteState();
}

class _TelaclienteState extends State<Telacliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas Extras"),
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Materias(nomeMateria: "Banco de Dados", qtde: 10, data: "12/12/2024"),
            Materias(nomeMateria: "Desenvolvimento Mobile", qtde: 10, data: "15/12/2024"),
            Materias(nomeMateria: "Desenvolvimento Web", qtde: 15, data: "20/12/2024"),
            Materias(nomeMateria: "IA", qtde: 10, data: "25/12/2024"),
          ],
        ),
      ),
    );
  }
}

class Materias extends StatefulWidget {
  final String nomeMateria;
  final int qtde;
  final String data; // Novo campo para a data

  Materias({
    required this.nomeMateria,
    required this.qtde,
    required this.data, // Inicialização do campo
  });

  @override
  State<Materias> createState() => _MateriasState();
}

double? total;

class _MateriasState extends State<Materias> {
  int cont = 0;

  _limpar() {
    setState(() {
      cont = 0;
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blue,
                ),
              ),
              Positioned(
                top: 50, // Posição do texto no eixo Y
                left: 27, // Posição do texto no eixo X
                child: Text(
                  'Tarefa de',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10), // Espaço entre os widgets
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.nomeMateria} ",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                "Data: ${widget.data}", // Exibindo a data
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Row(
                children: [
                  Text("Qtde:", style: TextStyle(fontSize: 18),),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cont++;
                      });
                    },
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10), // Espaço entre os botões
              ElevatedButton(
                onPressed: _limpar,
                child: Text(
                  "Esvaziar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
