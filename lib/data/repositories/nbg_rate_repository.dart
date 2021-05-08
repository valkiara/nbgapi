
import 'package:nbgapi/core/currency_codes_enum.dart';
import 'package:nbgapi/data/model/rate.dart';
import 'package:nbgapi/data/providers/nbg_rete_provider.dart';

class NBGRatesRepository {
  final NBGRateProvider _nbgRateProvider;

  NBGRatesRepository(this._nbgRateProvider);

  Future<Rate> getRate(CurrencyCodeEnum currency) async {
    String currencyCode = currency.toString().split('.').last;
    
    double rate = await _nbgRateProvider.getCurrency(currencyCode);
    String description =
        await _nbgRateProvider.getCurrencyDescription(currencyCode);
    double change = await _nbgRateProvider.getCurrencyChange(currencyCode);
    DateTime date = await _nbgRateProvider.getDate();
    int status = await _nbgRateProvider.getCurrencyRate(currencyCode);

    return Rate(
        currencyCode: currency,
        rate: rate,
        description: description,
        change: change,
        date: date,
        status: status);
  }
}
