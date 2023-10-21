import 'package:hive/hive.dart';


part 'saved_product.g.dart';

@HiveType(typeId: 1)
class SavedProduct{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String coast;
  @HiveField(3)
  final String image;

  SavedProduct({required this.name, required this.description, required this.coast,required this.image});
}