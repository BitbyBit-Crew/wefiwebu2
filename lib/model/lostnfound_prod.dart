class LostnfoundData {
  String? name;
  int? createdAt;
  String? descrip;
  String? lastlocation;
  String? imgUrl;
  double? price;
  String? categid;
  int? quantity;

  LostnfoundData({
    this.name = "",
    this.createdAt = 0,
    this.descrip = "",
    this.lastlocation = "",
    this.imgUrl = "",
    this.price = 0,
    this.categid = "",
    this.quantity = 0,
  });

  LostnfoundData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    createdAt = json['createdAt'];
    descrip = json['descrip'];
    lastlocation = json['lastlocation'];
    imgUrl = json['imgUrl'];
    price = json['price'];
    categid = json['categid'];
    quantity = json['quantity'];
  }
  // Map<String, dynamic> toMap() {
  //   return {
  //     // 'Prod id': id,
  //     'Prod name': name,
  //     'Prod description': descrip,
  //     'Prod last location': lastlocation,
  //     // 'Prod image': imgUrl,
  //     'Reward price': price,
  //     // 'quantity': quantity
  //   };
  // }

  // @override
  // List<Object?> get props {
  //   return [
  //     name,
  //     descrip,
  //     lastlocation,
  //     price,
  //   ];
  // }

  // LostnfoundData copyWith({
  //   int? id,
  //   String? name,
  //   String? descrip,
  //   String? lastlocation,
  //   String? imgUrl,
  //   double? price,
  //   int? quantity,
  // }) {
  //   return LostnfoundData(
  //       // id: id ?? this.id,
  //       name: name ?? this.name,
  //       descrip: descrip ?? this.descrip,
  //       lastlocation: lastlocation ?? this.lastlocation,
  //       // imgUrl: imgUrl ?? this.imgUrl,
  //       price: price ?? this.price);
  //   // quantity: quantity ?? this.quantity);
  // }

  // factory LostnfoundData.fromSnapShot(DocumentSnapshot snap) {
  //   return LostnfoundData(
  //     // id: snap['id'],
  //     name: snap['Prod name'],
  //     descrip: snap['Prod description'],
  //     lastlocation: snap['Prod last location'],
  //     // imgUrl: snap['Prod image'],
  //     price: snap['Reward price'],
  //     // quantity: snap['quantity']
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // bool get stringfy => true;

  // static List<LostnfoundData> lnfproduct = [];
}
