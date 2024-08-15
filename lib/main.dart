import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/bloc/user/user_bloc.dart';
import 'package:suitmedia_test/repository/user_repository.dart';
import 'package:suitmedia_test/view/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: UserRepository()),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
            bodyMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
            bodyLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        title: 'Suitmedia Test',
        home: const FirstScreen(),
      ),
    );
  }
}
