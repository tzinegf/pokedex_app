class Pokemon {
  List<Abilities>? abilities;
  int? height;
  int? id;
  String? name;
  Sprites? sprites;
  int? weight;

  Pokemon(
      {this.abilities,
      this.height,
      this.id,
      this.name,
      this.sprites,
 
      this.weight});

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = [];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    height = json['height'];
    
    id = json['id'];
    
    name = json['name'];
    
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }

   
    data['height'] = this.height;
   
    data['id'] = this.id;
  
    data['name'] = this.name;
  
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
   
   
    data['weight'] = this.weight;
    return data;
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? new Ability.fromJson(json['ability']) : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability!.toJson();
    }
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Sprites {

  Other? other;


  Sprites(
      {
      this.other,
      });

  Sprites.fromJson(Map<String, dynamic> json) {
 
    other = json['other'] != null ? new Other.fromJson(json['other']) : null;
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  
    if (this.other != null) {
      data['other'] = this.other!.toJson();
    }
    return data;
  }
}

class Other {
  
  OfficialArtwork? officialArtwork;

  Other({this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['official-artwork'] != null
        ? new OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.officialArtwork != null) {
      data['official-artwork'] = this.officialArtwork!.toJson();
    }
    return data;
  }
}
class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}


/*class Pokemon {

  List<Abilities>? abilities;
  String? name;
  Sprites? sprites;

  Pokemon(
      {this.abilities,
      this.name,
      this.sprites,
    });

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = [];
      json['abilities'].forEach((v) {
        abilities!!.add(new Abilities.fromJson(v));
      });
    }
   
   
   
    name = json['name'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities!!.map((v) => v!.toJson()).toList();
    }
    data['name'] = this.name;
   
    if (this.sprites != null) {
      data['sprites'] = this.sprites!!.toJson();
    }
    return data;
  }
}

class Abilities {
  Ability? ability;
  

  Abilities({this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? new Ability.fromJson(json['ability']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ability != null) {
      data['ability'] = this.ability!!.toJson();
    }
    return data;
  }
}

class Ability {
  String? name;


  Ability({this.name});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Sprites {

  Other? other;
  

  Sprites(
      {this.other,
      });

  Sprites.fromJson(Map<String, dynamic> json) {
   
    other = json['other'] != null ? new Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.other != null) {
      data['other'] = this.other!!.toJson();
    }
    return data;
  }
}

class Other {

  OfficialArtwork? officialArtwork;

  Other({this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['official-artwork'] != null
        ? new OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.officialArtwork != null) {
      data['official-artwork'] = this.officialArtwork!  !.toJson();
    }
    return data;
  }
}
class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}
*/