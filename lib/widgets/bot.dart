
import '../screens/game_screen.dart';
import '../widgets/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

class Bot extends SpriteComponent
    with HasGameRef<BotChaseGame>, CollisionCallbacks {
  final Player player;
  String spriteName;

  Bot(this.player, {required this.spriteName}) : super();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await changeSprite(spriteName);
    add(RectangleHitbox());
  }

  Future<void> changeSprite(String newSpriteName) async {
    sprite = await gameRef.loadSprite(newSpriteName);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.isGameOver) return;

    Vector2 direction = player.position - position;
    if (direction.length > 0) {
      direction = direction.normalized();
      position.add(direction * dt * 100);
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Player && !gameRef.isGameOver) {
      Vector2 splashDirection = player.position - position;
      player.position.add(splashDirection.normalized() * 50);
      player.velocity = Vector2.zero();

      gameRef.add(
        CircleComponent(
          radius: 20,
          paint: Paint()..color = Colors.red,
          position: player.position.clone(),
        )..add(RemoveEffect(delay: 0.5)),
      );

      gameRef.gameOver();
    }
  }
}
