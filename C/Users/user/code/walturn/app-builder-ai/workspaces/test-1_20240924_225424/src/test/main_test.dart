
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/main.dart';

// Mock Cubit
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('MainApp', () {
		testWidgets('renders CounterScreen', (tester) async {
			await tester.pumpWidget(MainApp());
			expect(find.byType(CounterScreen), findsOneWidget);
		});
	});
}
