import 'package:currency_converter/contracts/currency_value_setter.dart';

abstract class CCCurrencySetter implements CCValueSetter{
  void setCurrency(int value);
}