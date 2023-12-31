class ClientList {
  String? clientId;
  String? clientName;
  String? marketName;
  String? areaId;
  String? areaName;
  String? thana;
  String? address;
  String? outstanding;

  ClientList({this.clientId,
    this.clientName,
    this.marketName,
    this.areaId,
    this.areaName,
    this.thana,
    this.address,
    this.outstanding});

  ClientList.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    marketName = json['market_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    thana = json['thana'];
    address = json['address'];
    outstanding = json['outstanding'];
  }
}