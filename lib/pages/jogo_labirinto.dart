import 'package:desafios_dos_jogos/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class JogoLabirinto extends StatefulWidget {
  const JogoLabirinto({super.key});

  @override
  State<JogoLabirinto> createState() => _JogoLabirintoState();
}

class _JogoLabirintoState extends State<JogoLabirinto> {
  // 0 = vazio, 1 = parede, 2 = saída
  final List<List<List<int>>> labirintos = [
    [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 0, 0, 0, 1, 0, 1],
      [1, 0, 1, 0, 1, 0, 1],
      [1, 0, 1, 0, 0, 0, 1],
      [1, 0, 1, 1, 1, 0, 1],
      [1, 0, 0, 0, 1, 2, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ],
    [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 0, 1, 0, 0, 0, 1],
      [1, 0, 1, 0, 1, 0, 1],
      [1, 0, 0, 0, 1, 0, 1],
      [1, 1, 1, 0, 1, 0, 1],
      [1, 2, 0, 0, 1, 0, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ],
    [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 0, 0, 1, 0, 2, 1],
      [1, 1, 0, 1, 0, 1, 1],
      [1, 0, 0, 0, 0, 0, 1],
      [1, 0, 1, 1, 1, 0, 1],
      [1, 0, 0, 0, 1, 0, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ],
  ];
  int indiceLabirinto = 0;
  List<List<int>> get labirinto => labirintos[indiceLabirinto];
  int linhaJogador = 1;
  int colunaJogador = 1;
  bool venceu = false;

  void moverJogador(int dLinha, int dColuna) {
    if (venceu) return;
    int novaLinha = linhaJogador + dLinha;
    int novaColuna = colunaJogador + dColuna;
    if (labirinto[novaLinha][novaColuna] != 1) {
      setState(() {
        linhaJogador = novaLinha;
        colunaJogador = novaColuna;
        if (labirinto[linhaJogador][colunaJogador] == 2) {
          venceu = true;
        }
      });
    }
  }

  void reiniciarJogo() {
    setState(() {
      indiceLabirinto = (indiceLabirinto + 1) % labirintos.length;
      linhaJogador = 1;
      colunaJogador = 1;
      venceu = false;
    });
  }

  Widget construirLabirinto() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(labirinto.length, (linha) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(labirinto[linha].length, (coluna) {
            Color cor;
            if (linha == linhaJogador && coluna == colunaJogador) {
              cor = Colors.blue;
            } else if (labirinto[linha][coluna] == 1) {
              cor = Colors.black;
            } else if (labirinto[linha][coluna] == 2) {
              cor = Colors.green;
            } else {
              cor = Colors.white;
            }
            return Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: cor,
                border: Border.all(color: Colors.grey),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget construirControles() {
    return SizedBox(
      width: 160,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          const SizedBox.shrink(),
          IconButton(
            icon: const Icon(Icons.arrow_upward),
            onPressed: () => moverJogador(-1, 0),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox.shrink(),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => moverJogador(0, -1),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              foregroundColor: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_downward),
            onPressed: () => moverJogador(1, 0),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              foregroundColor: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => moverJogador(0, 1),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget construirStatus() {
    if (venceu) {
      return Text(
        'Parabéns! Você chegou à saída!',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      );
    } else {
      return Text('Use os botões para mover o bloco azul até a saída verde.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Jogo do Labirinto'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            construirStatus(),
            const SizedBox(height: 16),
            construirLabirinto(),
            const SizedBox(height: 16),
            construirControles(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: reiniciarJogo,
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}
