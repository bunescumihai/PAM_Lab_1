import 'package:currency_converter/screens/intro_screen/widgets/exchange_box.dart';
import 'package:currency_converter/screens/intro_screen/widgets/swapper_box.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/currency_converter.dart';
import 'currency_box.dart';

class CurrenciesBox extends StatelessWidget {
  late final CurrencyBox _firstCurrencyBox;
  late final CurrencyBox _secondCurrencyBox;
  late final CurrencyConverter _currencyConverter;
  late final ExchangeBox _exchangeRateBox;
  late final SwapperBox _swapperBox;

  CurrenciesBox({super.key} ) {
    _firstCurrencyBox = new CurrencyBox(boxName: "Amount");
    _secondCurrencyBox = new CurrencyBox(boxName: "Converted Amount",);
    _swapperBox = new SwapperBox();

    _exchangeRateBox = new ExchangeBox();
    _currencyConverter = new CurrencyConverter(_firstCurrencyBox, _secondCurrencyBox, _exchangeRateBox);
    _firstCurrencyBox.setCurrencyConverter(_currencyConverter);
    _secondCurrencyBox.setCurrencyConverter(_currencyConverter);
    _swapperBox.setCurrencyConverter(_currencyConverter);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          _firstCurrencyBox,
          _swapperBox,
          _secondCurrencyBox,
          _exchangeRateBox
        ],
      ),
    );
  }
}
