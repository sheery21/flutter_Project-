import 'package:flitter_9_start/model/burger_model.dart';

List<BurgerModel> getBurger(){
  List<BurgerModel> burger =[];

  BurgerModel burgerModel = new BurgerModel();
  burgerModel.name ='Pizza Burger';
  burgerModel.image ='images/burger_1.png';
  burgerModel.price ='Rs.100';
  burger.add(burgerModel);
  burgerModel = new BurgerModel();
  burgerModel.name ='Cheese Burger';
  burgerModel.image ='images/burger_2.png';
  burgerModel.price ='Rs.150';
  burger.add(burgerModel);
  burgerModel = new BurgerModel();
  burgerModel.name ='Veggie Burger';
  burgerModel.image ='images/burger_3.png';
  burgerModel.price ='Rs.120';
  burger.add(burgerModel);burgerModel = new BurgerModel();
  burgerModel.name ='Pizza Burger';
  burgerModel.image ='images/burger_1.png';
  burgerModel.price ='Rs.100';
  burger.add(burgerModel);
  burgerModel = new BurgerModel();
  burgerModel.name ='Cheese Burger';
  burgerModel.image ='images/burger_2.png';
  burgerModel.price ='Rs.150';
  burger.add(burgerModel);
  burgerModel = new BurgerModel();
  burgerModel.name ='Veggie Burger';
  burgerModel.image ='images/burger_3.png';
  burgerModel.price ='Rs.120';
  burger.add(burgerModel);

  return burger;
}