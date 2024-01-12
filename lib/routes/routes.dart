import 'package:flutter/material.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/pages/add_country.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/pages/add_credit_card.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/pages/credit_card_page.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/pages/edit_country.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    print('Requestd Route ${settings.name}');
    switch (settings.name) {
      case '/CreditCardPage':
        return _materialRoute(CreditCardPage());

      case '/AddCreditCard':
        return _materialRoute(const AddCreditCard());

      case '/AddCountry':
        return _materialRoute(const AddCountry());
      case '/EditCountry':
        return _materialRoute(const EditCountry());
      default:
        return _materialRoute(CreditCardPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
