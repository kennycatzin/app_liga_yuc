import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liga_yuc_app/models/equipos_jugados_response.dart';

class ListaEquiposJugados extends StatelessWidget {
  final List<Team> equipos;

  const ListaEquiposJugados(this.equipos);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemCount: equipos.length,
      itemBuilder: (BuildContext context, int index) {
        return _Equipo(
          equipo: equipos[index],
          index: index,
        );
      },
    );
  }
}

class _Equipo extends StatelessWidget {
  final Team equipo;
  final int index;

  //const _Equipo({@required this.equipo, @required this.index});
  const _Equipo({@required this.equipo, @required this.index});

  @override
  Widget build(BuildContext context) {
    var outputFormat = DateFormat('dd/MM/yyyy');
    return Column(
      children: [
        ListTile(
          //tileColor: Colors.grey[350],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          title: Text('${equipo.equipoSeleccion}'),
          subtitle: Text(
            '${equipo.temporada} \n ${outputFormat.format(equipo.fechaInauguracion)}',
            overflow: TextOverflow.ellipsis,
          ),

          leading: CircleAvatar(
            child: const Icon(Icons.sports_baseball),
            // usuario.nombre.substring(0, 2)
            backgroundColor: Colors.green[600],
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                // color: usuario.online ? Colors.green[300] : Colors.red,
                color:
                    (equipo.actual == "1") ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
          ),
          onTap: () {},
        ),
        Divider(
          height: 10,
        )
      ],
    );
  }
}
