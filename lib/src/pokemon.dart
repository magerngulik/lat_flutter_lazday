import 'package:flutter/material.dart';

class Pokemon extends StatelessWidget {
  Pokemon({Key? key}) : super(key: key);

  final List<String> listPokemon = [
    'Bullbasaur',
    'Charmander',
    'Eevee',
    'Pidgey',
    'Pikachu',
    'Pokeball',
    'Rattata',
    'Snorlax',
    'Squirtle',
    'Zubat'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Pokemon'),
            ),
            body: ListView.builder(
                itemCount: listPokemon.length,
                itemBuilder: (context, position) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      listPokemon[position],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                })));
  }
}
