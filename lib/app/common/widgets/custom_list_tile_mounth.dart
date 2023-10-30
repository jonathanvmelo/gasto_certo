import 'package:flutter/material.dart';

class CustomMounthListTileWidget extends StatefulWidget {
  @override
  _CustomMounthListTileWidgetState createState() =>
      _CustomMounthListTileWidgetState();
}

class _CustomMounthListTileWidgetState
    extends State<CustomMounthListTileWidget> {
  int _mesAtual = 10;

  void _proximoMes() {
    setState(() {
      _mesAtual++;
    });
  }

  void _mesAnterior() {
    setState(() {
      _mesAtual--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            if (_mesAtual == 11) {
              _proximoMes();
            } else if (_mesAtual == 0) {
              _mesAnterior();
            }
          },
        ),
        Text(
          mesesDoAno[_mesAtual],
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
          onPressed: () {
            if (_mesAtual == 11) {
              _proximoMes();
            } else if (_mesAtual == 0) {
              _mesAnterior();
            }
          },
          icon: Icon(Icons.arrow_right),
        )
      ],
    );
  }
}

const List<String> mesesDoAno = [
  "Janeiro",
  "Fevereiro",
  "Março",
  "Abril",
  "Maio",
  "Junho",
  "Julho",
  "Agosto",
  "Setembro",
  "Outubro",
  "Novembro",
  "Dezembro",
];

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("ListTile com meses"),
      ),
      body: Center(
        child: CustomMounthListTileWidget(),
      ),
    ),
  ));
}
