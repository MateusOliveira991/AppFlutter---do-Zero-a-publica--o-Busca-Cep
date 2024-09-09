import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:busca_endereco/models/cep_model.dart';

class CepService {
  // Função para validar o CEP
  bool validarCep(String cep) {
    final RegExp cepExp = RegExp(r'^\d{8}$');
    return cepExp.hasMatch(cep);
  }

  // Função assíncrona para buscar o CEP
  Future<CepModel> buscarCep(String cep) async {
    String url = 'https://viacep.com.br/ws/$cep/json/';

    // Faz a requisição HTTP e espera pela resposta
    http.Response response = await http.get(Uri.parse(url));

    // Verifica o código de status da resposta
    if (response.statusCode == 200) {
      // Decodifica o JSON retornado
      Map<String, dynamic> dados = json.decode(response.body);

      // Retorna os dados ou erro
      if (dados.containsKey('erro')) {
        throw Exception('CEP não encontrado');
      } else {
        return CepModel.fromJson(json.decode(response.body));
      }
    } else {
      throw Exception('Erro ao buscar CEP: ${response.statusCode}');
    }
  }
}
