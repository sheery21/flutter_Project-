
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flitter_9_start/service/shared_pref.dart';

class DatabaseMethods{

  Future addUserDetails(
      Map<String , dynamic>
      userInfoMap, String id ) async{
    return await FirebaseFirestore
        .instance.collection('user')
        .doc(id).set(userInfoMap);
  }

  Future addUserOrderDetails(Map<String
  , dynamic> userOderMap, String id , String orderId )async{
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
     .collection('Oder').
    doc(orderId).
    set(userOderMap);
  }

  Future addAdminOrderDetails(Map<String
  , dynamic> userOderMap, String orderId )async{
    return await FirebaseFirestore.instance
     .collection('Oder').
    doc(orderId).
    set(userOderMap);
  }
  Future <Stream<QuerySnapshot>> getUserOder(String id) async{
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('Oder').snapshots();
  }
  Future<QuerySnapshot> getUserWalletbyemail( String email) async{
    return await FirebaseFirestore.instance
        .collection('user').where('Email',isEqualTo: email).get();
  }
  Future updateUserWallet( String amount , String id) async {
    return await FirebaseFirestore.instance
        .collection('user').doc(id).update({'Wallet': amount});
  }
  Future <Stream<QuerySnapshot>> getAdminOder() async{
    return await FirebaseFirestore.instance
        .collection('Oder').where("status",isEqualTo:  "pending").snapshots();
  }
  Future updateAdminOrder( String id) async{
    return await FirebaseFirestore.instance
        .collection('Oder').doc(id).update({'status' : "Delivered"});
  }
  Future updateUserOrder( String userid , String docid) async{
    return await FirebaseFirestore.instance
        .collection('user').doc(userid).collection("Oder").doc(docid).update({'status' : "Delivered"});
  }
  Future <Stream<QuerySnapshot>> getAllUser() async{
    return await FirebaseFirestore.instance
        .collection('user').snapshots();
  }
  Future deleteUser( String id) async{
    return await FirebaseFirestore.instance
        .collection('user').doc(id).delete();
  }

  Future addUserTransaction(Map<String
  , dynamic> userOderMap, String id )async{
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('Transaction').
    add(userOderMap);
  }

  Future <Stream<QuerySnapshot>> getUserTransaction(String id) async{
    return await FirebaseFirestore.instance
        .collection('user').doc(id).collection('Transaction').snapshots();
  }

  List<String> generateKeywords(String text) {
    text = text.toLowerCase();
    List<String> keywords = [];
    for (int i = 1; i <= text.length; i++) {
      keywords.add(text.substring(0, i));
    }
    return keywords;
  }

  Future addFoodItem() async {
    String name = "Burger";
    await FirebaseFirestore.instance.collection("Food").add({
      "name": name,
      "price": "50",
      "image": "images/burger.png",
      "category": "fastfood",
      "keywords": generateKeywords(name), // ["b","bu","bur","burg","burge","burger"]
    });
  }
  Future<QuerySnapshot> search(String value) async {
    return await FirebaseFirestore.instance
        .collection('Food')
        .where('keywords', arrayContains: value.toLowerCase())
        .get();
  }


  Future<QuerySnapshot> getFoodByCategory(String category) async {
    return await FirebaseFirestore.instance
        .collection('Food')
        .where('category', isEqualTo: category)
        .get();
  }
}

