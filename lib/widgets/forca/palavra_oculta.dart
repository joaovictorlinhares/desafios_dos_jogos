import 'package:flutter/material.dart';

class PalavraOculta extends StatelessWidget {
  final String palavra;
  final List<String> letrasCorretas;

  const PalavraOculta({
    super.key,
    required this.palavra,
    required this.letrasCorretas,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      palavra
          .split('')
          .map((letra) => letrasCorretas.contains(letra) ? letra : '_')
          .join(' '),
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
