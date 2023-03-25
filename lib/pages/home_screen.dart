import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:liga_yuc_app/pages/perfil_jugador_screen.dart';
import 'package:liga_yuc_app/providers/data.dart';
import 'package:liga_yuc_app/widgets/menu_widget.dart';
import 'package:liga_yuc_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Liga Yucatán',
        ),
        backgroundColor: Colors.green,
      ),
      drawer: MenuWidget(),
      body: Stack(
        children: [
          NavigationExample(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/ly.png",
                  height: 260,
                ),
              ),
            ],
          ),

          //NavigationExample()
        ],
      ),
    );
  }
}

class NavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Búsqueda del jugador'),
            ),
            suggestionsCallback: (pattern) async {
              return await BackendService.getSuggestions(pattern);
            },
            itemBuilder: (context, Map<String, String> suggestion) {
              return ListTile(
                title: Text(suggestion['name']),
                subtitle: Text('${suggestion['score']}'),
              );
            },
            onSuggestionSelected: (Map<String, String> suggestion) {
              final siugestion = new Suggestion(
                  JugadorID: int.parse(suggestion["score"].toString()),
                  nombre: suggestion["name"].toString(),
                  TelMadre: suggestion["TelMadre"].toString(),
                  Curp: suggestion["Curp"].toString(),
                  representante: suggestion["representante"].toString(),
                  Edad: suggestion["Edad"].toString(),
                  Fotografia: suggestion["Fotografia"].toString());
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PerfilJugadorScreen(
                          jugador: siugestion,
                        )),
              ); // your implementation here
            },
          ),
        ],
      ),
    );
  }
}
