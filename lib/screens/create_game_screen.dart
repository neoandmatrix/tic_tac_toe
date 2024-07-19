import 'package:adv_tic_tac_toe/components/custom_text.dart';
import 'package:adv_tic_tac_toe/components/main_screen_button.dart';
import 'package:adv_tic_tac_toe/components/text_field.dart';
import 'package:adv_tic_tac_toe/constants/colors.dart';
import 'package:adv_tic_tac_toe/resources/socket_methods.dart';
import 'package:flutter/material.dart';

class CreateGamePage extends StatefulWidget {
  static String routeName = '/create-game-page';

  const CreateGamePage({super.key});

  @override
  State<CreateGamePage> createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createGameSuccessListner(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
                text: 'Create Game',
                fontSize: 70,
              ),
              SizedBox(
                height: height / 35,
              ),
              CustomTextField(
                controller: _nameController,
                text: 'Enter your name',
              ),
              SizedBox(
                height: height / 45,
              ),
              MainScreenButton(
                onPressed: () => {
                  _socketMethods.createRoom(
                    _nameController.text,
                  )
                },
                buttonText: "Create",
              )
            ],
          )),
    );
  }
}
