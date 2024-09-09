import 'package:flutter/material.dart';
import 'package:busca_endereco/pages/home_page.dart';
import 'package:busca_endereco/core/colors.dart';



  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Busca por CEP',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: const Color.fromARGB(255, 16, 122, 197),
      ),
      initialRoute: '/home', 
      routes: {
        '/': (context) => const HomePage(), 
        '/home': (context) => const HomePage(), 
       

        
      },
    );
  }
}

        
