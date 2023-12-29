import 'package:chat_app/ui/utils/app_assets.dart';

class Category{
  int id;
  String name;
  String imagePath;

  Category(this.id, this.name, this.imagePath);
  static List<Category> categores = [Category(1, "Sorts", AppAssets.sports),
    Category(2, "music", AppAssets.music),Category(3, "movies", AppAssets.movies)];
}