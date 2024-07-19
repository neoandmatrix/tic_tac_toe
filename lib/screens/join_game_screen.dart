import 'package:adv_tic_tac_toe/components/custom_text.dart';
import 'package:adv_tic_tac_toe/components/main_screen_button.dart';
import 'package:adv_tic_tac_toe/components/text_field.dart';
import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:adv_tic_tac_toe/resources/socket_methods.dart';
import 'package:flutter/material.dart';

class JoinGamePage extends StatefulWidget {
  static String routeName = '/join-game-page';

  const JoinGamePage({super.key});

  @override
  State<JoinGamePage> createState() => _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    SocketMethods().joinGameSuccessListner(context);
    SocketMethods().onErrorOccured(context);
    SocketMethods().updatePlayerStateListner(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: width / 4.8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [Shadow(blurRadius: 50, color: accentColor)],
                text: 'Join Game',
                fontSize: 70,
              ),
              SizedBox(
                height: height / 35,
              ),
              CustomTextField(
                controller: _nameController,
                text: 'Enter name',
              ),
              SizedBox(
                height: height / 50,
              ),
              CustomTextField(
                controller: _gameIdController,
                text: 'Enter game Id',
              ),
              SizedBox(
                height: height / 50,
              ),
              MainScreenButton(
                onPressed: () => {
                  _socketMethods.joinGame(
                      _nameController.text, int.parse(_gameIdController.text))
                },
                buttonText: "Join",
              )
            ],
          )),
    );
  }
}
