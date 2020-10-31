import 'package:lia_frontend/datamodels/trade.dart';

class User {
  String id;
  String email;
  List<String> telephones;
  List<String> favorites;
  List<Trade> trades;

  User({this.id, this.email, this.telephones, this.favorites});

  User.fromJson(Map<String, dynamic> json) {
    this.telephones = List<String>();
    this.trades = List<Trade>();
    this.id = json['_id'];
    this.email = json['email'];
    for (var telephone in json['telephones']) {
      this.telephones.add(telephone);
    }
    for (var trade in json['trades']) {
      trades.add(Trade.fromJson(trade));
    }

    //favorites = json['data']['user']['favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['telephones'] = this.telephones;
    data['favorites'] = this.favorites;
  }

  @override
  String toString() {
    var aux =
        'id: $id - email: $email - telephones: ${telephones.join()} - trades: ';
    for (var trade in this.trades) {
      aux += trade.toString();
    }
    return aux;
  }
}

/*


{
    "success": true,
    "data": {
        "user": {
            "telephones": [
                "2995244782",
                "29425263879",
                "29425263879"
            ],
            "favorites": [],
            "_id": "5f9ca142816e5132249f4ed4",
            "email": "EMPLEADO_1",
            "trades": [
                {
                    "total_rating": 1,
                    "review_count": 1,
                    "validation_date": "2020-10-30T23:26:58.848Z",
                    "_id": "5f9ca143816e5132249f4ed9",
                    "trade": "gasista",
                    "expiracy_date": "2020-10-30T23:26:58.848Z"
                }
            ],
            "__v": 7
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZjljYTE0MjgxNmU1MTMyMjQ5ZjRlZDQiLCJpYXQiOjE2MDQxNzcxMzh9.Xco5MgI5T15sMicHt895bUKlef-xlauP--ftyufTp1o"
    }
}


 */
