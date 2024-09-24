
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/cubits/counter_cubit.dart';
import 'package:counter_app/widgets/counter_display.dart';

class MockCounterCubit extends Mock implements CounterCubit {}

void main() {
	group('CounterScreen', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('should display initial counter value', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('should display counter incremented by 100', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(100);
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.text('100'), findsOneWidget);
		});

		testWidgets('should have an increment button', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.byType(FloatingActionButton), findsOneWidget);
		});

		testWidgets('should call increment on button press', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);
			when(() => counterCubit.increment()).thenReturn(null);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: CounterScreen(),
					),
				),
			);

			await tester.tap(find.byType(FloatingActionButton));
			verify(() => counterCubit.increment()).called(1);
		});
	});
}
