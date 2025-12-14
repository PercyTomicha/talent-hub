import 'package:flutter/material.dart';

class PrefsDetailPage extends StatelessWidget {
  final String id;
  const PrefsDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
        actions: [TextButton(onPressed: () => {}, child: Text('Eliminar'))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Center(child: Text('Detalle del talento'))],
        ),
      ),
    );
  }
}
