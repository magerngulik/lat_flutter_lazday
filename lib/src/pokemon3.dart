import 'package:flutter/material.dart';
import 'package:lazdays_firstproject/src/pokemon_model.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';

class Pokemon3 extends StatefulWidget {
  const Pokemon3({Key? key}) : super(key: key);

  @override
  State<Pokemon3> createState() => _Pokemon3State();
}

class _Pokemon3State extends State<Pokemon3> {
  List<PokemonModel> listPokemon = [];
  List<PokemonModel> listData = [
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

  var count = 0;
  addPokemon() {
    if (count < 11) {
      setState(() {
        listPokemon.add(listData[count]);
        count++;
      });
    }
  }

  Future getFuture() {
    return Future(() async {
      await Future.delayed(
        Duration(seconds: 3),
        () {
          setState(() {
            listPokemon = listData;
          });
        },
      );
    });
  }

  loadPokemon() {
    showProgress(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // addPokemon();
            loadPokemon();
          },
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

  Future<void> showProgress(BuildContext context) async {
    var result = await showDialog(
      context: context,
      builder: (context) => FutureProgressDialog(getFuture(),
          message: Text('Pokemon is Loading..')),
    );
  }
}
