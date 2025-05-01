import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String routeName;

  const CustomButton({super.key, required this.text, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Defina a largura fixa desejada
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          foregroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
