
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Mock dependencies (if any) here
class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
  group('AnimalCubit Tests', () {
    late AnimalCubit animalCubit;
    
    setUp(() {
      animalCubit = AnimalCubit();
    });

    tearDown(() {
      animalCubit.close();
    });

    test('initial state is AnimalState with animal name "Cat"', () {
      expect(animalCubit.state.animal.name, 'Cat');
    });

    blocTest<AnimalCubit, AnimalState>(
      'emits AnimalState with animal name "Dog" when toggleAnimal is called from initial state',
      build: () => animalCubit,
      act: (cubit) => cubit.toggleAnimal(),
      expect: () => [isA<AnimalState>().having((state) => state.animal.name, 'name', 'Dog')],
    );

    blocTest<AnimalCubit, AnimalState>(
      'emits AnimalState with animal name "Cat" when toggleAnimal is called twice from initial state',
      build: () => animalCubit,
      act: (cubit) {
        cubit.toggleAnimal();
        cubit.toggleAnimal();
      },
      expect: () => [
        isA<AnimalState>().having((state) => state.animal.name, 'name', 'Dog'),
        isA<AnimalState>().having((state) => state.animal.name, 'name', 'Cat'),
      ],
    );
  });
}
