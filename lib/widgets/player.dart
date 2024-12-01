
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../screens/game_screen.dart';

class Player extends SpriteComponent
    with HasGameRef<BotChaseGame>, CollisionCallbacks {
  final JoystickComponent joystick;
  Vector2 velocity = Vector2.zero();

  Player({required this.joystick}) : super();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('player.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    velocity = joystick.relativeDelta * 150;
    position.add(velocity * dt);

    position.clamp(Vector2.zero(), gameRef.size - size);
  }
}
