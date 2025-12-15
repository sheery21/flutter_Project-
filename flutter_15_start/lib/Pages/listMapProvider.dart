import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];

  void addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }

  void upDateData( Map <String , dynamic> updateData , int index){
    _mData[index] = updateData;
    notifyListeners();
  }
  void deletedData(int index){
    _mData.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getData() => _mData;
}
