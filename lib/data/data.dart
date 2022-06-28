import 'package:news_app/models/category_models.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = <CategoryModel>[];

  CategoryModel cm = CategoryModel();

  cm.categoryName = "Business";
  cm.imageURL = "https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80";
  categories.add(cm);

  cm = CategoryModel();
  cm.categoryName = "Entertainment";
  cm.imageURL = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categories.add(cm);

  //4
  cm = CategoryModel();
  cm.categoryName = "Health";
  cm.imageURL = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categories.add(cm);

  //5
  cm = CategoryModel();
  cm.categoryName = "Science";
  cm.imageURL = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categories.add(cm);

  //5
  cm = CategoryModel();
  cm.categoryName = "Sports";
  cm.imageURL = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categories.add(cm);

  //5
  cm = CategoryModel();
  cm.categoryName = "Technology";
  cm.imageURL = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categories.add(cm);

  return categories;

}