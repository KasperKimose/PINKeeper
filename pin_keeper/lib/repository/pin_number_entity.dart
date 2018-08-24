import 'package:flutter/material.dart';
import 'package:pin_keeper/helpers/colors_list.dart';

class PINNumberEntity {

  final int id;
  final Color color;
  final int number;

  PINNumberEntity(this.id, this.color, this.number);

  static PINNumberEntity fromJson(Map<String, Object> json){
    return PINNumberEntity(
      json['id'] as int,
      ColorList.colors[json['id'] as int],
      json['number'] as int
    );
  }

  Map<String, Object> toJson(){
    return {
      "id": id,
      "number": number
    };
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINNumberEntity && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id, number=$number)";
}