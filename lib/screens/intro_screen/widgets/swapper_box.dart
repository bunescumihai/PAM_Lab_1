import "package:currency_converter/business_logic/currency_converter.dart";
import "package:flutter/material.dart";

import "../../../contracts/swapper.dart";

class SwapperBox extends StatefulWidget{

  SwapperBox({super.key});

  @override
  State<SwapperBox> createState() => _SwapperBoxState();

  late final CurrencyConverter _currencyConverter;

  void setCurrencyConverter(CurrencyConverter currencyConverter){
    this._currencyConverter = currencyConverter;
  }

}

class _SwapperBoxState extends State<SwapperBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: IconButton(
                onPressed: (){
                  this.widget._currencyConverter.swapCurrencies();
                },
                padding: EdgeInsets.all(5),
                icon: Image.asset('assets/images/icons/swap.png', width: 50, height: 50),
              ),
            ),
          ],
        )
    );
  }
}
