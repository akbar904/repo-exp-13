
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/widgets/animal_text_widget.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal Switcher'),
			),
			body: Center(
				child: BlocBuilder<AnimalCubit, AnimalState>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () => context.read<AnimalCubit>().toggleAnimal(),
							child: AnimalTextWidget(animal: state.animal),
						);
					},
				),
			),
		);
	}
}
