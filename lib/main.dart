import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_card.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_bloc.dart';
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
      title: 'Credit Card Capturer',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: BlocProvider(
        create: (context) => CardBloc(
          GetCardUseCase(locator()), // Replace with your actual implementation
          SaveCardUseCase(locator()), // Replace with your actual implementation
        ),
        child: CreditCardPage(), // Replace with your actual home screen
      ),
    );
  }
}
