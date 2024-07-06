import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Quadrocep extends StatefulWidget {
      Quadrocep({super.key});

      @override
    _QuadrocepState createState() => 
    _QuadrocepState();
} 
  class _QuadrocepState extends State<Quadrocep> {
  String resultado = 'Seu endereço será exibido aqui';
  TextEditingController txtcep = TextEditingController();
  // Função assíncrona para buscar o CEP
  Future <void> buscacep() async{
    //recebe o cep digitado
    String cep = txtcep.text;
    //monta a url com o cep
    String url = 'https://viacep.com.br/ws/$cep/json/';

    // Faz a requisição HTTP e espera pela resposta
    http.Response response = await http.get(Uri.parse(url));
    // Decodifica o JSON retornado
    Map<String, dynamic> dados = json.decode(response.body);
    // Verifica se o CEP é válido
    if (dados.containsKey('erro')) {
      setState(() {
        resultado = 'CEP não encontrado';
      });
    } else {
      // Atualiza o estado com o endereço retornado
      setState(() {
        resultado = '${dados['logradouro']}, ${dados['bairro']}, ${dados['localidade']} - ${dados['uf']}';
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Busca de endereço por CEP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      labelText: 'Digite o CEP',
                      labelStyle: TextStyle(
                        color: Colors.grey[700],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Buscar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Limpar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(36.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Text(resultado),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
