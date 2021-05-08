import 'package:nbgapi/core/currency_codes_enum.dart';

class Rate {

  CurrencyCodeEnum _currencyCode;
  CurrencyCodeEnum get currencyCode => _currencyCode;

  double _rate;
  double get rate => _rate;

  DateTime _date;
  DateTime get date => _date;

  String _description;
  String get description => _description;

  double _change;
  double get change => _change;

  int _status;
  int get status => _status;

  Rate(
      {CurrencyCodeEnum currencyCode,
      double rate,
      String description,
      double change,
      int status,
      DateTime date})
      : _currencyCode = currencyCode,
        _rate = rate,
        _description = description,
        _change = change,
        _status = status,
        _date = date;
}
