import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String originName;
  final String locationName;
  final int episodeCount;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.originName,
    required this.locationName,
    required this.episodeCount,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    gender,
    image,
    originName,
    locationName,
    episodeCount,
  ];
}
