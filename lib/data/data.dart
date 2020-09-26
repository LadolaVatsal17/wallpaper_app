import 'package:wallpaper_app/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001cdd5e864dd9849f0951829315b060a53";

List<CategoriesModel> getCategories()
{


  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  //1
  categoriesModel.imgUrl = "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categorieName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //2
  categoriesModel.imgUrl = "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categorieName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //3
  categoriesModel.imgUrl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categorieName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //4
  categoriesModel.imgUrl = "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categorieName = "City";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //5
  categoriesModel.imgUrl = "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.categorieName = "Motivation";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //6
  categoriesModel.imgUrl = "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categorieName = "Bikes";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //7
  categoriesModel.imgUrl = "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categoriesModel.categorieName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}

