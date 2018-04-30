class CreditCard {

  int _id;
  String _name;

  CreditCard(this._name);

  int get id => _id;
  String get name => _name;
  
  CreditCard.fromMap(Map map){
    this._id = map['id'];
    this._name = map['name'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map();
    map['name'] = _name;
    return map;
  }
}