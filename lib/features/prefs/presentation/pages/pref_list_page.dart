import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrefsListPage extends StatelessWidget {
  const PrefsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Talentos Guardados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: Text('Lista de talentos guardados'))],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/prefs/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
