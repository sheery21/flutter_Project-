import 'package:donation_drive/features/Model/QRTokenModel.dart';
import 'package:donation_drive/widgets/ButtonsField/buttonField.dart';
import 'package:donation_drive/widgets/InputField/inputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserdetailsSheet extends StatefulWidget {
  final QrTokenmodel item;

  const UserdetailsSheet({super.key, required this.item});

  @override
  State<UserdetailsSheet> createState() => _UserdetailsSheetState();
}

class _UserdetailsSheetState extends State<UserdetailsSheet> {
  late TextEditingController nameController;
  late TextEditingController cnicController;
  late TextEditingController phoneController;
  late TextEditingController familyController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.item.userName);
    cnicController = TextEditingController(text: widget.item.userCNIC);
    phoneController = TextEditingController(text: widget.item.userPhone);
    familyController = TextEditingController(
      text: widget.item.userNumberOfPeopleInHouse,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TOP BAR
          Container(
            width: 40,
            height: 5,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          /// TITLE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "User Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
            ],
          ),

          SizedBox(height: 16),

          /// USER IMAGE
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade100,
            child: ClipOval(
              child: SvgPicture.asset(
                widget.item.userImage,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 16),

          _input("Name", nameController),
          _input("CNIC", cnicController),
          _input("Phone", phoneController),
          _input("Family Members", familyController),
          SizedBox(height: 50),

          Buttonfield.Writebuttonfield(
            text: "Update",
            onPressed: () {
              widget.item.userName = nameController.text;
              widget.item.userCNIC = cnicController.text;
              widget.item.userPhone = phoneController.text;
              widget.item.userNumberOfPeopleInHouse = familyController.text;
              Get.back();
              Get.snackbar("Success", "Updated Successfully");
            },
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _input(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),

        Inputfield.InputUpdateBalField(controller: controller, hintText: title),

        SizedBox(height: 15),
      ],
    );
  }
}
