import 'package:get_it/get_it.dart';
import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:student_management/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:student_management/features/batch/data/data_source/local_datasource/batch_local_data_source.dart';
import 'package:student_management/features/batch/data/repository/local_repository/batch_local_repositry.dart';
import 'package:student_management/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:student_management/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:student_management/features/batch/domain/use_case/getall_batch_usecase.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_view_model.dart';
import 'package:student_management/features/course/presentation/view_model/course_view_model.dart';
import 'package:student_management/features/home/presentation/view_model/home_view_model.dart';
import 'package:student_management/features/splash/presentation/view_model/splash_view_model.dart';

final serviceLocator = GetIt.instance;

Future initDependencies() async {
  await _initHiveService();
  await _initCourseModule();
  await _initBatchModule();
  await _initHomeModule();
  await _initAuthModule();
  await _initSplashModule();
}

Future _initHiveService() async {
  serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
}

Future _initCourseModule() async {
  serviceLocator.registerFactory(() => CourseViewModel());
}

Future _initBatchModule() async {
  serviceLocator.registerFactory<BatchLocalDataSource>(
    () => BatchLocalDataSource(hiveService: serviceLocator<HiveService>()),
  );

  serviceLocator.registerLazySingleton<BatchLocalRepositry>(
    () => BatchLocalRepositry(
      batchLocalDataSoure: serviceLocator<BatchLocalDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<CreateBatchUseCase>(
    () => CreateBatchUseCase(
      batchRepository: serviceLocator<BatchLocalRepositry>(),
    ),
  );

  serviceLocator.registerLazySingleton<GetallBatchUsecase>(
    () => GetallBatchUsecase(
      batchRepository: serviceLocator<BatchLocalRepositry>(),
    ),
  );

  serviceLocator.registerLazySingleton<DeleteBatchUsecase>(
    () => DeleteBatchUsecase(repository: serviceLocator<BatchLocalRepositry>()),
  );

  serviceLocator.registerFactory(
    () => BatchViewModel(
      createBatchUseCase: serviceLocator<CreateBatchUseCase>(),
      getAllBatchUseCase: serviceLocator<GetallBatchUsecase>(),
      deleteBatchUsecase: serviceLocator<DeleteBatchUsecase>(),
    ),
  );
}

Future _initHomeModule() async {
  serviceLocator.registerLazySingleton(() => HomeViewModel());
}

Future _initAuthModule() async {
  serviceLocator.registerFactory(() => LoginViewModel());
  serviceLocator.registerFactory(() => RegisterViewModel());
}

Future _initSplashModule() async {
  serviceLocator.registerFactory(() => SplashViewModel());
}
