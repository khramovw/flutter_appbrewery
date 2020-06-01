import 'package:http/http.dart' as http;
import 'dart:convert';

bool isWaiting = false;
String selectedCurrency = 'USD';
Map<String, String> coinValues = {};

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '5E89E603-755C-4E3C-9143-8880BF9E38AB';

class CoinData {
  // The Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      // Url combining the coinAPIURL with the currencies we're interested, BTC to USD.
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';

      // Make a GET request to the URL and wait for the response.
      http.Response response = await http.get(requestURL);

      // Check that the request was successful.
      if (response.statusCode == 200) {
        // Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io .
        var decodedData = jsonDecode(response.body);

        // Get the last price of bitcoin with the key 'last'.
        double price = decodedData['rate'];

        cryptoPrices[crypto] = price.toStringAsFixed(4);
      } else {
        //Optional: throw an error if our request fails.
        throw handlerError(response);
      }
      // Output the lastPrice from the method.
      print(cryptoPrices);
      return cryptoPrices;
    }
  }

  handlerError(response) {
    String title = 'Response from coin.io code:';
    if (response.statusCode == 400) {
      print('$title 400 | Плохой запрос - с вашим запросом что-то не так.');
    }
    if (response.statusCode == 401) {
      print('$title 401 | Несанкционированный - Ваш API-ключ неверен.');
    }
    if (response.statusCode == 403) {
      print(
          '$title 403 | Запрещено - у вашего API-ключа недостаточно прав для доступа к этому ресурсу.');
    }
    if (response.statusCode == 429) {
      print(
          '$title 429 | Слишком много запросов - вы превысили ограничения по ключевой ставке API.');
    }
    if (response.statusCode == 550) {
      print(
          '$title 550 | Нет данных - Вы запросили конкретный элемент, которого у нас нет на данный момент.');
    }
    return jsonDecode(response.body);
  }
}
