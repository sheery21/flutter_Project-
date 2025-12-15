import 'package:flitter_9_start/model/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> categories = [];

  CategoryModel categoryModel = new CategoryModel();

  categoryModel.name =' pizza';
  categoryModel.image ='images/pizza_icon.png';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name =' Burger';
  categoryModel.image ='images/burger_icon.png';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name ='Chinese';
  categoryModel.image ='images/chinese-icon.png';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name ='Pakistani';
  categoryModel.name ='Pakistani';
  categoryModel.image ='images/pakistani_icon.png';
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  return categories;
}