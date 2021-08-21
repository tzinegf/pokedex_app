final String tablePokemons = 'pokemons';



class PokemonHelp {
   int? id;
   String? name;
   String? comments;
   int? captured;
   int? observed;
   String? sprites;

  PokemonHelp({
    this.id,
    this.name,
    this.comments,
    this.captured,
    this.observed, 
    this.sprites,
  });

   PokemonHelp.fromJson(Map<String, dynamic> json) {
   
    id = json['id'];
    name = json['name'];
    comments = json['comments'];
    captured = json['captured'];
    observed = json['observed'];
    sprites =json['sprites'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['comments'] = this.comments;
    data['captured'] = this.captured;
    data['observed'] = this.observed;
    data['sprites'] = this.sprites;

    return data;
  }
}




