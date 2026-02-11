import 'package:flutter_12_start/Model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.name = "Burgers";
  categoryModel.image = "assets/images/Chicken-Burger.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  //2
  categoryModel.name = "Fries";
  categoryModel.image = "assets/images/fries_logo.png";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();

  //3
  categoryModel.name = "Wings";
  categoryModel.image = "assets/images/Wings_logo.png";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();

  //4
  categoryModel.name = "Sides";
  categoryModel.image = "assets/images/Sides_logo.png";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();

  //5
  categoryModel.name = "Bevorages";
  categoryModel.image = "assets/images/Bevorages.png";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();

  //6
  categoryModel.name = "Shakes";
  categoryModel.image = "assets/images/Shakes_logo.png";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();

  //7
  categoryModel.name = "Kids Meals";
  categoryModel.image = "assets/images/Kids Meals_logo.png";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();

  //8
  categoryModel.name = "Salads";
  categoryModel.image = "assets/images/Salads_logo.png";
  categories.add(categoryModel);

  categoryModel = new CategoryModel();

  return categories;
}
