import 'package:flutter/material.dart';
import 'package:lazdays_firstproject/src/pokemon_model.dart';

class Pokemon2 extends StatelessWidget {
  Pokemon2({Key? key}) : super(key: key);

  final List<PokemonModel> listPokemon = [
    PokemonModel(name: 'Bulbasaur', image: 'images/bullbasaur.png'),
    PokemonModel(name: 'charmander', image: 'images/charmander.png'),
    PokemonModel(name: 'Eevee', image: 'images/eevee.png'),
    PokemonModel(name: 'pidgey', image: 'images/pidgey.png'),
    PokemonModel(name: 'pikachu', image: 'images/pikachu.png'),
    PokemonModel(name: 'pokeball', image: 'images/pokeball.png'),
    PokemonModel(name: 'rattata', image: 'images/rattata.png'),
    PokemonModel(name: 'snorlax', image: 'images/snorlax.png'),
    PokemonModel(name: 'squirtle', image: 'images/squirtle.png'),
    PokemonModel(name: 'zubat', image: 'images/zubat.png'),
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
              child: Row(
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(right: 20),
                    child: Image.asset(listPokemon[position].image),
                  ),
                  Text(
                    listPokemon[position].name.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
