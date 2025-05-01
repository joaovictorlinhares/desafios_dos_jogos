import 'package:desafios_dos_jogos/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class JogoLabirinto extends StatelessWidget {
  const JogoLabirinto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Jogo do Labirinto'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "EM DESENVOLVIMENTO",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
