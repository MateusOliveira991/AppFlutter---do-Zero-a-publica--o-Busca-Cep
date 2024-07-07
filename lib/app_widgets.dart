import 'package:flutter/material.dart';
import 'package:your_app_buscaenderecoporcep/pages/home_page.dart';
import 'package:your_app_buscaenderecoporcep/core/colors.dart';


  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Busca por CEP',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/home', 
      routes: {
        '/': (context) => const HomePage(), 
        '/home': (context) => const HomePage(), 
        
      },
    );
  }
}

        
