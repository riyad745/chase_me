import '../screens/character_select.dart';
import '../screens/game_screen.dart';
import '../widgets/game_over_overlay.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

// HomePageOverlay: Initial page with play and character select buttons
class HomePageOverlay extends StatelessWidget {
  final BotChaseGame game;

  const HomePageOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/gifs/background.gif',
            ),
          ),
          Positioned(
            bottom: 10,
            right: MediaQuery.of(context).size.width / 3.2,
            left: MediaQuery.of(context).size.width / 3.2,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GameWidget(
                        game: game,
                        overlayBuilderMap: {
                          'HomePage': (context, game) =>
                              HomePageOverlay(game: game as BotChaseGame),
                          'GameOver': (context, game) =>
                              GameOverOverlay(game: game as BotChaseGame),
                        },
                      ),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade500,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: const Text(
                      'Play Game',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CharacterSelectOverlay(game: game),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: const Text(
                      'Character Select',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
