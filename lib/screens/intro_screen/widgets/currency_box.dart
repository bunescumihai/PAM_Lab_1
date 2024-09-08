import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../business_logic/currency_converter.dart';
import '../../../contracts/currency_value_setter.dart';

class CurrencyBox extends StatefulWidget implements CurrencyValueSetter {
  CurrencyBox({super.key, required String boxName}){
    this._boxName = boxName;
  }
  late String _boxName;

  CurrencyConverter? _currencyConverter;

  setCurrencyConverter(CurrencyConverter currencyConverter) {
    _currencyConverter = currencyConverter;
  }

  final _CurrencyBoxState _state = _CurrencyBoxState();

  @override
  State<CurrencyBox> createState() => _state;

  @override
  void setValue(double value) {
    _state.updateValue(value);
  }
}

class _CurrencyBoxState extends State<CurrencyBox> {
  int _dropdownValue = 1;
  String _inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget._boxName,
          style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(150, 150, 150, 0.9),
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              DropdownButton(
                itemHeight: 65,
                dropdownColor: Color.fromRGBO(238, 238, 238, 1),
                items: [
                  DropdownMenuItem(
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'MD', // ISO country code
                            height: 55, // Height of the flag
                            width: 55, // Width of the flag
                            shape: const Circle(),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('MDL',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(0, 0, 200, 1))),
                          )
                        ],
                      ),
                      value: 1),
                  DropdownMenuItem(
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'US', // ISO country code
                            height: 55, // Height of the flag
                            width: 55, // Width of the flag
                            shape: const Circle(),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('USD',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(0, 0, 200, 1))),
                          )
                        ],
                      ),
                      value: 2),
                  DropdownMenuItem(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/flags/eu.png', // Your image path
                              width: 55,
                              height: 55,
                              fit: BoxFit
                                  .cover, // To ensure the image fits within the circular area
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('EURO',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromRGBO(0, 0, 200, 1))),
                          )
                        ],
                      ),
                      value: 3),
                ],
                value: _dropdownValue,
                onChanged: (value) {
                  if (value is int) {
                    setState(() {
                      _dropdownValue = value;
                    });
                  }
                },
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  height: 45,
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: TextEditingController(text: _inputValue),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: '0',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[1-9]\d{0,8}\.?\d{0,2}')),
                      // Allows digits and a decimal point
                    ],
                    onChanged: (value) {
                      double parsed = 0;
                      try{
                        parsed = double.parse(value);
                      }
                      catch(e){
                        parsed = 0;
                      }
                      widget._currencyConverter?.setValue(widget, parsed);
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void updateValue(double value) {
    setState(() {
      _inputValue = value.toString();
    });
  }
}
