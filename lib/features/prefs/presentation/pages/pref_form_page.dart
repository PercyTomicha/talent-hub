import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/preference_cubit.dart';

class PrefsFormPage extends StatefulWidget {
  const PrefsFormPage({super.key});

  @override
  State<PrefsFormPage> createState() => _PrefsFormPageState();
}

class _PrefsFormPageState extends State<PrefsFormPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Talento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre del Talento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            TextField(controller: _nameController),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final name = _nameController.text;
                      if (name.isNotEmpty) {
                        context.read<PreferenceCubit>().saveNewUser(name);
                        context.pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('El nombre no puede estar vacío'),
                          ),
                        );
                      }
                    },
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}
