// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

EquiposJugados equiposJugadosFromJson(String str) =>
    EquiposJugados.fromJson(json.decode(str));

String equiposJugadosToJson(EquiposJugados data) => json.encode(data.toJson());

class EquiposJugados {
  EquiposJugados({
    this.ok,
    this.teams,
  });

  bool ok;
  List<Team> teams;

  factory EquiposJugados.fromJson(Map<String, dynamic> json) => EquiposJugados(
        ok: json["ok"],
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
      };
}

class Team {
  Team({
    this.temporada,
    this.fechaInauguracion,
    this.equipoSeleccion,
    this.actual,
  });

  String temporada;
  DateTime fechaInauguracion;
  String equipoSeleccion;
  String actual;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        temporada: json["Temporada"],
        fechaInauguracion: DateTime.parse(json["FechaInauguracion"]),
        equipoSeleccion: json["EquipoSeleccion"],
        actual: json["actual"],
      );

  Map<String, dynamic> toJson() => {
        "Temporada": temporada,
        "FechaInauguracion":
            "${fechaInauguracion.year.toString().padLeft(4, '0')}-${fechaInauguracion.month.toString().padLeft(2, '0')}-${fechaInauguracion.day.toString().padLeft(2, '0')}",
        "EquipoSeleccion": equipoSeleccion,
        "actual": actual,
      };
}
