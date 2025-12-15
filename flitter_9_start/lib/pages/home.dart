
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flitter_9_start/model/burger_model.dart';
import 'package:flitter_9_start/model/category_model.dart';
import 'package:flitter_9_start/model/chinese_model.dart';
import 'package:flitter_9_start/model/pakistani_model.dart';
import 'package:flitter_9_start/model/pizza_model.dart';
import 'package:flitter_9_start/pages/detail_page.dart';
import 'package:flitter_9_start/service/burger_data.dart';
import 'package:flitter_9_start/service/category_data.dart';
import 'package:flitter_9_start/service/chinese_data.dart';
import 'package:flitter_9_start/service/database.dart';
import 'package:flitter_9_start/service/pakistani_data.dart';
import 'package:flitter_9_start/service/pizza_data.dart';
import 'package:flitter_9_start/service/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<PizzaModel> pizza =[];
  List<BurgerModel> burger =[];
  List<ChineseModel> chinese =[];
  List<PakistaniModal> pakistani =[];
  String track = '0';
  bool search = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    categories = getCategories();
    pizza = getPizza();
    burger = getBurger();
    chinese =getChinese();
    pakistani = getPakistani();
    super.initState();
  }
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(String value) {
    if (value.isEmpty) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
        search = false;
      });
      return;
    }
    setState(() {
      search = true;
    });

    String searchValue = value.toLowerCase();

    if (queryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().search(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data());
        }
        setState(() {}); // UI refresh
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['name'].toString().toLowerCase().startsWith(searchValue)) {
          tempSearchStore.add(element);
        }
      });
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20.0,top: 40.0),
        child: Column(
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/foodlogo.png',height: 90.0,width: 180.0,fit: BoxFit.contain,),
              Text('Order your favuorite foood!',style: AppWidget.SimpleTextFeildStyle(),)
            ],
          ),
          Image.asset('images/user_img.png',height: 90.0,),
        ],),
            SizedBox(height: 20.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFececf8)),
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            initiateSearch(value.toUpperCase());
                          },
                          decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search food item...',
                        ),
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: search
                      ? GestureDetector(
                    onTap: () {
                      setState(() {
                        searchController.text = '';
                        queryResultSet = [];
                        tempSearchStore = [];
                        search = false;
                      });
                    },
                    child: Icon(Icons.close, color: Colors.white, size: 30.0),
                  )
                      : Icon(Icons.search, color: Colors.white, size: 30.0),
                ),

              ],
            ),
            search == true && tempSearchStore.isNotEmpty
                ? Expanded(child: ListView(
              children: tempSearchStore.map((element){
                return ListTile(
                  leading: Image.asset(element['image'], height: 50, width: 50),
                  title: Text(element['name']),
                  subtitle: Text("Rs ${element['price']}"),
                );
              }).toList(),
            ),
            ): Container(),

            Container(
              margin: EdgeInsets.only(top: 20.0),
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              child:
              ListView.builder(
                shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemCount: categories.length,
               itemBuilder: (context, index ,)  {
                  return  CategoryTile(
                      categories[index].name!,
                      categories[index].image!,
                      index.toString()
                      );
               }),
            ),
            SizedBox(height: 10.0,),
              track == "0"? Expanded(
                 child: GridView.builder(
                   padding: EdgeInsets.zero,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     childAspectRatio: 0.69,
                     mainAxisSpacing:5.0,
                     crossAxisSpacing: 5.0),

                     itemCount: pizza.length,
                     itemBuilder: (context, index){
                       return FooTile(
                           pizza[index].name!,
                         pizza[index].image!,
                         pizza[index].price!
                       );
                     }),
               ): track == '1' ? Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.69,
                        mainAxisSpacing:5.0,
                        crossAxisSpacing: 5.0),

                    itemCount: burger.length,
                    itemBuilder: (context, index){
                      return FooTile(
                          burger[index].name!,
                          burger[index].image!,
                          burger[index].price!
                      );
                    }),
              ): track == '2' ? Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.69,
                        mainAxisSpacing:5.0,
                        crossAxisSpacing: 5.0),

                    itemCount: chinese.length,
                    itemBuilder: (context, index){
                      return FooTile(
                          chinese[index].name!,
                          chinese[index].image!,
                          chinese[index].price!
                      );
                    }),
              ) : track == '3' ? Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.69,
                        mainAxisSpacing:5.0,
                        crossAxisSpacing: 5.0),

                    itemCount: pakistani.length,
                    itemBuilder: (context, index){
                      return FooTile(
                          pakistani[index].name!,
                          pakistani[index].image!,
                          pakistani[index].price!
                      );
                    }),
              ):Container(),


      ],),),
    );
  }

  Widget FooTile(String name, String image, String price){
    return Container(
      margin: EdgeInsets.only(right: 10.0,bottom: 10.0),
      padding: EdgeInsets.only(left: 10.0,top: 10.0,),
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.black38 ),
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFFececf8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(image,height: 130.0,width: 130.0,fit: BoxFit.contain,)),
          Text(name,style: AppWidget.boldTextFeildStyle(),),
          Text(price,style: AppWidget.priceTextFeildStyle(),),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(image: image, name: name, price: price)));
                  },
                  child: Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(19.0)
                      ),
                    ),
                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 30.0,),
                  ),
                ),
              ),
            ],
          )
        ],
      ),

    );
  }

  Widget CategoryTile(String name,String image, String categoryindex){
    return GestureDetector(
      onTap: (){
        track =categoryindex.toString();
        setState(() {});
      },
      child: track == categoryindex.toString()
          ? Container(
        margin: EdgeInsets.only(right: 20.0,bottom: 5.0),
            child: Material(
                    elevation: 5.0,
            borderRadius: BorderRadius.circular(20.0),
              child: Container(
                      padding: EdgeInsets.only(left: 10.0,right: 20.0),
                      decoration: BoxDecoration(
                color: Color(0xffef2b39),
                borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Row(
              children: [
                Image.asset(image,height: 50.0,width: 50.0,),
                SizedBox(width: 4.0,),
                Text(name,style: AppWidget.whiteTextFeildStyle(),),
              ],
                      ),
                    ),
            ),
          ) : Container(
        padding: EdgeInsets.only(left: 10.0,right: 20.0),
        margin: EdgeInsets.only(right: 20.0,bottom: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFFececf8),
        ),
        child: Row(
          children: [
            Image.asset(image,height: 50.0,width: 50.0,),
            SizedBox(width: 4.0,),
            Text(name,style: AppWidget.SimpleTextFeildStyle(),),
          ],
        ),
      ),
    );
  }


}