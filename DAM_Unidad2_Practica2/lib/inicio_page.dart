import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themeprovider.dart';
import 'dart:math';

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  @override
  State<Inicio> createState() => _InicioState();
}

bool _visible = false;
String _img = "";

var imgs = ['img01.png', 'img02.png', 'img03.png', 'img06.png', 'img12.png', 'img09.png', 'img13.png', 'img19.png'];


class _InicioState extends State<Inicio> {

  void _setRandomImage(){
    var img = imgs[Random().nextInt(8)];
    setState(() {
      _img = img;
    });
  }

  void _toggleVisiblility() {
    _setRandomImage();
    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //readJson();
    return Consumer<ThemeProvider>(
      builder: (context, notifier, child) =>  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[
            Column(
              children:  [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe tu prompt',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(12)
                    ),
                    maxLines: 10,
                    minLines: 5,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  margin: const EdgeInsets.symmetric(vertical: 2.0),
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: 'Escribe tu prompt negativo',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(12)
                    ),
                    maxLines: 5,
                    minLines: 2,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: notifier.isDark ? const Color(0xff252422) : const Color(0xFFeb5e28),
                      foregroundColor: Colors.white,
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)
                    ),
                    onPressed: _toggleVisiblility,
                    child: const Text('Generar'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 512,
                  width: 512,
                  child:  Visibility(
                    visible: _visible,
                    child: Image(
                      image: AssetImage(_img),
                      fit: BoxFit.cover,
                    ),
                  )
                )
              ],
            )
          ]
      )
    );
  }
}