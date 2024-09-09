import '../contracts/currency_value_setter.dart';

class CurrencyConverter {
  CCValueSetter _firstCurrencyBox;
  CCValueSetter _secondCurrencyBox;
  CCValueSetter _exchangeRateBox;

  int _firstCurrency;
  int _secondCurrency;

  double _firstCurrencyValue = 0;
  double _secondCurrencyValue = 0;

  List<ExchangeTemplate> items = [
    new ExchangeTemplate(1, 2, 17.23),
    new ExchangeTemplate(1, 3, 19.15),
    new ExchangeTemplate(2, 3, 1.3),
  ];

  CurrencyConverter(this._firstCurrencyBox, this._secondCurrencyBox, this._exchangeRateBox, this._firstCurrency, this._secondCurrency);

  void setValue(CCValueSetter widget, double value){
    if(widget == _firstCurrencyBox) {
      _firstCurrencyValue = value;
      _secondCurrencyValue = value * _exchangeRate;
      _secondCurrencyBox.setValue(_secondCurrencyValue);
    } else {
      _secondCurrencyValue = value;
      _firstCurrencyValue = value / _exchangeRate * 100;
      _firstCurrencyValue = _firstCurrencyValue.toInt() / 100;
      _firstCurrencyBox.setValue(_firstCurrencyValue);
    }
  }

  void setCurrency(CCValueSetter widget, int currency){
    if(widget == _firstCurrencyBox)
      _firstCurrency = currency;
    else
      _secondCurrency = currency;

    for(ExchangeTemplate e in items){
      if((e.secondCurrency == _secondCurrency && e.firstCurrency == _firstCurrency) || e.secondCurrency == _firstCurrency && e.firstCurrency == _secondCurrency){
        setExchangeRate(e.exchangeRate);
        _exchangeRate = e.exchangeRate;

        if(widget == _firstCurrencyBox){
          _secondCurrencyValue = _firstCurrencyValue * _exchangeRate;
        }else
          _firstCurrencyValue = _secondCurrencyValue / _exchangeRate * 100;
          _firstCurrencyValue = _firstCurrencyValue.toInt() / 100;
        }

        setValue(_firstCurrencyBox, _firstCurrencyValue);
        setValue(_secondCurrencyBox, _secondCurrencyValue);

        return;
      }
    }


  void setExchangeRate(double value){
    _exchangeRateBox.setValue(value);
  }


  double _exchangeRate = 10;


}

class ExchangeTemplate{
  int firstCurrency;
  int secondCurrency;
  double exchangeRate;

  ExchangeTemplate(this.firstCurrency, this.secondCurrency, this.exchangeRate);
}