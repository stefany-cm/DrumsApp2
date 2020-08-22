// To parse this JSON data, do
//
//     final respSoundsAndSymbol = respSoundsAndSymbolFromJson(jsonString);

import 'dart:convert';

RespSoundsAndSymbol respSoundsAndSymbolFromJson(String str) =>
    RespSoundsAndSymbol.fromJson(json.decode(str));

String respSoundsAndSymbolToJson(RespSoundsAndSymbol data) =>
    json.encode(data.toJson());

class RespSoundsAndSymbol {
  RespSoundsAndSymbol({
    this.sounds,
    this.symbol,
  });

  List<Sound> sounds;
  List<Symbol> symbol;

  factory RespSoundsAndSymbol.fromJson(Map<String, dynamic> json) =>
      RespSoundsAndSymbol(
        sounds: List<Sound>.from(json["sounds"].map((x) => Sound.fromJson(x))),
        symbol:
            List<Symbol>.from(json["symbol"].map((x) => Symbol.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sounds": List<dynamic>.from(sounds.map((x) => x.toJson())),
        "symbol": List<dynamic>.from(symbol.map((x) => x.toJson())),
      };
}

class Sound {
  Sound({
    this.id,
    this.sound,
    this.name,
    this.icon,
  });

  int id;
  String sound;
  String name;
  String icon;

  factory Sound.fromJson(Map<String, dynamic> json) => Sound(
        id: json["id"],
        sound: json["sound"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sound": sound,
        "name": name,
        "icon": icon,
      };
}

class Symbol {
  Symbol({
    this.id,
    this.symbolIcon,
    this.condiciones,
  });

  int id;
  String symbolIcon;
  String condiciones;

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        id: json["id"],
        symbolIcon: json["symbol_icon"],
        condiciones: json["condiciones"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol_icon": symbolIcon,
        "condiciones": condiciones,
      };
}
