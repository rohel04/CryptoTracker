import 'dart:convert';
import 'package:http/http.dart';
import 'package:cryptocurrency_tracker/model/cryptoCurrency.dart';

class API{
  
  static Future<List<CryptoCurrency>> getData() async
  {
    List<CryptoCurrency> c=[];
    String url='https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=20&page=1&sparkline=false';
    Response response=await get(Uri.parse(url));
    List<dynamic> main=jsonDecode(response.body);
    main.forEach((element) {
      CryptoCurrency cryptoCurrency=CryptoCurrency.fromMap(element);
      c.add(cryptoCurrency);
    });
    return c;
  }

}