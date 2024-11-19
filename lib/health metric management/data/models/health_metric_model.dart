import 'dart:convert';
import '../../domain/entities/health_metric.dart';

class HealthMetricModel extends HealthMetric {
  const HealthMetricModel({
    required String id,
    required String patientId,
    required DateTime date,
    required double systolicBP,
    required double diastolicBP,
    required double heartRate,
    required double weight,
    required double bloodSugar,
  }) : super(
          id: id,
          patientId: patientId,
          date: date,
          systolicBP: systolicBP,
          diastolicBP: diastolicBP,
          heartRate: heartRate,
          weight: weight,
          bloodSugar: bloodSugar,
        );

// Factory method to create a HealthMetricModel from a Map
  factory HealthMetricModel.fromMap(Map<String, dynamic> map) {
    return HealthMetricModel(
      id: map['id'] as String,
      patientId: map['patientId'] as String,
      date: map['date'] is String
          ? DateTime.tryParse(map['date']) ?? DateTime.now()
          : map['date'] as DateTime,
      systolicBP: (map['systolicBP'] as num?)?.toDouble() ?? 0.0,
      diastolicBP: (map['diastolicBP'] as num?)?.toDouble() ?? 0.0,
      heartRate: (map['heartRate'] as num?)?.toDouble() ?? 0.0,
      weight: (map['weight'] as num?)?.toDouble() ?? 0.0,
      bloodSugar: (map['bloodSugar'] as num?)?.toDouble() ?? 0.0,
    );
  }

 // Factory method to create a HealthMetricModel from a JSON string
  factory HealthMetricModel.fromJson(String source) =>
      HealthMetricModel.fromMap(json.decode(source));

  // Method to convert an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientId': patientId,
      'date': date.toIso8601String(),
      'systolicBP': systolicBP,
      'diastolicBP': diastolicBP,
      'heartRate': heartRate,
      'weight': weight,
      'bloodSugar': bloodSugar,
    };
  }

  // Method to convert a HealthMetricModel to a JSON string
  String toJson() => json.encode(toMap());
}
  