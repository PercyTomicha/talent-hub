import 'package:flutter/material.dart';

class TalentHub extends StatelessWidget {
  const TalentHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Talent Hub'))),
    );
  }
}
