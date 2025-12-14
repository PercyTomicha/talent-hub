import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'di.dart';
import 'app.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await init();

  runApp(const TalentHub());
}
