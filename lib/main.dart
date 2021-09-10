import 'package:flame_demo/games/sprite_animation_game.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame_demo/games/basic_square_game.dart';

void main() {
  final myGame = SpriteAnimationGame();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}
