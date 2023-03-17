import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themeprovider.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _theme = false;
  int _selection = 0;

  final List<String> _prompts = [
    'A beautiful woodcut print of an old man, 8 k, frostbite 3 engine, cryengine, dof, trending on artstation, digital art, crepuscular ray, art by roy l davies and tugboat printshop',
    'a farmer with a brown hat drinking from a huge wine glass by pablo picasso, cubism',
    'best of picasso curved lineart females, cubism, boho neutral colors, framed',
  ];

  void _switchTheme() {
    setState(() {
      _theme = !_theme;
    });
  }

  void _switchCategory(int sel) {
    setState(() {
      _selection = sel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, notifier, child) =>  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.token_outlined, size: 95),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                color: Theme.of(context).colorScheme.background,
                width: MediaQuery.of(context).size.width,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Usuario',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                  ),
                  maxLines: 1,
                  minLines: 1,
                )
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                color: Theme.of(context).colorScheme.background,
                width: MediaQuery.of(context).size.width,
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                  ),
                  maxLines: 1,
                  minLines: 1,
                )
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: notifier.isDark ? const Color(0xff252422) : const Color(0xFFeb5e28),
                    foregroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50)
                ),
                onPressed: (){},
                child: const Text('Iniciar Sesión'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('¿No tienes cuenta? Regístrate')
            ),
          ],
        ),
      )
    );
  }
}