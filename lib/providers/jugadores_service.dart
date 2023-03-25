import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:liga_yuc_app/models/equipos_jugados_response.dart';

class JugadoresService {
  List<Team> equipos = [];

  Future<List<Team>> listaEquipos(int jugadorId) async {
    final miUrl =
        'https://apiliga.serteza.com/public/api/jugadores/get-equipos-jugados/' +
            jugadorId.toString();
    print(miUrl);
    final resp = await http.get(Uri.parse(miUrl));
    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    final newsResponse = equiposJugadosFromJson(resp.body);
    equipos = newsResponse.teams;
    return equipos;
  }
}
