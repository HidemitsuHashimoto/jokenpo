import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  JogoState createState() => JogoState();
}

class JogoState extends State<Jogo> {
  AssetImage _imagemApp = AssetImage('images/padrao.png');
  String _mensagem = 'Escolha uma opcao abaixo';

  void _opcaoSelecionada(String escolhaUsuario) {
    List<String> opcoes = ['pedra', 'papel', 'tesoura'];
    int numero = Random().nextInt(opcoes.length);
    String escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          _imagemApp = AssetImage('images/$escolhaApp.png');
        });
        break;
      case 'papel':
        setState(() {
          _imagemApp = AssetImage('images/$escolhaApp.png');
        });
        break;
      case 'tesoura':
        setState(() {
          _imagemApp = AssetImage('images/$escolhaApp.png');
        });
        break;
    }

    if (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura' ||
        escolhaUsuario == 'papel' && escolhaApp == 'pedra' ||
        escolhaUsuario == 'tesoura' && escolhaApp == 'papel') {
      setState(() {
        _mensagem = 'Parabéns!! Voce ganhou :)';
      });
    } else if (escolhaApp == 'pedra' && escolhaUsuario == 'tesoura' ||
        escolhaApp == 'papel' && escolhaUsuario == 'pedra' ||
        escolhaApp == 'tesoura' && escolhaUsuario == 'papel') {
      setState(() {
        _mensagem = 'Voce perdeu :(';
      });
    } else {
      setState(() {
        _mensagem = 'Empatamos ;)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada('pedra'),
                  child: Image.asset(
                    'images/pedra.png',
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('papel'),
                  child: Image.asset(
                    'images/papel.png',
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('tesoura'),
                  child: Image.asset(
                    'images/tesoura.png',
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
