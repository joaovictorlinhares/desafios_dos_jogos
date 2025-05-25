import 'package:desafios_dos_jogos/widgets/custom_app_bar.dart';
import 'package:desafios_dos_jogos/widgets/forca/palavra_oculta.dart';
import 'package:desafios_dos_jogos/widgets/forca/teclado_letras.dart';
import 'package:flutter/material.dart';

class JogoForca extends StatefulWidget {
  const JogoForca({super.key});

  @override
  State<JogoForca> createState() => _JogoForcaState();
}

class _JogoForcaState extends State<JogoForca> {
  String palavra = "FLUTTER";
  List<String> letrasCorretas = [];
  List<String> letrasErradas = [];
  int maxErros = 6;

  void onLetraPressionada(String letra) {
    setState(() {
      if (palavra.contains(letra)) {
        letrasCorretas.add(letra);
      } else {
        letrasErradas.add(letra);
        if (letrasErradas.length >= maxErros) {
          _reiniciarJogo();
        }
      }
    });
  }

  void _reiniciarJogo() {
    showDialog(
      context: context,
      builder:
          (context) => PopScope(
            canPop: false,
            child: AlertDialog(
              title: const Text('Fim de Jogo'),
              content: const Text(
                'Você atingiu o limite de erros. O jogo será reiniciado.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      letrasCorretas.clear();
                      letrasErradas.clear();
                    });
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Jogo da Forca'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PalavraOculta(palavra: palavra, letrasCorretas: letrasCorretas),
          const SizedBox(height: 24),
          TecladoLetras(
            palavra: palavra,
            letrasCorretas: letrasCorretas,
            letrasErradas: letrasErradas,
            onLetraPressionada: onLetraPressionada,
          ),
          const SizedBox(height: 16),
          Text(
            'Erros: ${letrasErradas.length} / $maxErros',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
