
import 'dart:convert';

class CounterModel {
	final int value;

	CounterModel({required this.value});

	Map<String, dynamic> toJson() {
		return {'value': value};
	}

	factory CounterModel.fromJson(Map<String, dynamic> json) {
		return CounterModel(value: json['value']);
	}
}
