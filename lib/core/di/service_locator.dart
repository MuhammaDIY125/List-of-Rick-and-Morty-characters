import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

import '/core/network/dio_client.dart';
import '/core/network/api_constants.dart';
import '../storage/preferences_service.dart';
import '/features/characters/data/datasources/character_local_datasource.dart';
import '/features/characters/data/datasources/character_remote_datasource.dart';
import '/features/characters/data/repositories/character_repository_impl.dart';
import '/features/characters/domain/repositories/character_repository.dart';
import '/features/favorites/data/datasources/favorites_local_datasource.dart';
import '/features/favorites/data/models/favorite_character_entity.dart';
import '/features/favorites/data/repositories/favorites_repository_impl.dart';
import '/features/favorites/domain/repositories/favorites_repository.dart';
import '/features/favorites/presentation/cubit/favorites_cubit.dart';
import '/features/characters/presentation/cubit/characters_cubit.dart';
import '/core/theme/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  await Preferences.instance.init();

  // Database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    FavoriteCharacterEntitySchema,
  ], directory: dir.path);
  sl.registerSingleton<Isar>(isar);

  // Network
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        validateStatus: (status) => status != null && status < 400,
      ),
    ),
  );
  sl.registerLazySingleton<DioClient>(() => DioClient(dio: sl()));

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
  sl.registerFactory(() => FavoritesCubit(repository: sl()));
  sl.registerLazySingleton(() => ThemeCubit(Preferences.instance));
}
