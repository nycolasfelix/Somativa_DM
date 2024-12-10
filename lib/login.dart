import 'package:e_commerce/tela2.dart';
import 'package:e_commerce/tela3.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();

  TextEditingController senha = TextEditingController();

  int? op;

  _verificarlogin(){
    if(user.text == "professor" && senha.text =="1234" && op==1){
      print("Login administrador");
      Navigator.push(context, MaterialPageRoute(builder:(context)=> TelaMateriascadastro()));
    }
    else if(user.text == "nycolas" && senha.text =="1234" && op==2){
      print("Login aluno");
      Navigator.push(context, MaterialPageRoute(builder:(context)=> Telacliente()));
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[600],
        title: Text("Study Manager"),
        
      ),
      body: Center(
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              
              width: 200,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
      
                 TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(width: 50),
                ),          
                labelText: "Digite o usuário",         
                labelStyle: TextStyle(backgroundColor: Colors.white),),
                
                controller: user,
                
                 
              ),
               TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(width: 50),
              ),
              labelText: "Digite sua senha",),
              controller: senha,
              obscureText: true,
              obscuringCharacter: "*",
               
            ),
      
                ],
              ),
              
              
             
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Radio(value: 1, groupValue: op, onChanged: (value){
                  setState(() {
                    op= value;
                  });
                 
                }),
                Text("Professor",style: TextStyle(fontSize: 18),),
                
                Radio(value: 2, groupValue: op, onChanged: (value){
              setState(() {
                op= value;
              });
            
            }),
            Text("Aluno",style: TextStyle(fontSize: 18),),
              ],
            ),
            
           ElevatedButton(onPressed: _verificarlogin, child: Text("Entrar", style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
  
