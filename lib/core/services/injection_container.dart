import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:health_metrics_tracker/health%20metric%20management/data/data_source/firebase_remote_datasource.dart';
import 'package:health_metrics_tracker/health%20metric%20management/data/data_source/health_metric_remote_datasource.dart';
import 'package:health_metrics_tracker/health%20metric%20management/data/repository_impl/health_metric_repo_impl.dart';
import 'package:health_metrics_tracker/health%20metric%20management/domain/repositories/health_metric_repos.dart';
import 'package:health_metrics_tracker/health%20metric%20management/domain/usecase/add_health_metric.dart';
import 'package:health_metrics_tracker/health%20metric%20management/domain/usecase/edit_health_metric.dart';
import 'package:health_metrics_tracker/health%20metric%20management/domain/usecase/delete_health_metric.dart';
import 'package:health_metrics_tracker/health%20metric%20management/presentation/cubit/health_metric_cubit.dart';
import 'package:health_metrics_tracker/patient%20management/data/data_source/firebase_remote_datasource.dart';
import 'package:health_metrics_tracker/patient%20management/data/data_source/patient_remote_datasource.dart';
import 'package:health_metrics_tracker/patient%20management/data/patient_management_repos_impl/patient_repos_impl.dart';
import 'package:health_metrics_tracker/patient%20management/domain/repositories/patient_repo.dart';
import 'package:health_metrics_tracker/patient%20management/domain/usecase/add_patient_.dart';
import 'package:health_metrics_tracker/patient%20management/domain/usecase/delete_patient.dart';
import 'package:health_metrics_tracker/patient%20management/domain/usecase/edit_patient.dart';
import 'package:health_metrics_tracker/patient%20management/domain/usecase/get_allpatient.dart';
import 'package:health_metrics_tracker/patient%20management/presentation/cubit/patient_cubit.dart';
import 'package:health_metrics_tracker/health%20metric%20management/domain/usecase/get_all_health_metric_bypatient.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Firebase instance
  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);

  // Feature 1: Health Metric
  // Presentation Layer
  serviceLocator.registerFactory(() => HealthMetricCubit(
        addHealthMetricUseCase: serviceLocator(),
        deleteHealthMetricUseCase: serviceLocator(),
        getAllHealthMetricByPatientUseCase: serviceLocator(),
        editHealthMetricUseCase: serviceLocator(),
      ));

  // Domain Layer
  serviceLocator.registerLazySingleton(() => AddHealthMetric(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => DeleteHealthMetric(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => EditHealthMetric(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetAllHealthMetricsByPatientId(repository: serviceLocator()));

  // Data Layer
  serviceLocator.registerLazySingleton<HealthMetricRepository>(
      () => HealthMetricRepositoryImplementation(serviceLocator()));

  // Data Source
  serviceLocator.registerLazySingleton<HealthMetricRemoteDataSource>(
      () => HealthMetricFirebaseRemoteDatasource(serviceLocator()));

  // Feature 2: Patient
  // Presentation Layer
  serviceLocator.registerFactory(() => PatientCubit(
        addPatientUseCase: serviceLocator(),
        deletePatientUseCase: serviceLocator(),
        editPatientUseCase: serviceLocator(),
        getAllPatientsUseCase: serviceLocator(), 
      ));

  // Domain Layer
  serviceLocator.registerLazySingleton(() => AddPatient(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => EditPatient(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => DeletePatient(repository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetAllPatients(repository: serviceLocator()));

  // Data Layer
  serviceLocator.registerLazySingleton<PatientRepository>(
      () => PatientRepositoryImplementation(serviceLocator()));

  // Data Source
  serviceLocator.registerLazySingleton<PatientRemoteDataSource>(
      () => PatientFirebaseRemoteDatasource(serviceLocator()));
}
