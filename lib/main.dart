import 'package:balance_app/providers/movement_provider.dart';
import 'package:balance_app/routes/route_generator.dart';
import 'package:balance_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovementProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: '/balance',
        onGenerateRoute: RouteGenerator().routes,
      ),
    );
  }
}
