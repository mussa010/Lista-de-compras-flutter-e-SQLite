// import 'package:flutter/material.dart';

// import '../model/shoppingList.dart';
// import '../database/shoppingListDAO.dart';

// class CreatShoppingList extends StatefulWidget {
//   const CreatShoppingList({super.key});

//   @override
//   State<CreatShoppingList> createState() => _CreatShoppingList();
// }

// class _CreatShoppingList extends State<CreatShoppingList> {

//   dialogBox(context, titulo, mensagem) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: Text(titulo),
//         content: Text(mensagem),
//         actions: [
//           // TextButton(
//           //   onPressed: () => Navigator.pop(context, 'cancelar'),
//           //   child: const Text('cancelar'),
//           // ),
//           TextButton(
//             onPressed: () => Navigator.pop(context, 't1'),
//             child: const Text('ok'),
//           ),
//         ],
//       ),
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             'Lista de compra de ',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           backgroundColor: Colors.blue,
          
//         ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: FutureBuilder<List<User>>(
//           future: UserDAO().getAllUsers(),
//           builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot ) {
//             //Verificar se banco de dados existe
//             if(snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   User item = snapshot.data![index];
//                   if(Connection.isConnected() == false){
//                     dialogBox(context, 'Erro', 'Falha na conexão com banco de dados');
//                     Navigator.pop(context,'ok');
//                   }
//                   else{
//                     return Card(
//                     child: ListTile(

//                       leading: const Icon(Icons.person),
//                       title: 
//                         Text('${item.getId}\n${item.getName}\n${item.getEmail}'),
//                       subtitle: Text('Senha: ${item.getPassword}'),
//                     )
//                   );
//                   }
//                   return null;
//                 },
//               );
//             } else {

//             }
//             return const Center(child: CircularProgressIndicator());
//           },
//         )
//       )
//     );
//   }
// }