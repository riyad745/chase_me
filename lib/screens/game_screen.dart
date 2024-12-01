import '../widgets/bot.dart';
import '../widgets/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class BotChaseGame extends FlameGame
    with HasCollisionDetection, CollisionCallbacks {
  late Player player;
  late Bot bot;
  late JoystickComponent joystick;
  bool isGameOver = false;
  int currentBotIndex = 0;

  final List<String> botSprites = ['bot.png', 'bot2.png', 'bot3.png'];

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Load the background
    final background = SpriteComponent()
      ..sprite = await loadSprite('background.png') // Load the background image
      ..size = Vector2(
          2000, 2000); // Set the background size, match with the world size

    // Initialize joystick
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 15, paint: Paint()..color = Colors.blue),
      background: CircleComponent(
          radius: 50, paint: Paint()..color = Colors.blue.withOpacity(0.5)),
      margin: const EdgeInsets.only(right: 20, bottom: 20),
    );

    // Initialize player
    player = Player(joystick: joystick)
      ..position = Vector2(100, 100)
      ..size = Vector2(50, 50);

    // Initialize bot
    bot = Bot(player, spriteName: botSprites[currentBotIndex])
      ..position = Vector2(300, 300)
      ..size = Vector2(50, 50);

    // Add background, joystick, player, and bot to the game
    add(background); // Add background first to ensure it stays at the bottom layer
    add(joystick);
    add(player);
    add(bot);
  }

  void changeBotCharacter(int index) {
    currentBotIndex = index;
    bot.changeSprite(botSprites[currentBotIndex]);
  }

  void gameOver() {
    isGameOver = true;
    joystick.removeFromParent();
    overlays.add('GameOver');
  }

  void restartGame() {
    isGameOver = false;
    add(joystick);
    overlays.remove('GameOver');

    player.position = Vector2(100, 100);
    bot.position = Vector2(300, 300);
  }

  void startGame() {
    overlays.remove('HomePage');
    overlays.add('GameScreen');
  }

  void showCharacterSelectScreen() {
    overlays.add('CharacterSelect');
  }

  void showHomePage() {
    overlays.add('HomePage');
  }
}
