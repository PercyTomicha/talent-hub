import 'package:flutter/material.dart';

class BannerLoading extends StatelessWidget {
  const BannerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48.0),
        Center(
          child: Text(
            'Cargando datos...',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        CircularProgressIndicator(),
      ],
    );
  }
}
