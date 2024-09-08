import 'package:flutter/material.dart';

import '../../../business_logic/currency_converter.dart';
import 'currency_box.dart';

class CurrenciesBox extends StatelessWidget {
  late final CurrencyBox _firstCurrencyBox;
  late final CurrencyBox _secondCurrencyBox;
  late final CurrencyConverter _currencyConverter;
  late final String _boxName;

  CurrenciesBox({super.key} ) {
    _firstCurrencyBox = new CurrencyBox(boxName: "Amount");
    _secondCurrencyBox = new CurrencyBox(boxName: "Converted Amount",);
    _currencyConverter =
        new CurrencyConverter(_firstCurrencyBox, _secondCurrencyBox);
    _firstCurrencyBox.setCurrencyConverter(_currencyConverter);
    _secondCurrencyBox.setCurrencyConverter(_currencyConverter);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          _firstCurrencyBox,
          Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    thickness: 2,
                    color: Color.fromRGBO(10, 10, 10, 0.2),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                      ), // Background color to overlap the divider cleanly
                      child: Icon(Icons.swap_vertical_circle_sharp, size: 60, color: Color.fromRGBO(103, 71, 217, 1.0),), // Icon in the center above the line
                    ),
                  ),
                ],
              )
          ),
          _secondCurrencyBox
        ],
      ),
    );
  }
}
