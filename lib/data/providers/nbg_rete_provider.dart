import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;


class NBGRateProvider  {
  

  Future<double> getCurrency(String currency) async {
    String requestBody = '''<?xml version="1.0" encoding="utf-8"?>
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
          <soap:Body>
            <GetCurrency xmlns="http://www.dataaccess.com/webservicesserver/">
              <currencyCode>$currency</currencyCode>
            </GetCurrency>
          </soap:Body>
        </soap:Envelope>''';

    xml.XmlDocument parsedXml = await _sendRequest(requestBody);
    var rate = double.parse(parsedXml.innerText);
    return rate;
  }

  Future<xml.XmlDocument> _sendRequest(String requestBody) async {
    var res = await http.post(Uri.https('nbg.gov.ge', 'currency_service.php'),
        body: requestBody);
    if (res.statusCode != 200) throw Exception(res.body);
    xml.XmlDocument parsedXml = xml.XmlDocument.parse(res.body);
    return parsedXml;
  }

  Future<String> getCurrencyDescription(String currency) async {
    String requestBody = '''<?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <GetCurrencyDescription xmlns="http://www.dataaccess.com/webservicesserver/">
          <currencyCode>$currency</currencyCode>
        </GetCurrencyDescription>
      </soap:Body>
    </soap:Envelope>''';

    xml.XmlDocument parsedXml = await _sendRequest(requestBody);
    return parsedXml.innerText.trim();
  }

  Future<double> getCurrencyChange(String currency) async {
    String requestBody = '''<?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <GetCurrencyChange xmlns="http://www.dataaccess.com/webservicesserver/">
          <currencyCode>$currency</currencyCode>
        </GetCurrencyChange>
      </soap:Body>
    </soap:Envelope>''';

    xml.XmlDocument parsedXml = await _sendRequest(requestBody);
    return double.parse(parsedXml.innerText);
  }

  Future<int> getCurrencyRate(String currency) async {
    String requestBody = '''<?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <GetCurrencyRate xmlns="http://www.dataaccess.com/webservicesserver/">
          <currencyCode>$currency</currencyCode>
        </GetCurrencyRate>
      </soap:Body>
    </soap:Envelope>''';

    xml.XmlDocument parsedXml = await _sendRequest(requestBody);
    return int.parse(parsedXml.innerText);
  }

  Future<DateTime> getDate() async {
    String requestBody = '''<?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <GetDate xmlns="http://www.dataaccess.com/webservicesserver/">
        </GetDate>
      </soap:Body>
    </soap:Envelope>''';

    xml.XmlDocument parsedXml = await _sendRequest(requestBody);
    return DateTime.parse(parsedXml.innerText.trim());
  }
}
