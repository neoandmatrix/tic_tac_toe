import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:adv_tic_tac_toe/provider/game_data_provider.dart';
import 'package:adv_tic_tac_toe/screens/create_game_screen.dart';
import 'package:adv_tic_tac_toe/screens/game_screen.dart';
import 'package:adv_tic_tac_toe/screens/join_game_screen.dart';
import 'package:adv_tic_tac_toe/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameDataProvider(),
      child: MaterialApp(
        routes: {
          MainMenueScreen.routeName : (context) => const MainMenueScreen(),
          CreateGamePage.routeName :(context) => const CreateGamePage(),
          JoinGamePage.routeName : (context) => const JoinGamePage(),
          GameScreen.routeName : (context) => const GameScreen()
        
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(useMaterial3: true).copyWith(scaffoldBackgroundColor : bgColor),
        home:  Scaffold(
          appBar: AppBar(title: const Text('this is appbara'),),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainMenueScreen(),
    );
  }
}
