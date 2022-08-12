class CryptoCurrency{
  String? id;
  String? name;
  String? image;
  dynamic currentPrice;
  dynamic marketCapRank;
  dynamic marketCap;
  dynamic high24;
  dynamic low24;
  dynamic priceChange24;
  dynamic priceChangePercentage24;
  dynamic circulatingSupply;
  dynamic ath;
  dynamic atl;
  dynamic symbol;

  CryptoCurrency({this.name,this.ath,this.atl,this.circulatingSupply,this.currentPrice,this.high24,this.id,this.image,this.low24,this.marketCap,this.marketCapRank,this.priceChange24,this.priceChangePercentage24,this.symbol});

  factory CryptoCurrency.fromMap(Map data)
  {
    return CryptoCurrency(
        id:data['id'],
        name: data['name'],
        image: data['image'],
        ath: data['ath'],
        atl: data['atl'],
        circulatingSupply: data['circulating_supply'],
        currentPrice: data['current_price'],
        marketCap: data['market_cap'],
        marketCapRank: data['market_cap_rank'],
        high24: data['high_24h'],
        low24: data['low_24h'],
        priceChange24: data['price_change_24h'],
        priceChangePercentage24: data['price_change_percentage_24h'],
        symbol:data['symbol']
    );
  }

}