import 'package:dartz/dartz.dart';
import 'package:health_metrics_tracker/core/errors/failure.dart';
import 'package:health_metrics_tracker/health%20metric%20management/domain/entities/health_metric.dart';
import 'package:health_metrics_tracker/health%20metric%20management/domain/repositories/health_metric_repos.dart';

class GetAllHealthMetricsByPatientId {
  final HealthMetricRepository repository;

  GetAllHealthMetricsByPatientId({required this.repository});


  Future<Either<Failure, List<HealthMetric>>> call(String patientId) async {
    return await repository.getAllHealthMetricsByPatientId(patientId);
  }
}
