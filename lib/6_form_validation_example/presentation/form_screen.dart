import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/form_state_cubit.dart';

class FormValidationApp extends StatelessWidget {
  const FormValidationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => FormCubit(),
        child: FormScreen(),
      ),
    );
  }
}

class FormScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<FormCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Form Validation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: context.select<FormCubit, String?>(
                      (cubit) => cubit.state.isEmailValid ? null : 'Invalid email',
                ),
              ),
              onChanged: formCubit.updateEmail,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: context.select<FormCubit, String?>(
                      (cubit) => cubit.state.isPasswordValid ? null : 'Password too short',
                ),
              ),
              obscureText: true,
              onChanged: formCubit.updatePassword,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                formCubit.validateForm();
                if (formCubit.state.isEmailValid && formCubit.state.isPasswordValid) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form is valid!')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}