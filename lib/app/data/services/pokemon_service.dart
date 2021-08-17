import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class PokemonService{

var baseUrl = 'https://pokeapi.co/';

Future getPokemon() async {
  var url = Uri.parse(baseUrl);
  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
    } else {
      print('Falha ao receber os dados: ${response.statusCode}.');
    }
  } catch (e) {
    print(e);
  }
}

}
