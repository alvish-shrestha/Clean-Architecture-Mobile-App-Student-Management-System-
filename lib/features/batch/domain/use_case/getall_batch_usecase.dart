import 'package:dartz/dartz.dart';
import 'package:student_management/app/use_case/use_case.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

class GetallBatchUsecase implements UseCaseWithoutParams<List<BatchEntity>> {
  final IBatchRepository batchRepository;

  GetallBatchUsecase({required this.batchRepository});

  @override
  Future<Either<Failure, List<BatchEntity>>> call() {
    return batchRepository.getBatches();
  }
}
