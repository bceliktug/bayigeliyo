import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/screens/login_screen.dart';
import 'blocs/login_bloc.dart';
import 'repositories/login_repository.dart';

void main() {
  runApp(const DealerCollectionApp());
}

class DealerCollectionApp extends StatelessWidget {
  const DealerCollectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(loginRepository: LoginRepository()),
      child: MaterialApp(
        title: 'Bayi Geliyo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
