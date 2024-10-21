import 'package:currency_converter/contracts/currency_setter.dart';

import '../contracts/currency_value_setter.dart';

class CurrencyConverter {

  CCCurrencySetter _firstCurrencyBox;
  CCCurrencySetter _secondCurrencyBox;
  CCValueSetter _exchangeRateBox;

  int _firstCurrency = 1;
  int _secondCurrency = 1;


  double _firstCurrencyValue = 0;
  double _secondCurrencyValue = 0;
  double _exchangeRate = 1;

  List<ExchangeTemplate> items = [
    new ExchangeTemplate(1, 2, 17.23),
    new ExchangeTemplate(1, 3, 19.15),
    new ExchangeTemplate(2, 3, 1.3),
  ];

  void initState(){
    _firstCurrencyBox.setValue(_firstCurrencyValue);
    _secondCurrencyBox.setValue(_secondCurrencyValue);
    _firstCurrencyBox.setCurrency(_firstCurrency);
    _secondCurrencyBox.setCurrency(_secondCurrency);
    _exchangeRateBox.setValue(_exchangeRate);
  }

  CurrencyConverter(
      this._firstCurrencyBox,
      this._secondCurrencyBox,
      this._exchangeRateBox,
      );

  void setValue(CCValueSetter widget, double value){
    if(widget == _firstCurrencyBox) {
      _firstCurrencyValue = value;
      _secondCurrencyValue = value / _exchangeRate;
      _secondCurrencyBox.setValue(_secondCurrencyValue);
    } else {
      _secondCurrencyValue = value;
      _firstCurrencyValue = value * _exchangeRate;
      _firstCurrencyBox.setValue(_firstCurrencyValue);
    }
  }

  void setCurrency(CCCurrencySetter widget, int currency){
    if(widget == _firstCurrencyBox)
      _firstCurrency = currency;
    else
      _secondCurrency = currency;

    if(_firstCurrency == _secondCurrency){
      _exchangeRate = 1;
      setExchangeRate(_exchangeRate);
      double val = _firstCurrencyValue;
      _firstCurrencyBox.setValue(val);
      _secondCurrencyBox.setValue(val);
      _secondCurrencyValue = val;
      return;
    }

    for(ExchangeTemplate e in items){
      if((e.secondCurrency == _secondCurrency && e.firstCurrency == _firstCurrency) || (e.secondCurrency == _firstCurrency && e.firstCurrency == _secondCurrency)) {
        _exchangeRate = e.exchangeRate;


        if(_firstCurrency > _secondCurrency){
          _exchangeRate = 1 / _exchangeRate;
        }

        if (widget == _firstCurrencyBox) {
          _secondCurrencyValue = _firstCurrencyValue / _exchangeRate;
        } else {
          _firstCurrencyValue = _secondCurrencyValue * _exchangeRate;
        }

        setExchangeRate(_exchangeRate);
        setValue(_firstCurrencyBox, _firstCurrencyValue);
        setValue(_secondCurrencyBox, _secondCurrencyValue);

        return;
      }
    }
  }


  void setExchangeRate(double value){
    _exchangeRateBox.setValue(value);
  }


  void swapCurrencies(){
      int currency = _firstCurrency;
      _firstCurrency = _secondCurrency;
      _secondCurrency = currency;

      _exchangeRate = 1 / _exchangeRate;

      _firstCurrencyBox.setCurrency(_firstCurrency);
      _secondCurrencyBox.setCurrency(_secondCurrency);

      _secondCurrencyValue = _firstCurrencyValue / _exchangeRate;
      _secondCurrencyBox.setValue(_secondCurrencyValue);
      _exchangeRateBox.setValue(_exchangeRate);
  }
}

class ExchangeTemplate{
  int firstCurrency;
  int secondCurrency;
  double exchangeRate;

  ExchangeTemplate(this.firstCurrency, this.secondCurrency, this.exchangeRate);
}