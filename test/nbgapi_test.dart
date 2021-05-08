import 'package:flutter_test/flutter_test.dart';
import 'package:nbgapi/core/currency_codes_enum.dart';

import 'package:nbgapi/nbgapi.dart';

void main() {
  test('gets rate form NBG.GE', () async {
    final nbgClient = NbgClient();
    var rate = await nbgClient.getRate(CurrencyCodeEnum.USD);
    expect(rate.description, '1 აშშ დოლარი');
  });
}
