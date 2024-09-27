
import 'package:flutter/material.dart';

class Animal {
	final String name;
	final IconData icon;

	Animal({required this.name, required this.icon});

	@override
	bool operator ==(Object other) {
		if (identical(this, other)) return true;
		if (other is! Animal) return false;
		return name == other.name && icon == other.icon;
	}

	@override
	int get hashCode => name.hashCode ^ icon.hashCode;

	@override
	String toString() {
		return 'Animal(name: $name, icon: $icon)';
	}
}
