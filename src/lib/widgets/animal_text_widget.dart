
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';

class AnimalTextWidget extends StatelessWidget {
	const AnimalTextWidget({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<AnimalCubit, AnimalState>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () {
						context.read<AnimalCubit>().toggleAnimal();
					},
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state.animal.name),
							SizedBox(width: 8),
							Icon(state.animal.icon),
						],
					),
				);
			},
		);
	}
}
