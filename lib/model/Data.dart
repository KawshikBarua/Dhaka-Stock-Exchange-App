class Data {
  String tradingCode = "";
  String value = "";
  String high = "";
  String low = "";
  String ltp = "";
  String closeP = "";
  String ycp = "";
  String change = "";
  String volume = "";

  Data(
      {required this.tradingCode,
      required this.value,
      required this.high,
      required this.low,
      required this.ltp,
      required this.closeP,
      required this.ycp,
      required this.change,
      required this.volume});

  factory Data.fromJson(dynamic json) => Data(
        tradingCode: json["TRADING_CODE"] as String,
        value: json["VALUE"] as String,
        high: json["HIGH"] as String,
        low: json["LOW"] as String,
        ltp: json["LTP"] as String,
        closeP: json["CLOSEP"] as String,
        ycp: json["YCP"] as String,
        change: json["CHANGE"] as String,
        volume: json["VOLUME"] as String,
      );
}
