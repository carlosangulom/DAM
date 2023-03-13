import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themeprovider.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;
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
  print(_selection);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, notifier, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: () { notifier.toggleTheme(); _switchTheme(); },
                icon:  _theme ? const Icon(Icons.dark_mode) : const Icon(Icons.dark_mode_outlined)
            )
          ],
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Categorías',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child:  ActionChip(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                          label: Text('Retratos'),
                          onPressed: () { _switchCategory(0); },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:  ActionChip(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                          label: Text('Paisajes'),
                          onPressed: () { _switchCategory(1); },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child:  ActionChip(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                          label: Text('Arquitectura'),
                          onPressed: () { _switchCategory(0); },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:  ActionChip(
                          backgroundColor: Theme.of(context).colorScheme.background,
                          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                          label: Text('Personajes'),
                          onPressed: () { _switchCategory(1); },
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 200,
                              margin: const EdgeInsets.all(5.0),
                              // Inkwell
                              child: InkWell(
                                radius: 100,
                                // display a snackbar on tap
                                onTap: () {
                                  ScaffoldMessenger.of(context).clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Prompt: ${_prompts[0]}', style: const TextStyle(color: Colors.white)),
                                      duration: const Duration(milliseconds: 10000),
                                    ),
                                  );
                                },
                                // implement the image with Ink.image
                                child: Ink.image(
                                  fit: BoxFit.cover,
                                  image: const AssetImage('assets/img01.png'),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 200,
                              margin: const EdgeInsets.all(5.0),
                              // Inkwell
                              child: InkWell(
                                radius: 100,
                                // display a snackbar on tap
                                onTap: () {
                                  ScaffoldMessenger.of(context).clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Prompt: ${_prompts[1]}', style: const TextStyle(color: Colors.white)),
                                      duration: const Duration(milliseconds: 10000),
                                    ),
                                  );
                                },
                                // implement the image with Ink.image
                                child: Ink.image(
                                  fit: BoxFit.cover,
                                  image: const AssetImage('assets/img02.png'),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 200,
                              margin: const EdgeInsets.all(5.0),
                              // Inkwell
                              child: InkWell(
                                radius: 100,
                                // display a snackbar on tap
                                onTap: () {
                                  ScaffoldMessenger.of(context).clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Prompt: ${_prompts[2]}', style: const TextStyle(color: Colors.white)),
                                      duration: const Duration(milliseconds: 10000),
                                    ),
                                  );
                                },
                                // implement the image with Ink.image
                                child: Ink.image(
                                  fit: BoxFit.cover,
                                  image: const AssetImage('assets/img03.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}