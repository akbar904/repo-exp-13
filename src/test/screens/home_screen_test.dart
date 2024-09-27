
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/screens/home_screen.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('Initial display shows Cat with clock icon', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>.value(
						value: animalCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Tapping changes display to Dog with person icon', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>.value(
						value: animalCubit,
						child: HomeScreen(),
					),
				),
			);

			whenListen(animalCubit, Stream.fromIterable([AnimalState(animal: Animal(name: 'Dog', icon: Icons.person))]));

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
