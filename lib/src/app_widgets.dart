import 'package:flutter/material.dart';
import 'package:your_app_buscaenderecoporcep/src/pages/home_page.dart';
import 'package:your_app_buscaenderecoporcep/src/widgets/colors.dart';


  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca por CEP',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/home', 
      routes: {
        '/': (context) => const HomePage(), 
        // '/home': (context) => const HomePage(), 
        
      },
    );
  }
}

        
