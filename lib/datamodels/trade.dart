class Trade {
  String id;
  int totalRating;
  int reviewCount;
  String trade;
  DateTime validationDate;
  DateTime expiracyDate;

  Trade.fromJson(Map<String, dynamic> json) {
    this.id = json['_id'];
    this.totalRating = json['total_rating'];
    this.reviewCount = json['review_count'];
    this.trade = json['trade'];

    this.validationDate = DateTime.parse(json['validation_date']);
    this.expiracyDate = DateTime.parse(json['expiracy_date']);
  }

  @override
  String toString() {
    return """
      id: $id - total_rating: $totalRating review_count: $reviewCount
      trade: $trade validation_date: $validationDate expiracy_date: $expiracyDate""";
  }
}

/*
"trades": [
                {
                    "total_rating": 1,
                    "review_count": 1,
                    "validation_date": "2020-10-30T23:26:58.848Z",
                    "_id": "5f9ca143816e5132249f4ed9",
                    "trade": "gasista",
                    "expiracy_date": "2020-10-30T23:26:58.848Z"
                }
            ]
          ...
            */
