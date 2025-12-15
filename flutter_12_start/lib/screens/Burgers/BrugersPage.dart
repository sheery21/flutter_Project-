import 'package:flutter/material.dart';
import 'package:flutter_12_start/Model/Fries_model.dart';
import 'package:flutter_12_start/Model/burger_model.dart';
import 'package:flutter_12_start/Model/category_model.dart';
import 'package:flutter_12_start/service/CategoryModel/CategoryModelpage.dart';
import 'package:flutter_12_start/service/Fries/Fries_Data.dart';

import '../../service/Burger/burger_Data.dart';
import '../../widgets/uihelpar.dart';

class CatgorTile extends StatefulWidget {
  final String categoryName;
  const CatgorTile({super.key, required this.categoryName});

  @override
  State<CatgorTile> createState() => _CatgorTileState();
}

class _CatgorTileState extends State<CatgorTile> {
  TextEditingController searchController = TextEditingController();
  List<CategoryModel> categories = [];
  List<BurgerModel> burger = [];
  List<FriesModel> fries = [];
  String track = '0';
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    burger = getBurger();
    fries = getFries();
    if(widget.categoryName == 'Burgers'){
      track = 'Burgers';
    }else if(widget.categoryName == 'Fries'){
      track = 'Fries';
    }else if(widget.categoryName == 'Wings'){
      track = 'Wings';
    }else if(widget.categoryName == 'Sides'){
      track = 'Sides';
    }else if(widget.categoryName == 'Bevorages'){
      track = 'Bevorages';
    }else if(widget.categoryName == 'Shakes'){
      track = 'Shakes';
    }else if(widget.categoryName == 'Kids Meals'){
      track = 'Kids Meals';
    }else if(widget.categoryName == 'Salads'){
      track = 'Salads';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Boardwalk ${ track == widget.categoryName ? widget.categoryName : track }',
          style: UiHelper.boldBlueTextFeildStyle(),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9FAFB),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFF9FAFB),
        child: Padding(
          padding: const EdgeInsets.only( left: 10.0, right: 10.0 , bottom: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: UiHelper.CustomWhiteTextField(
                  controller: searchController,
                  text: "Search for foods...",
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.1,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CatgoryTile(
                       categories[index].name!,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
             track == "Burgers" ? Expanded(
                child: Container(
                  height: 399,
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1.1,
                      mainAxisSpacing: 15.0 ),itemCount: burger.length,
                      itemBuilder: (context, index) {
                        return FoodTile(burger[index].image!, burger[index].name!, burger[index].price!, burger[index].description!, burger[index].ingredients!);
                      },),
                ),
              ) :  Expanded(
               child: Container(
                 height: 399,
                 child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 1, childAspectRatio: 1.1,
                     mainAxisSpacing: 15.0 ),itemCount: burger.length,
                   itemBuilder: (context, index) {
                     return FoodTile( fries[index].image!, fries[index].name!, fries[index].price!, fries[index].description!, fries[index].ingredients!);
                   },),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }

  FoodTile(String image, String name, String price ,String description,String ingredients) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(0xFF9CA3AF)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.2),
        //     spreadRadius: 1,
        //     blurRadius: 2,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
              child: Image.asset("assets/images/$image", height: 197.0, width: double.infinity, fit: BoxFit.cover,  )),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: UiHelper.boldBlackTextFeildStyle()),
                  SizedBox(width: 10,),
                  Row(children: [Icon(Icons.star , color: Color(0xFFFACC15),), Text('4.5', style: UiHelper.blackTextFeildStyle())],),
                ],
              ),
                        ),
                        SizedBox(height: 8.0,),
                        Text( description, style: UiHelper.ShortTextFeildStyle(),),
                        SizedBox(height: 10,),
                        Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        ingredients,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough ,
                          decorationColor: Colors.grey,
                          decorationThickness: 2.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text('${price}', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900, color: Color(0xFF3078BE))),
                    ],
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFF3078BE),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: IconButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ));
    },
                        icon: Icon(Icons.add, color: Colors.white, size: 20),
                  )
                  )
                ],
              ),
                        ),
              ],),
            ),
          ),
        ],
      ),
    );
  }


  CatgoryTile( String name){
    return GestureDetector(
      onTap: () {
        track = name.toString();
        setState(() {
        });
      },

      child: track == name ? Container(
        width: 125,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFF3078BE),
          borderRadius: BorderRadius.circular(30),
            boxShadow: [
           BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
             blurRadius: 10, // soft aur bada shadow
             offset: const Offset(0, 6),
           ),
      ]
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ) : Container(
        width: 125,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}