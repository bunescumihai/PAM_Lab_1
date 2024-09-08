import '../contracts/currency_value_setter.dart';

class CurrencyConverter {
  CurrencyValueSetter _firstCurrency;
  CurrencyValueSetter _secondCurrency;

  CurrencyConverter(this._firstCurrency, this._secondCurrency);

  void setValue(CurrencyValueSetter widget, double value){
    if(widget == _firstCurrency)
      _secondCurrency.setValue(value * _exchangeRate);
    else
      _firstCurrency.setValue(value / _exchangeRate);
  }

  void setCurrency(CurrencyValueSetter widget, int currency){

  }

  double _exchangeRate = 10;
}