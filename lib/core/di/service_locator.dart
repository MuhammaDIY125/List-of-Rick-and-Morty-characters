import 'package:get_it/get_it.dart';

import '/core/network/dio_client.dart';
import '/features/characters/data/datasources/character_local_datasource.dart';
import '/features/characters/data/datasources/character_remote_datasource.dart';
import '/features/characters/data/repositories/character_repository_impl.dart';
import '/features/characters/domain/repositories/character_repository.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Network
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Datasources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(dioClient: sl()),
  );
  sl.registerLazySingleton<CharacterLocalDataSource>(
    () => CharacterLocalDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<CharacterRepository>(
    () =>
        CharacterRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );
}
