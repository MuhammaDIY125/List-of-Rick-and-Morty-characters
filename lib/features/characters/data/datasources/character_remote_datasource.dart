import '/core/network/api_constants.dart';
import '/core/network/dio_client.dart';
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
    final response = await _dioClient.instance.get(
      ApiConstants.characterEndpoint,
      queryParameters: {'page': page},
    );

    final data = response.data as Map<String, dynamic>;
    final results = data['results'] as List<dynamic>;
    return results.map((json) => CharacterDto.fromJson(json)).toList();
  }
}
