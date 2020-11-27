class Contract {
  String id;
  String status;
  bool hasReview;
  String trade;
  String employee;
  String employer;

  Contract(
      {this.id,
      this.status,
      this.hasReview,
      this.trade,
      this.employee,
      this.employer});

  Contract.fromJson(Map<String, dynamic> json) {
    this.id = json['_id'];
    this.status = json['status'];
    this.hasReview = json['has_review'];
    this.trade = json['trade'];
    this.employee = json['employee'];
    this.employer = json['employer'];
  }
}
