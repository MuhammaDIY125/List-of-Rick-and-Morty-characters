import 'package:isar_community/isar.dart';

part 'favorite_character_entity.g.dart';

@collection
class FavoriteCharacterEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int characterId;

  late String name;
  late String image;
  late String status;
  late String species;
  late String gender;
  late String originName;
  late String locationName;
  late int episodeCount;
}
