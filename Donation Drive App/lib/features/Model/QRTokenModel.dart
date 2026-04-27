import 'dart:ui';

import 'package:flutter/material.dart';

class QrTokenmodel {
  final String serialNumber;
  final String campaign;
  final String status;
  final String QR_Code;
  final DateTime generatedData;
   String userName;
   String userCNIC;
   String userPhone;
   String userNumberOfPeopleInHouse;
   String  userImage;

  QrTokenmodel({
    required this.serialNumber,
    required this.campaign,
    required this.status,
    required this.QR_Code,
    required this.generatedData,
    required this.userName,
    required this.userCNIC,
    required this.userPhone,
    required this.userNumberOfPeopleInHouse,
    required this.userImage,
  });
}
