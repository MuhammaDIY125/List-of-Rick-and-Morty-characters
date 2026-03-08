import 'package:isar_community/isar.dart';

part 'character_cache_page_entity.g.dart';

@collection
class CharacterCachePageEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int page;

  late String payload;
}
