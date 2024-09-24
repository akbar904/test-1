
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/models/counter_model.dart';

void main() {
	group('CounterModel', () {
		test('should create an instance of CounterModel with the initial value', () {
			final counterModel = CounterModel(value: 0);
			expect(counterModel.value, 0);
		});
		
		test('should correctly serialize and deserialize CounterModel', () {
			final counterModel = CounterModel(value: 100);
			final json = counterModel.toJson();
			expect(json['value'], 100);

			final deserializedCounterModel = CounterModel.fromJson(json);
			expect(deserializedCounterModel.value, 100);
		});
		
		// Add more tests as needed to cover other public methods and behaviors.
	});
}
