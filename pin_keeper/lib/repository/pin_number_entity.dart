import 'package:flutter/material.dart';

class PINNumberEntity {

  final int id;
  final Color color;
  final int number;

  PINNumberEntity(this.id, this.color, this.number);

  static PINNumberEntity fromJson(Map<String, Object> json){
    return PINNumberEntity(
      json['id'] as int,
      json['color'] as Color,
      json['number'] as int
    );
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is PINNumberEntity && other.hashCode == hashCode;

  @override
  String toString() => "(id=$id, number=$number)";
}