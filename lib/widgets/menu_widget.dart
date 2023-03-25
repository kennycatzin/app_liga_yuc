import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/sidebar-1.jpeg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.sports_baseball,
              color: Colors.green,
            ),
            title: Text('Listado de juegos'),
            onTap: () => "",
          ),
          ListTile(
            leading: Icon(
              Icons.batch_prediction,
              color: Colors.green,
            ),
            title: Text('Jugadores destacados'),
            onTap: () => "",
          ),
          ListTile(
            title: Center(
              child: Text(
                "Versión 1.0.0",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            onTap: () {
              // Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
