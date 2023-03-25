import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    if (query.isEmpty && query.length < 3) {
      print('Query needs to be at least 3 chars');
      return Future.value([]);
    }
    var url = Uri.https('apiliga.serteza.com',
        '/public/api/jugadores/get-jugadores', {'nombre': query});
    print(url);
    var response = await http.get(url);
    List<Suggestion> suggestions = [];
    if (response.statusCode == 200) {
      Iterable json = convert.jsonDecode(response.body);
      suggestions = List<Suggestion>.from(
          json.map((model) => Suggestion.fromJson(model)));

      print('Number of suggestion: ${suggestions.length}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return Future.value(suggestions
        .map((e) => {
              'name': e.nombre,
              'score': e.JugadorID.toString(),
              'TelMadre': e.TelMadre.toString(),
              'Curp': e.Curp.toString(),
              'representante': e.representante.toString(),
              'Edad': e.Edad.toString(),
              'Fotografia': e.Fotografia.toString()
            })
        .toList());
  }
}

class Suggestion {
  final int JugadorID;
  final String nombre;
  final String TelMadre;
  final String Curp;
  final String representante;
  final String Edad;
  final String Fotografia;

  Suggestion({
    this.JugadorID,
    this.nombre,
    this.TelMadre,
    this.Curp,
    this.representante,
    this.Edad,
    this.Fotografia,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      nombre: json['nombre'],
      JugadorID: json['JugadorID'],
      TelMadre: json['TelMadre'],
      Curp: json['Curp'],
      representante: json['representante'],
      Edad: json['Edad'],
      Fotografia: json['Fotografia'],
    );
  }
}
