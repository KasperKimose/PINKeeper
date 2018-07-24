import 'package:pin_keeper/models/pin_button.dart';

class PINCard {

  final List<PINButton> _numbers = <PINButton>[];

  PINCard();

  bool add(PINButton number){
    if(_numbers.isEmpty){
      number.updateNumber();
      _numbers.add(number);
      return true;
    }
    else{
      for(PINButton n in _numbers){
        if(number == n){
          n.updateNumber();
          return true;
        }
      }
    }
    return false;
  }
}