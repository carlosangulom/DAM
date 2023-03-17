import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'themeprovider.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});
  @override
  State<Explore> createState() => _ExploreState();
}

List<dynamic> _results = [];
bool _isLoaded = false;

class _ExploreState extends State<Explore> {
  String _selection = "";
  bool _isVisible = false;

  void _switchCategory(String sel) {
    setState(() {
      _selection = sel;
      _isVisible = true;
    });
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('results.json');
    final data = await json.decode(response);
    final results = data['explore'];

    for(var r in results) {
      _results.add(r);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(!_isLoaded){
      readJson();
      _isLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, notifier, child) =>  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children:  <Widget>[
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      color: Theme.of(context).colorScheme.background,
                      width: MediaQuery.of(context).size.width,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(12),
                          icon: Icon(Icons.search),
                        ),
                        maxLines: 1,
                        minLines: 1,
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Theme.of(context).colorScheme.background,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
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
                              side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                              label: const Text('Retratos'),
                              avatar: const Icon(Icons.face),
                              padding: const EdgeInsets.all(3.0),
                              onPressed: () { _switchCategory('Retratos'); },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            child:  ActionChip(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                              label: const Text('Paisajes'),
                              avatar: const Icon(Icons.landscape_outlined),
                              padding: const EdgeInsets.all(3.0),
                              onPressed: () { _switchCategory('Paisajes'); },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            child:  ActionChip(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                              label: const Text('Arquitectura'),
                              avatar: const Icon(Icons.account_balance_outlined),
                              padding: const EdgeInsets.all(3.0),
                              onPressed: () { _switchCategory('Arquitectura'); },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child:  ActionChip(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                              label: const Text('Personajes'),
                              avatar: const Icon(Icons.accessibility_rounded),
                              padding: const EdgeInsets.all(3.0),
                              onPressed: () { _switchCategory('Personajes'); },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.background,
                width: MediaQuery.of(context).size.width,
                child: Text('Categoría: $_selection', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: _results.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (MediaQuery.of(context).size.width ) / (MediaQuery.of(context).size.height / 1.5)
                  ),
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.all(5.0),
                      // Inkwell
                      child: InkWell(
                        radius: 100,
                        // display a snackbar on tap
                        onTap: () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Prompt: ${_results[index]['prompt']}', style: const TextStyle(color: Colors.white)),
                              duration: const Duration(milliseconds: 10000),
                            ),
                          );
                        },
                        // implement the image with Ink.image
                        child: Ink.image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/${_results[index]['image']}'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}