import 'package:health_metrics_tracker/health%20metric%20management/domain/entities/health_metric.dart';

abstract class HealthMetricRemoteDataSource {
  HealthMetricRemoteDataSource(Object object);

  Future<void> addHealthMetric(HealthMetric healthMetric);
  Future<void> editHealthMetric(HealthMetric healthMetric);
  Future<void> getHealthMetricById(String id);
  Future<List> getHealthMetricByPatientId(String patientId);
  Future<void> deleteHealthMetric(String id);
}
