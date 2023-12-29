import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  String _imagemApp = "images/padrao.png";
  String _mensagem = "";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    // exibição da imagem do app
    setState(() {
      _imagemApp = "images/$escolhaApp.png";
    });

    if (escolhaUsuario == "pedra" && escolhaApp == "tesoura" ||
        escolhaUsuario == "tesoura" && escolhaApp == "papel" ||
        escolhaUsuario == "papel" && escolhaApp == "pedra") {
      setState(() {
        _mensagem = "Você ganhou! =]";
      });
    } else if (escolhaApp == "pedra" && escolhaUsuario == "tesoura" ||
        escolhaApp == "tesoura" && escolhaUsuario == "papel" ||
        escolhaApp == "papel" && escolhaUsuario == "pedra") {
      setState(() {
        _mensagem = "Você perdeu! =[";
      });
    } else {
      setState(() {
        _mensagem = "Empate!";
      });
    }

    print(escolhaApp);
    print(escolhaUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "JokenPo",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.amber[200],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 45, bottom: 15),
                  child: Text(
                    "Escolha do APP",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Image.asset(_imagemApp),
                const Padding(
                  padding: EdgeInsets.only(top: 45, bottom: 15),
                  child: Text("Selecione:"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: Image.asset(
                        "images/pedra.png",
                        width: 90.0,
                        height: 90.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("papel"),
                      child: Image.asset(
                        "images/papel.png",
                        width: 90.0,
                        height: 90.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("tesoura"),
                      child: Image.asset(
                        "images/tesoura.png",
                        width: 90.0,
                        height: 90.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45, bottom: 15),
                  child: Text(_mensagem,
                      style: const TextStyle(
                        fontSize: 30,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
