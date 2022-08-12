import 'dart:ffi';

import 'package:cryptocurrency_tracker/provider/MarketProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptocurrency_tracker/model/cryptoCurrency.dart';
import 'package:cryptocurrency_tracker/widget/detailCard.dart';

class DetailPage extends StatefulWidget {
  dynamic id;

  DetailPage({Key? key,required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<MarketProvider>(
        builder: (context,marketProvider,child){
          CryptoCurrency currency=marketProvider.fetchCryptoById(widget.id);
          return Column(
            children: [
              CircleAvatar(
                maxRadius: 40,
                backgroundImage: NetworkImage('${currency.image}',
                ),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 10),
              Text('${currency.name} '+currency.symbol.toString().toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              Text('₹ ${currency.currentPrice}',style: TextStyle(color: Colors.blue,fontSize: 16),),
              SizedBox(height: 20),
              Column(
                  children:
              [
              Text('Price Changed 24h',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Builder(builder: (context){
                  double priceChanged=double.parse(currency.priceChange24.toString());
                  if(priceChanged>0)
                    {
                      return Text(priceChanged.toStringAsFixed(4)+' (${currency.priceChangePercentage24} %)',style: TextStyle(color: Colors.green));
                    }
                  else
                    {
                      return Text(priceChanged.toStringAsFixed(4),style: TextStyle(color: Colors.red));
                    }
                })
              ]
              ),
              Divider(height: 50),
              Expanded(
                  child:GridView.count(crossAxisCount: 2,mainAxisSpacing: 3,childAspectRatio: 2,
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()
                    ),
                    children: [
                    DetailCard(context: context,title:'Market Cap',detail: currency.marketCap),
                    DetailCard(context: context,title: 'Market Cap Rank',detail: currency.marketCapRank),
                    DetailCard(context: context,title: 'Circulating Supply',detail: currency.circulatingSupply),
                    DetailCard(context: context,title: 'Low 24h',detail: currency.circulatingSupply),
                    DetailCard(context:context,title: 'High 24h',detail:currency.circulatingSupply),
                  ],)

              )
            ],
          );
        },
      )
    );
  }
}


