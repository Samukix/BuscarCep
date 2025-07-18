import 'package:dio/dio.dart';
import 'dart:io';


void main () async {
   String? input = stdin.readLineSync();
   print ('Cep Desejado:  ${input}');

   if (input != null){
   var endereco = await getCep(input);
   } 
   
}

Future<void> getCep (String cep) async {
  final dio = Dio();
  final url = 'https://viacep.com.br/ws/$cep/json/';
  final response = await dio.get(url);
      
  if (response.statusCode == 200) {
    final data = response.data;
    print('Endereço:');
    print('${data['logradouro']}');
    print('${data['bairro']}');
    print('${data['estado']}');
    print('${data['cep']}');
  } else {
    print('Erro ao buscar cep: ${response.statusCode}');
  }

}
