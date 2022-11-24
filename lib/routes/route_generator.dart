import 'package:balance_app/models/movement.dart';
import 'package:balance_app/screens/movement_detail_screen.dart';
import 'package:balance_app/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  Route<dynamic> Function(RouteSettings) routes = (settings) {
    var routeName = settings.name;
    var args = settings.arguments;
    switch (routeName) {
      case '/balance':
        return MaterialPageRoute(
          builder: (context) => const BalanceScreen(),
        );
      case '/create-movement':
        return MaterialPageRoute(
          builder: (context) => CreateMovementScreen(),
        );
      case '/movement-detail':
        return MaterialPageRoute(
          builder: (context) =>
              MovementDetailScreen(movement: args as Movement),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const BalanceScreen(),
    );
  };
}
