
import 'package:chase_me/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/game_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageOverlay(
          game: BotChaseGame(),
        )));
  });
}
