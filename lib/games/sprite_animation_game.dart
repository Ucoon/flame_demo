import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';

class SpriteAnimationGame extends Game with TapDetector {
  late SpriteAnimation runningRobot;

  final robotPosition = Vector2(240, 50);
  final robotSize = Vector2(48, 60);

  late Sprite pressedButton;
  late Sprite unpressedButton;

  final buttonPosition = Vector2(200, 120);
  final buttonSize = Vector2(120, 30);
  bool isPressed = false;

  @override
  Future<void> onLoad() async {
    runningRobot = await loadSpriteAnimation(
        'robot.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(16, 18),
        ));
    unpressedButton = await loadSprite(
      'buttons.png',
      srcPosition: Vector2.zero(),
      srcSize: Vector2(60, 20),
    );

    pressedButton = await loadSprite(
      'buttons.png',
      srcPosition: Vector2(0, 20),
      srcSize: Vector2(60, 20),
    );
  }

  @override
  void update(double dt) {
    if (isPressed) {
      runningRobot.update(dt);
    }
  }

  @override
  void render(Canvas canvas) {
    runningRobot.getSprite().render(
          canvas,
          position: robotPosition,
          size: robotSize,
        );
    final button = isPressed ? pressedButton : unpressedButton;
    button.render(
      canvas,
      position: buttonPosition,
      size: buttonSize,
    );
  }

  @override
  Color backgroundColor() {
    return Color(0xFF222222);
  }

  @override
  void onTapDown(TapDownInfo info) {
    final buttonArea = buttonPosition & buttonSize;
    isPressed = buttonArea.contains(info.eventPosition.game.toOffset());
  }

  @override
  void onTapUp(TapUpInfo info) {
    isPressed = false;
  }

  @override
  void onTapCancel() {
    isPressed = false;
  }
}
