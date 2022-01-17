class OrderBookModel {
  String topic;
  String action;
  String symbol;
  Data data;
  int time;

  OrderBookModel({this.topic, this.action, this.symbol, this.data, this.time});

  OrderBookModel.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    action = json['action'];
    symbol = json['symbol'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['topic'] = topic;
    data['action'] = action;
    data['symbol'] = symbol;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['time'] = time;
    return data;
  }
}

class Data {
  List<Bids> bids;
  List<Asks> asks;
  String timestamp;

  Data({this.bids, this.asks, this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['bids'] != null) {
      List bids = <Bids>[];
      for (int i = 0; i < json['bids'].length; i++) {
        bids.add(Bids.fromJson(json['bids'][i]));
      }
    }
    if (json['asks'] != null) {
      asks = <Asks>[];
      json['asks'].forEach((v) {
        asks.add(Asks.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (bids != null) {
      data['bids'] = bids.map((v) => v.toJson()).toList();
    }
    if (asks != null) {
      data['asks'] = asks.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Bids {
  double price;
  double piece;

  Bids({this.price, this.piece});

  Bids.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    piece = json['piece'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['price'] = price;
    data['piece'] = piece;
    return data;
  }
}

class Asks {
  double price;
  int piece;

  Asks({this.price, this.piece});

  Asks.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    piece = json['piece'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['price'] = price;
    data['piece'] = piece;
    return data;
  }
}
