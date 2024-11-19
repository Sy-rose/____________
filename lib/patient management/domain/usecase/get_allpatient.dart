import 'package:dartz/dartz.dart';
import 'package:health_metrics_tracker/core/errors/failure.dart';
import 'package:health_metrics_tracker/patient%20management/domain/entities/patient.dart';
import 'package:health_metrics_tracker/patient%20management/domain/repositories/patient_repo.dart';

class GetAllPatients {
  late final PatientRepository repository;

  GetAllPatients({required Object repository});

  call() {}
}

Future<Either<Failure, List<Patient>>> call() async {
  return await repository.getAllPatients();
}

//
mixin repository {
  static getAllPatients() {}
}
