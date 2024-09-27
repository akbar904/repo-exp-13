
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/models/animal_model.dart';

void main() {
  group('Animal Model Tests', () {
    test('Animal model should be instantiated correctly', () {
      final animal = Animal(name: 'Cat', icon: Icons.pets);
      expect(animal.name, 'Cat');
      expect(animal.icon, Icons.pets);
    });

    test('Animal model should have correct properties', () {
      final animal = Animal(name: 'Dog', icon: Icons.person);
      expect(animal.name, 'Dog');
      expect(animal.icon, Icons.person);
    });

    test('Animal model equality', () {
      final animal1 = Animal(name: 'Cat', icon: Icons.pets);
      final animal2 = Animal(name: 'Cat', icon: Icons.pets);
      final animal3 = Animal(name: 'Dog', icon: Icons.person);

      expect(animal1, equals(animal2));
      expect(animal1, isNot(equals(animal3)));
    });

    test('Animal model toString method', () {
      final animal = Animal(name: 'Cat', icon: Icons.pets);
      expect(animal.toString(), 'Animal(name: Cat, icon: IconData(U+0E91D))');
    });
  });
}
