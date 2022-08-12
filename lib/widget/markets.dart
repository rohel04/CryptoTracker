import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker/provider/MarketProvider.dart';
import 'package:provider/provider.dart';
import 'package:cryptocurrency_tracker/service/API.dart';
import 'package:cryptocurrency_tracker/model/cryptoCurrency.dart';
import 'package:cryptocurrency_tracker/screens/details.dart';

class Markets extends StatefulWidget {
  const Markets({Key? key}) : super(key: key);

  @override
  State<Markets> createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Consumer<MarketProvider>(
          builder: (context,marketProvider,child){
            if(marketProvider.isLoading==true)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              if(marketProvider.markets.length>0)
              {
                return RefreshIndicator(
                  onRefresh: () async{
                    await API.getData();
                  },
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()
                    ),
                    itemCount: marketProvider.markets.length,
                    itemBuilder: (context,index){
                      CryptoCurrency cryptoCurrency=marketProvider.markets[index];
                      return ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(id:cryptoCurrency.id)));
                        },
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage('${cryptoCurrency.image}'),
                        ),
                        title: Text('${cryptoCurrency.name}'+' #${cryptoCurrency.marketCapRank}'),
                        subtitle: Text(cryptoCurrency.symbol.toString().toUpperCase()),
                        trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("₹ "+cryptoCurrency.currentPrice.toString(),style: TextStyle(fontSize: 16,color: Colors.blue),),
                              Builder(builder: (context){
                                double priceChanged=double.parse(cryptoCurrency.priceChange24.toString());
                                if(priceChanged<0)
                                {
                                  return Text('${priceChanged.toStringAsFixed(3)}',style: TextStyle(color: Colors.red));
                                }
                                else{
                                  return Text('${priceChanged.toStringAsFixed(3)}',style: TextStyle(color: Colors.green));
                                }
                              })

                            ]),
                      );
                    },
                  ),
                );
              }
              else{
                return Text('Data Not found');
              }
            }
          },
        )
    );
  }
}
