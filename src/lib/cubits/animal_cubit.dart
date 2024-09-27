
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../models/animal_model.dart';

class AnimalState {
	final Animal animal;

	AnimalState({required this.animal});
}

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState(animal: Animal(name: 'Cat', icon: Icons.pets)));

	void toggleAnimal() {
		final newAnimal = state.animal.name == 'Cat'
			? Animal(name: 'Dog', icon: Icons.person)
			: Animal(name: 'Cat', icon: Icons.pets);
		emit(AnimalState(animal: newAnimal));
	}
}
