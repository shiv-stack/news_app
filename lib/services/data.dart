import 'package:news_app/model/categories_helper.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = List<CategoryModel>.empty(growable: true);
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=871&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1565009520170-c809ddd9ac3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1626080308314-d7868286cce2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1449356669056-f1c1e6e56b0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1973&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1032&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2070&q=80";
  category.add(categoryModel);
  return category;
}
