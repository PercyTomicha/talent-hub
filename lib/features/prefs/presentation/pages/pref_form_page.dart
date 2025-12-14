import 'package:flutter/material.dart';

class PrefsFormPage extends StatelessWidget {
  const PrefsFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Talento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: Text('Crear nuevo Talento'))],
        ),
      ),
    );
  }
}
