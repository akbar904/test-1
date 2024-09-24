
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/widgets/counter_display.dart';
import 'package:flutter/material.dart';

void main() {
	group('CounterDisplay Widget Tests', () {
		testWidgets('displays the correct counter value', (WidgetTester tester) async {
			// Arrange
			const int testValue = 100;
			const counterDisplayKey = Key('counterDisplay');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CounterDisplay(value: testValue, key: counterDisplayKey),
					),
				),
			);

			// Assert
			expect(find.byKey(counterDisplayKey), findsOneWidget);
			expect(find.text('100'), findsOneWidget);
		});
		
		testWidgets('displays zero when counter value is zero', (WidgetTester tester) async {
			// Arrange
			const int testValue = 0;
			const counterDisplayKey = Key('counterDisplay');

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: CounterDisplay(value: testValue, key: counterDisplayKey),
					),
				),
			);

			// Assert
			expect(find.byKey(counterDisplayKey), findsOneWidget);
			expect(find.text('0'), findsOneWidget);
		});
	});
}
