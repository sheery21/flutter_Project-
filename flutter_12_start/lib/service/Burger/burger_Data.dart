
import 'package:flutter_12_start/Model/burger_model.dart';

List<BurgerModel> getBurger(){
  List<BurgerModel> burger = [];
  BurgerModel burgerModel = new BurgerModel();

  //1
  burgerModel.name = "Crispy Chicken Burger";
  burgerModel.image = "burger1.png";
  burgerModel.price = "\$12.99";
  burgerModel.description = "Lettuce, tomatoes and secret sauce";
  burgerModel.ingredients = "\$14.99";
  burger.add(burgerModel);
  burgerModel = new BurgerModel();

  //2
  burgerModel.name = "Crispy Chicken Burger";
  burgerModel.image = "burger2.png";
  burgerModel.price = "\$10.99";
  burgerModel.description = "Lettuce, tomatoes and secret sauce";
  burgerModel.ingredients = "\$12.99";
  burger.add(burgerModel);

  burgerModel = new BurgerModel();

  //3
  burgerModel.name = "BBQ Chicken Club";
  burgerModel.image = "burger3.png";
  burgerModel.price = "\$11.99";
  burgerModel.description = "Cheddar cheese, BBQ sauce, lettuce,";
  burgerModel.ingredients = "\$13.99";


  burger.add(burgerModel);

  burgerModel = new BurgerModel();

  return burger;
}

