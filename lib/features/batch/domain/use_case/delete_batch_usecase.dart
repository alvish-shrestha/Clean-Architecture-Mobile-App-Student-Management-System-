import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/app/use_case/use_case.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

class DeleteBatchParams extends Equatable {
  final String batchId;
  const DeleteBatchParams({required this.batchId});

  @override
  List<Object?> get props => [batchId];
}

class DeleteBatchUsecase implements UseCaseWithParams<void, DeleteBatchParams> {
  final IBatchRepository repository;
  DeleteBatchUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(DeleteBatchParams params) async {
    return repository.deleteBatch(params.batchId);
  }
}
