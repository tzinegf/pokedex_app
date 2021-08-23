import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';

class PokemonService {
  var baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future getFilteredPokemon(String param) async {
    var url = Uri.parse('$baseUrl$param');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        return Pokemon.fromJson(result); 
      } else {
        return 0;
      }
    } catch (e) {
      throw ('Erro: $e');
    }
  }
}
