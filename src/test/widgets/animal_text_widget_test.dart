
// test/widgets/animal_text_widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/widgets/animal_text_widget.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalTextWidget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat text with clock icon initially', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				BlocProvider.value(
					value: animalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalTextWidget(),
						),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog text with person icon when toggled', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Dog', icon: Icons.person)));

			await tester.pumpWidget(
				BlocProvider.value(
					value: animalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalTextWidget(),
						),
					),
				),
			);

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('taps on text should trigger toggleAnimal', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				BlocProvider.value(
					value: animalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalTextWidget(),
						),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			verify(() => animalCubit.toggleAnimal()).called(1);
		});
	});
}
