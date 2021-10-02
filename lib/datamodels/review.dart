class Review {
  String id;
  String contract;
  String title;
  String description;
  dynamic rating;

  Review({this.id, this.contract, this.title, this.description, this.rating});

  Review.fromJson(Map<String, dynamic> json) {
    this.id = json['_id'];
    this.contract = json['contract'];
    this.title = json['title'];
    this.description = json['description'];
    this.rating = json['rating'];
  }
}
