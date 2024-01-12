import 'package:flutter/material.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/pages/credit_card_page.dart';
import 'package:rank_assessment/injection_container.dart';
import 'package:rank_assessment/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreditCardPage(),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
