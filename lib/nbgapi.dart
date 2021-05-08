library nbgapi;

import 'package:nbgapi/core/currency_codes_enum.dart';
import 'package:nbgapi/data/providers/nbg_rete_provider.dart';
import 'package:nbgapi/data/repositories/nbg_rate_repository.dart';

import 'data/model/rate.dart';

class NbgClient {
  NBGRatesRepository _nbgRatesRepository;
  NBGRateProvider _nbgRateProvider;
  NbgClient(){
    _nbgRateProvider = NBGRateProvider();
    _nbgRatesRepository = NBGRatesRepository(_nbgRateProvider);
  }

  Future<Rate> getRate(CurrencyCodeEnum currencyCode)=> _nbgRatesRepository.getRate(currencyCode);
}
