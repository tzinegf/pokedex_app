import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';

class PokemonService {
  var baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future getPokemon(String pokemon) async {
    var url = Uri.parse('$baseUrl$pokemon');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body);
        
        Pokemon pokemon = Pokemon.fromJson(json);
          print('/******${pokemon.name}***********/');

        return pokemon;
      } else {
        print('Falha ao receber os dados: ${response.statusCode}.');
        //return('Falha ao receber os dados: ${response.statusCode}.');
      }
    } catch (e) {
      return (e);
    }
  }
}
