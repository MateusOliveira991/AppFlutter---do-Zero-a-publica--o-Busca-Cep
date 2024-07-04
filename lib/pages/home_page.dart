import 'package:flutter/material.dart';
import 'package:your_app_buscaenderecoporcep/widgets/app_images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: const Text(
      //     'Busca Endereço por CEP',
      //   ),
      // ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AppImages.onde,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Center(
            child: Text(
              'Busca de endereço por cep',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Digite o CEP',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buscar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Limpar'),
                  
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
