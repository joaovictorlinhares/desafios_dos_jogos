import 'package:flutter/material.dart';

class LetraButton extends StatelessWidget {
  final String letra;
  final bool acertou;
  final bool errou;
  final VoidCallback? onPressed;

  const LetraButton({
    super.key,
    required this.letra,
    required this.acertou,
    required this.errou,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            acertou
                ? Colors.green
                : errou
                ? Colors.red
                : Theme.of(context).colorScheme.inversePrimary,
        disabledBackgroundColor:
            acertou
                ? Colors.green
                : errou
                ? Colors.red
                : Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(letra),
    );
  }
}
