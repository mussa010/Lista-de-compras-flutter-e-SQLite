import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
import '../database/connection.dart';
import '../database/userDAO.dart';
import '../model/user.dart';

class TestListView extends StatefulWidget {
  const TestListView({super.key});

  @override
  State<TestListView> createState() => _TestListView();
}

class _TestListView extends State<TestListView> {
  dialogBox(context, titulo, mensagem) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          // TextButton(
          //   onPressed: () => Navigator.pop(context, 'cancelar'),
          //   child: const Text('cancelar'),
          // ),
          TextButton(
            onPressed: () => Navigator.pop(context, 't1'),
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }
   
  
  final allUsers = UserDAO.getAllUsers();
  Future<int> tamUsers =  UserDAO.lenght();

  @override
  Widget build(BuildContext context) {
    if(tamUsers == 0) {
      return Scaffold(appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tela de lista de usuários',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: const Text('Não há usuário cadastrado', style: TextStyle(
            color: Colors.white, 
            backgroundColor: Colors.blue)),
        )
      );
    }
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tela de lista de usuários',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.blue,
          
        ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<List<User>>(
          future: allUsers,
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot ) {
            //Verificar se banco de dados existe
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  User user = snapshot.data![index];
                  if(Connection.isConnected() == false){
                    dialogBox(context, 'Erro', 'Falha na conexão com banco de dados');
                    Navigator.pop(context,'ok');
                  }
                  else{
                    return Card(
                    child: ListTile(

                      leading: const Icon(Icons.person),
                      title: 
                        Text('${user.getId()}\n${user.getName()}\n${user.getEmail()}'),
                      subtitle: Text('Senha: ${user.getPassword()}'),
                    )
                  );
                  }
                  return null;
                },
              );
            } 
            return Container(
              alignment: Alignment.center,
                child: const Text('Não há usuário cadastrado',
                style: TextStyle(
                  backgroundColor: Colors.blue,
                  color: Colors.white
                ),
              )
            );
          },
        )
      )
    );
  }
}