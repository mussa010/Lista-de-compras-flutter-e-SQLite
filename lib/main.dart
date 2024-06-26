import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova_parcial/view/testListView.dart';

import '../view/login.dart';
import '../view/createAccount.dart';
import '../view/aboutApp.dart';
import 'view/menuShoppingListView.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue

    )
  );

  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => const MainApp()));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de compras',
      debugShowCheckedModeBanner: false,

      //Rotas de navegação
      initialRoute: 't1',
      routes: {
        't1': (context) =>  const Login(),
        't2': (context) => const AboutApp(),
        't3':(context) =>  const CreateAccount(),
        't4': (context) => const TestListView(),
        't5' : (context) => const MenuShoppingListView(),
        't6' : (context) => const MenuShoppingListView(),
        // 't7' : (context) => const CreatShoppingList(),
        // 't8' : (context) => const MenuItemListView(),
        // 't9' : (context) => const CreatItemList(),
        // 't10' : (context) => const EditItemList(),
        // 't11' : (context) => const SearchShoppingByItem(),
        // 't12' : (context) => const EditShoppingList(),
      }

    );
  }
}