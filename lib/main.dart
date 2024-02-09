import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interseções de listas',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: IntersectionPage(),
    );
  }
}

class IntersectionPage extends StatefulWidget {
  @override
  _IntersectionPageState createState() => _IntersectionPageState();
}

class _IntersectionPageState extends State<IntersectionPage> {
  final TextEditingController _list1Controller = TextEditingController();
  final TextEditingController _list2Controller = TextEditingController();
  String _intersectionResult = '';

  void _findIntersection() {
    final list1 = _list1Controller.text.split(',').map((e) => int.tryParse(e)).toList();
    final list2 = _list2Controller.text.split(',').map((e) => int.tryParse(e)).toList();

    

    final intersection = list1.toSet().intersection(list2.toSet());

    setState(() {
      _intersectionResult = intersection.join(', ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interseção de listas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _list1Controller,
              decoration: InputDecoration(labelText: 'Digite os elementos da lista 1 (separados por vírgula)'),
            ),
            TextField(
              controller: _list2Controller,
              decoration: InputDecoration(labelText: 'Digite os elementos da lista 2 (separados por vírgula)'),
            ),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: _findIntersection,
              child: Text('Encontrar Interseção'),
            ),
            SizedBox(height: 18),
            Text(
              'Resultado da interseção: $_intersectionResult',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
