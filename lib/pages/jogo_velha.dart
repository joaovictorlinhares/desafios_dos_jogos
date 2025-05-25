import 'package:desafios_dos_jogos/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class JogoVelha extends StatefulWidget {
  const JogoVelha({super.key});

  @override
  State<JogoVelha> createState() => _JogoVelhaState();
}

class _JogoVelhaState extends State<JogoVelha> {
  static const int tamanhoTabuleiro = 3;
  List<List<String>> tabuleiro = List.generate(
    tamanhoTabuleiro,
    (_) => List.filled(tamanhoTabuleiro, ''),
  );
  String jogadorAtual = 'X';
  String? vencedor;
  bool empate = false;

  void reiniciarJogo() {
    setState(() {
      tabuleiro = List.generate(
        tamanhoTabuleiro,
        (_) => List.filled(tamanhoTabuleiro, ''),
      );
      jogadorAtual = 'X';
      vencedor = null;
      empate = false;
    });
  }

  void aoTocar(int linha, int coluna) {
    if (tabuleiro[linha][coluna] != '' || vencedor != null) return;
    setState(() {
      tabuleiro[linha][coluna] = jogadorAtual;
      if (verificarVencedor(linha, coluna)) {
        vencedor = jogadorAtual;
      } else if (tabuleiroCompleto()) {
        empate = true;
      } else {
        jogadorAtual = jogadorAtual == 'X' ? 'O' : 'X';
      }
    });
  }

  bool tabuleiroCompleto() {
    for (var linha in tabuleiro) {
      for (var celula in linha) {
        if (celula == '') return false;
      }
    }
    return true;
  }

  bool verificarVencedor(int linha, int coluna) {
    String jogador = tabuleiro[linha][coluna];
    if (tabuleiro[linha].every((celula) => celula == jogador)) return true;
    if (tabuleiro.every((l) => l[coluna] == jogador)) return true;
    if (linha == coluna &&
        List.generate(
          tamanhoTabuleiro,
          (i) => tabuleiro[i][i],
        ).every((celula) => celula == jogador)) {
      return true;
    }
    if (linha + coluna == tamanhoTabuleiro - 1 &&
        List.generate(
          tamanhoTabuleiro,
          (i) => tabuleiro[i][tamanhoTabuleiro - 1 - i],
        ).every((celula) => celula == jogador)) {
      return true;
    }
    return false;
  }

  Widget construirTabuleiro() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(tamanhoTabuleiro, (linha) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(tamanhoTabuleiro, (coluna) {
            return construirCelula(linha, coluna);
          }),
        );
      }),
    );
  }

  Widget construirCelula(int linha, int coluna) {
    return GestureDetector(
      onTap: () => aoTocar(linha, coluna),
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          tabuleiro[linha][coluna],
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: tabuleiro[linha][coluna] == 'X' ? Colors.blue : Colors.red,
          ),
        ),
      ),
    );
  }

  Widget construirStatus() {
    if (vencedor != null) {
      return Text(
        'Vencedor: $vencedor',
        style: TextStyle(fontSize: 24, color: Colors.green),
      );
    } else if (empate) {
      return Text(
        'Empate!',
        style: TextStyle(fontSize: 24, color: Colors.orange),
      );
    } else {
      return Text('Vez de: $jogadorAtual', style: TextStyle(fontSize: 20));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Jogo da Velha'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            construirStatus(),
            const SizedBox(height: 24),
            construirTabuleiro(),
            const SizedBox(height: 24),
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
