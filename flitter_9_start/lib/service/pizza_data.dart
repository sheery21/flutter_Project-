import 'package:flitter_9_start/model/pizza_model.dart';
import 'package:flutter/foundation.dart';

List<PizzaModel> getPizza(){
  List<PizzaModel> pizza =[];

  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name ='Cheese Pizza';
  pizzaModel.image ='images/pizza_1.png';
  pizzaModel.price ='Rs.100';
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name ='Pepperoni Pizza';
  pizzaModel.image ='images/pizza_2.png';
  pizzaModel.price ='Rs.150';
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name ='Veggie Pizza';
  pizzaModel.image ='images/pizza_3.png';
  pizzaModel.price ='Rs.120';
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();
  pizzaModel.name ='Cheese Pizza';
  pizzaModel.image ='images/pizza_1.png';
  pizzaModel.price ='Rs.100';
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name ='Pepperoni Pizza';
  pizzaModel.image ='images/pizza_2.png';
  pizzaModel.price ='Rs.150';
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();

  pizzaModel.name ='Veggie Pizza';
  pizzaModel.image ='images/pizza_3.png';
  pizzaModel.price ='Rs.120';
  pizza.add(pizzaModel);
  pizzaModel = new PizzaModel();
  return pizza;
}