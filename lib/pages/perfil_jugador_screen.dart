import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liga_yuc_app/models/equipos_jugados_response.dart';
import 'package:liga_yuc_app/providers/data.dart';
import 'package:liga_yuc_app/providers/jugadores_service.dart';
import 'package:liga_yuc_app/widgets/lista_equipos_jugados.dart';

class PerfilJugadorScreen extends StatelessWidget {
  const PerfilJugadorScreen({@required this.jugador});

  final Suggestion jugador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil del jugador'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white60, width: 2.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(jugador.Fotografia))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(jugador.nombre,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.document_scanner,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(jugador.Curp, style: TextStyle(fontSize: 17))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.numbers_outlined,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(jugador.Edad, style: TextStyle(fontSize: 17))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_android,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(jugador.TelMadre, style: TextStyle(fontSize: 17))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified_user,
                    color: Colors.black87,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(jugador.representante, style: TextStyle(fontSize: 17))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              _swipedTarjetas(jugador.JugadorID)
            ],
          )),
        ));
  }

  Widget _swipedTarjetas(int jugadorId) {
    final jugadoresService = JugadoresService();
    return FutureBuilder(
        future: jugadoresService.listaEquipos(jugadorId),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            //return Text('${snapshot.data}');
            return Container(
                height: 300, child: ListaEquiposJugados(snapshot.data));
          } else {
            return Container(
                height: 400.0,
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
