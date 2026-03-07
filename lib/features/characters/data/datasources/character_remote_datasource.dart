import 'dart:developer' as developer;

import '/core/network/api_constants.dart';
import '/core/network/dio_client.dart';
import '/core/network/exceptions.dart';
import '/features/characters/data/models/character_dto.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterDto>> getCharacters(int page);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final DioClient _dioClient;

  CharacterRemoteDataSourceImpl({required DioClient dioClient})
    : _dioClient = dioClient;

  @override
  Future<List<CharacterDto>> getCharacters(int page) async {
    try {
      developer.log(
        'Fetching characters page $page',
        name: 'CharacterRemoteDataSource',
      );

      final response = await _dioClient.instance.get(
        ApiConstants.characterEndpoint,
        queryParameters: {'page': page},
      );

      // Получаем данные из ответа
      final data = response.data as Map<String, dynamic>?;
      if (data == null) {
        throw ParseException(message: 'Response data is null');
      }

      // Извлекаем список персонажей
      final results = data['results'] as List<dynamic>?;
      if (results == null) {
        throw ParseException(message: 'Results field is missing');
      }

      // Парсим каждого персонажа с обработкой ошибок
      final characters = <CharacterDto>[];
      for (final json in results) {
        try {
          characters.add(CharacterDto.fromJson(json as Map<String, dynamic>));
        } catch (e) {
          developer.log(
            'Failed to parse character: $json',
            name: 'CharacterRemoteDataSource',
            error: e,
          );
          throw ParseException(message: 'Malformed character data');
        }
      }

      developer.log(
        'Successfully fetched ${characters.length} characters',
        name: 'CharacterRemoteDataSource',
      );

      return characters;
    } on NetworkException {
      // Пробрасываем типизированные сетевые ошибки дальше
      rethrow;
    } catch (e) {
      developer.log(
        'Unexpected error fetching characters',
        name: 'CharacterRemoteDataSource',
        error: e,
      );
      throw UnknownException(message: 'Failed to fetch characters');
    }
  }
}
