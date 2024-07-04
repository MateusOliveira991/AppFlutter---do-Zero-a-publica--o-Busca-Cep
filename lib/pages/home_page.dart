import 'package:flutter/material.dart';
import 'package:your_app_buscaenderecoporcep/widgets/app_images.dart';
import 'package:your_app_buscaenderecoporcep/widgets/quadrocep.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AppImages.onde,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 410,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Quadrocep(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


