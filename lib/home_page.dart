import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listaPreventivi = ["Preventivo 1", "Preventivo 2", "Preventivo 3"];

  void _incrementList() {
    setState(() {
      var elemento = "Preventivo " + (listaPreventivi.length + 1).toString();
      listaPreventivi.add(elemento);
      log('elemento: ' + elemento);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return MaterialApp(
      title: widget.title,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          //nasconde icona drawer
          automaticallyImplyLeading: false,
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Mario Rossi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Profilo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Impostazioni'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: listaPreventivi.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listaPreventivi[index]),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementList();
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  }),
              const Spacer(),
              IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  color: Colors.white),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                color: Colors.white,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
