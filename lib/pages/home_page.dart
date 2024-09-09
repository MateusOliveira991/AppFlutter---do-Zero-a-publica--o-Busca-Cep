import 'package:flutter/material.dart';
import 'package:busca_endereco/widgets/quadrocep.dart';
import 'package:busca_endereco/widgets/iconemap.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 35),
              child: Quadrocep(), 
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Iconemap(), 
            ),
          ],
        ),
      ),
    );
  }
}
