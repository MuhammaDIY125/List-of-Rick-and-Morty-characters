import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/di/service_locator.dart';
import '../cubit/characters_cubit.dart';
import '../widgets/characters_screen.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CharactersCubit>()..fetchCharacters(),
      child: const CharactersScreen(),
    );
  }
}
