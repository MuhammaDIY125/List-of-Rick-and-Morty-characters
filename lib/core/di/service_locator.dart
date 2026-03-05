import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '/core/network/dio_client.dart';
import '/features/characters/data/datasources/character_local_datasource.dart';
import '/features/characters/data/datasources/character_remote_datasource.dart';
import '/features/characters/data/repositories/character_repository_impl.dart';
import '/features/characters/domain/repositories/character_repository.dart';
import '/features/favorites/data/datasources/favorites_local_datasource.dart';
import '/features/favorites/data/models/favorite_character_entity.dart';
import '/features/favorites/data/repositories/favorites_repository_impl.dart';
import '/features/favorites/domain/repositories/favorites_repository.dart';
import '/features/characters/presentation/cubit/characters_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    FavoriteCharacterEntitySchema,
  ], directory: dir.path);
  sl.registerSingleton<Isar>(isar);

  // Network
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Datasources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(dioClient: sl()),
  );
  sl.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(isar: sl()),
  );

  // Repositories
  sl.registerLazySingleton<CharacterRepository>(
    () =>
        CharacterRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(localDataSource: sl()),
  );

  // Cubits
  sl.registerFactory(() => CharactersCubit(repository: sl()));
}
