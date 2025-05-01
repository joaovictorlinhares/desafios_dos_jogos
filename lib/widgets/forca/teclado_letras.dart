import 'package:flutter/material.dart';
import 'letra_button.dart';

class TecladoLetras extends StatelessWidget {
  final String palavra;
  final List<String> letrasCorretas;
  final List<String> letrasErradas;
  final Function(String) onLetraPressionada;

  const TecladoLetras({
    super.key,
    required this.palavra,
    required this.letrasCorretas,
    required this.letrasErradas,
    required this.onLetraPressionada,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: Center(
        child: Wrap(
          spacing: 4,
          alignment: WrapAlignment.center,
          children:
              'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letra) {
                final bool acertou = letrasCorretas.contains(letra);
                final bool errou = letrasErradas.contains(letra);

                return LetraButton(
                  letra: letra,
                  acertou: acertou,
                  errou: errou,
                  onPressed:
                      acertou || errou ? null : () => onLetraPressionada(letra),
                );
              }).toList(),
        ),
      ),
    );
  }
}
