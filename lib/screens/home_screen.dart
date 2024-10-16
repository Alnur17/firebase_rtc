import 'package:flutter/material.dart';

import 'call_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Call App')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start Call'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CallScreen()));
          },
        ),
      ),
    );
  }
}