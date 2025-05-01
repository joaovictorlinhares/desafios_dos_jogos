import 'package:desafios_dos_jogos/pages/jogo_forca.dart';
import 'package:desafios_dos_jogos/pages/jogo_labirinto.dart';
import 'package:desafios_dos_jogos/pages/jogo_velha.dart';
import 'package:desafios_dos_jogos/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafios Dart/Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      initialRoute: '/', // Define a rota inicial
      routes: {
        '/': (context) => const MyHomePage(title: 'Desafios Dart/Flutter'),
        '/desafio1': (context) => JogoForca(),
        '/desafio2': (context) => JogoVelha(),
        '/desafio3': (context) => JogoLabirinto(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Desafios Dart/Flutter'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomButton(
              text: 'Desafio 1 - Jogo da Forca',
              routeName: '/desafio1',
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Desafio 2 - Jogo da Velha',
              routeName: '/desafio2',
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Desafio 3 - Jogo do Labirinto',
              routeName: '/desafio3',
            ),
          ],
        ),
      ),
    );
  }
}
