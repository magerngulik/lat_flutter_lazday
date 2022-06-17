import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:lazdays_firstproject/latihan/lat_pokemon_model.dart';

class LatPokemon extends StatefulWidget {
  const LatPokemon({Key? key}) : super(key: key);

  @override
  State<LatPokemon> createState() => _LatPokemonState();
}

class _LatPokemonState extends State<LatPokemon> {
  List<LatPokemonModel> listPokemon = [];

  List<LatPokemonModel> latdata = [
    LatPokemonModel(name: 'bullbasaur', image: 'assets/images/bullbasaur.png'),
    LatPokemonModel(name: 'charmander', image: 'assets/images/charmander.png'),
    LatPokemonModel(name: 'eevee', image: 'assets/images/eevee.png'),
    LatPokemonModel(name: 'pidgey', image: 'assets/images/pidgey.png'),
    LatPokemonModel(name: 'pikachu', image: 'assets/images/pikachu.png'),
    LatPokemonModel(name: 'pokeball', image: 'assets/images/pokeball.png'),
    LatPokemonModel(name: 'rattata', image: 'assets/images/rattata.png'),
    LatPokemonModel(name: 'snorlax', image: 'assets/images/snorlax.png'),
    LatPokemonModel(name: 'squirtle', image: 'assets/images/squirtle.png'),
    LatPokemonModel(name: 'zubat', image: 'assets/images/zubat.png'),
  ];

  int count = 0;

  tambahData() {
    if (count < 10) {
      setState(() {
        listPokemon.add(latdata[count]);
        count++;
      });
    }
  }

//progress dialog
  Future getFuture() {
    return Future(() async {
      await Future.delayed(Duration(seconds: 5), () {
        setState(() {
          listPokemon = latdata;
        });
      });
      ;
    });
  }

  Future<void> showProgress(BuildContext context) async {
    var result = await showDialog(
      context: context,
      builder: (context) => FutureProgressDialog(getFuture(),
          message: Text('Loading Pokemon...')),
    );
  }

  //ini cuma buat data nya nampil
  prosesData() {
    showProgress(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            prosesData();
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Latihan Pokemon'),
      ),
      body: ListView.builder(
        itemCount: listPokemon.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 100,
                    child: Image.asset(listPokemon[index].image),
                  ),
                  Text(
                    listPokemon[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ));
        },
      ),
    );
  }
}
