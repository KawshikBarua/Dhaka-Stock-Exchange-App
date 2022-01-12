import 'dart:async';
import 'package:stock_market/model/Data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  Future<List<Data>?> getallposts() async {
    try {
      var uri =
          Uri.https('dhaka-stock-exchange-dse.p.rapidapi.com', '/latest_price');

      final response = await http.get(uri, headers: {
        "x-rapidapi-host": "dhaka-stock-exchange-dse.p.rapidapi.com",
        "x-rapidapi-key": '5808cd723emsh03061c34e95aae2p182212jsn3c4a1c233d07'
      });

      if (response.statusCode == 200) {
        Map jsonresponse = jsonDecode(response.body);
        List _temp = [];
        for (var i in jsonresponse["market_info"]) {
          _temp.add(i);
        }
        return _temp.map((e) => new Data.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }
}
