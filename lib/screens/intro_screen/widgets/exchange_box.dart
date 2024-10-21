import 'package:flutter/material.dart';
import '../../../contracts/currency_value_setter.dart';

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
  String _exchangeRate = "1";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Indicative Exchange Rate'),
          SizedBox(height: 30, child: Text(_exchangeRate))
        ],
      ),
    );
  }

  updateValue(double value){
    setState(() {
      _exchangeRate = value.toStringAsFixed(2);
    });
  }
}
