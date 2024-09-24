
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

void main() {
	group('CounterCubit', () {
		blocTest<CounterCubit, int>(
			'emits [100] when increment is called once',
			build: () => CounterCubit(),
			act: (cubit) => cubit.increment(),
			expect: () => [100],
		);

		blocTest<CounterCubit, int>(
			'emits [100, 200] when increment is called twice',
			build: () => CounterCubit(),
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [100, 200],
		);

		blocTest<CounterCubit, int>(
			'initial state is 0',
			build: () => CounterCubit(),
			verify: (cubit) => expect(cubit.state, 0),
		);
	});
}
