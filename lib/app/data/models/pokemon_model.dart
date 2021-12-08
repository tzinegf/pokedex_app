
class Pokemon {
  Sprites? sprites;
  List<Moves>? moves;
  List<Types>? types;
  String? comments;
  bool? captured;
  bool? observed;
  bool? favorited;
  int? height;
  int? id;
  String? name;
  int? weight;

  Pokemon(
      {
      this.sprites,
      this.comments,
      this.captured,
      this.observed,
      this.favorited,
      this.height,
      this.id,
      this.name,
      this.weight,
      this.moves,
      this.types
      });

  Pokemon.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    captured = json['captured'];
    observed = json['observed'];
    favorited = json['favorited'];
    height = json['height'];
    id = json['id'];
    name = json['name'];
    weight = json['weight'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
        if (json['moves'] != null) {
      moves = [];
      json['moves'].forEach((v) {
        moves!.add(new Moves.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['captured'] = this.captured;
    data['observed'] = this.observed;
    data['favorited'] = this.favorited;
    data['height'] = this.height;
    data['id'] = this.id;
    data['name'] = this.name;
    data['weight'] = this.weight;
     if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    return data;
  }


}
class Moves {
  Move? move;

  Moves({this.move});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? new Move.fromJson(json['move']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move!.toJson();
    }
    return data;
  }
}
class Sprites {
  Other? other;

  Sprites({this.other});

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

class Move {
  String? name;

  Move({this.name});

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Types {
  int? slot;
  Move? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Move.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}