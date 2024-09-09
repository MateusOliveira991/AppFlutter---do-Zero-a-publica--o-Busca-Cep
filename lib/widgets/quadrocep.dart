import 'package:flutter/material.dart';
import 'package:busca_endereco/models/cep_model.dart';
import 'package:busca_endereco/services/cep_service.dart';

class Quadrocep extends StatefulWidget {
  const Quadrocep({super.key});

  @override
  QuadrocepState createState() => QuadrocepState();
}

class QuadrocepState extends State<Quadrocep> {
  String resultado = 'O endereço será exibido aqui';
  TextEditingController txtcep = TextEditingController();
  final CepService _cepService = CepService();

  // Função assíncrona para buscar o CEP
  Future<void> buscacep() async {
    String cep = txtcep.text.trim();

    if (!_cepService.validarCep(cep)) {
      setState(() {
        resultado = 'CEP inválido. Por favor, insira um CEP válido de 8 dígitos.';
      });
      return;
    }

    try {
      CepModel dados = await _cepService.buscarCep(cep);
      setState(() {
        resultado = '${dados.logradouro}, ${dados.bairro}, ${dados.localidade} - ${dados.uf}';
      });
    } catch (e) {
      setState(() {
        resultado = e.toString();
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
                    controller: txtcep,
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
                      onPressed: buscacep,
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
                      onPressed: () {
                        setState(() {
                          txtcep.clear();
                          resultado = 'O endereço será exibido aqui';
                        });
                      },
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
