

import '../screens/game_screen.dart';
import 'package:flutter/material.dart';

class CharacterSelectOverlay extends StatelessWidget {
  final BotChaseGame game;

  const CharacterSelectOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select Your Bot',
            style: TextStyle(fontSize: 48, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.changeBotCharacter(0);
              Navigator.of(context).pop(); // Close overlay and start game
            },
            child: const Text('Bot 1'),
          ),
          ElevatedButton(
            onPressed: () {
              game.changeBotCharacter(1);
              Navigator.of(context).pop(); // Close overlay and start game
            },
            child: const Text('Bot 2'),
          ),
          ElevatedButton(
            onPressed: () {
              game.changeBotCharacter(2);
              Navigator.of(context).pop(); // Close overlay and start game
            },
            child: const Text('Bot 3'),
          ),
        ],
      ),
    );
  }
}
