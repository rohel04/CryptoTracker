import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker/model/cryptoCurrency.dart';
import 'package:cryptocurrency_tracker/service/API.dart';

class MarketProvider with ChangeNotifier{
  bool isLoading=true;
  List<CryptoCurrency> markets=[];

  MarketProvider(){
    fetchData();
  }

  void fetchData() async{
    markets=await API.getData();
    isLoading=false;
    notifyListeners();

    Timer(Duration(seconds: 3),(){
      fetchData();
    });
  }
    CryptoCurrency fetchCryptoById(dynamic id)
    {
        CryptoCurrency cryptoCurrency=markets.where((element) => element.id == id).toList()[0];
        return cryptoCurrency;
    }


}