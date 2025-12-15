
import 'package:flutter_12_start/Model/Fries_model.dart';

List<FriesModel> getFries(){
  List<FriesModel> fries = [];
  FriesModel friesModel = new FriesModel();

  //1
  friesModel.name = "Regular Fries";
  friesModel.image = "fries1.png";
  friesModel.price = "\$7.99";
  friesModel.description = "secret sauce";
  friesModel.ingredients = "\$9.99";
  fries.add(friesModel);
  friesModel = new FriesModel();

  //2
  friesModel.name = "Medium Fries";
  friesModel.image = "fries2.png";
  friesModel.price = "\$10.99";
  friesModel.description = "secret sauce";
  friesModel.ingredients = "\$12.99";
  fries.add(friesModel);

  friesModel = new FriesModel();

  //3
  friesModel.name = "Large Fries";
  friesModel.image = "fries3.png";
  friesModel.price = "\$14.99";
  friesModel.description = "secret sauce";
  friesModel.ingredients = "\$16.99";
  fries.add(friesModel);

  friesModel = new FriesModel();

  return fries;
}

