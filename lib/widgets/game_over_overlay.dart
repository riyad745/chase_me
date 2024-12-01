import '../screens/game_screen.dart';
import 'package:flutter/material.dart';

class GameOverOverlay extends StatelessWidget {
  final BotChaseGame game;

  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/gifs/game_over.gif',
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      game.restartGame();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: const Text(
                        'Restart',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
