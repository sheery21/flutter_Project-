import 'package:flutter/material.dart';

class HomePgageProvider with ChangeNotifier {
  bool? isEligibal;
  String? eligibiltyMessage;

  void checkEligibilty(int age){
    if(age >= 18){
      isEligibal = true;
      eligibiltyMessage = 'You are eligible!';
      notifyListeners();
    }else{
      isEligibal = false;
      eligibiltyMessage = 'You are not eligible!';
      notifyListeners();
    }
  }
 }