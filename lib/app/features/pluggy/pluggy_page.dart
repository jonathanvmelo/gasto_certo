import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pluggy_connect/flutter_pluggy_connect.dart';

class PluggyPage extends StatefulWidget {
  const PluggyPage({super.key});

  @override
  State<PluggyPage> createState() => _PluggyPageState();
}

class _PluggyPageState extends State<PluggyPage> {
  bool _showPluggy = false;
  void _togglePluggyConnect() {
    setState(() {
      _showPluggy = !_showPluggy;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_showPluggy) {
      return Scaffold(
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            _togglePluggyConnect();
          },
          child: const Text("Iniciar"),
        )),
      );
    }

    return PluggyConnect(
        includeSandbox: true,
        onSuccess: (data) {
          log(jsonEncode(data));

          Navigator.of(context).pushNamed("/bottomBar");
        },
        onClose: () {
          log('Closed');
          _togglePluggyConnect();
        },
        onError: (error) {
          log('Error');
          log(jsonEncode(error));
        },
        onOpen: () {
          log('Opened');
        },
        onEvent: (payload) {
          log('Event');
          log(jsonEncode(payload));
        },
        connectToken:
            'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJZCI6ImU4ODk1MzgzLWM4ZTAtNDU0Ny1hNWE3LTQ2YjYzNjA5MWE5ZSIsImRhdGEiOiJlZTlkZWQwYmJjY2Y2NWQxMzg3ODUzZDJjZjY4MDYzMjo4NWY1MjNiZTMyNjBmZmE5Nzg0ODQ3ZDBlMGQyZmNlOWIwMmMxMmMzZGFhYTc2YWJmYjE1NzNmZjU0MWMzZDk3MjA2NjgwZmQxZmZjYmQ1YjFmMTc1OTBhY2I5ZGY0MjM1MzQyYzllODhjOTg0MzA2MDg1YTNlNGJlZjZjYTY2ZjZmYjU4MzRkNzY1YzdmZjdmMGNiZWI0ZmVmNDU3MGRiNGE3MDkxNThiMDMwYWJiOTMxMmNiYWRkODYyMGQyMzA5NTRmZDY2MzExMDkwODYzMGFiOTg4YzEyMmRiNTQ4YjQ0ZWZhYmE1NGYzODNmOWVmMmEyMTk5OTFmMzM1ODIwIiwiaWF0IjoxNjk4MTg4NzU2LCJleHAiOjE2OTgxOTA1NTZ9.akLJeGKPkc1-3j_fZZw0BZMhaCUV1HJMS1tdvIDxq1J54b6EjU-FskSrzdbpzrZRk3XNFTncco-OyzVp6pua3EB-uA-WBagz_CMYAOxSnQpa5SFHPWJPrWCz5lvO7QWjzsG-o3UybteQaYVGVMwVHKLgd85c91GO860BoIRS2v6hmqhUejGlIaN3kJ7j-kETn4piTY0E5d0f8fWT5WD1ZRBGDFjJZ4pwNhZBfIksDcx1J_xALQrEyiu6ahYfgF6LBzJiprTdSylNxGCVJeliA5LxacfQ5hCrJMHbEGvPSo7NuO1rKya8I4Pvh3G8IubSdbURAsOM_76AnIb-b3M1Lg');
  }
}
