import 'package:currency_converter/contracts/currency_value_setter.dart';
import 'package:flutter/material.dart';

class ExchangeBox extends StatefulWidget implements CCValueSetter{
  ExchangeBox({super.key});

  _ExchangeBoxState _state = _ExchangeBoxState();

  @override
  State<ExchangeBox> createState() => _state;

  @override
  void setValue(double value) {
    _state.updateValue(value);
  }
}

class _ExchangeBoxState extends State<ExchangeBox> {
  double _exchangeRate = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Indicative Exchange Rate'),
          Text(_exchangeRate.toString())
        ],
      ),
    );
  }

  updateValue(double value){
    setState(() {
      _exchangeRate = value;
    });
  }
}
