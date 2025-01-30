import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels_task/resources/include.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Statics.screenWidth = MediaQuery.of(context).size.width;
    Statics.screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: appThemeData,
      home: const SplashScreen(),
    );
  }
}
