import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/data/data_source/local_datasource/batch_local_data_source.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

class BatchLocalRepositry implements IBatchRepository {
  final BatchLocalDataSource _batchLocalDataSource;

  BatchLocalRepositry({required BatchLocalDataSource batchLocalDataSoure})
    : _batchLocalDataSource = batchLocalDataSoure;

  @override
  Future<Either<Failure, void>> createBatch(BatchEntity batch) async {
    try {
      _batchLocalDataSource.createBatch(batch);
      return Right(null);
    } catch (e) {
      return Left(LocalDataBaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBatch(String id) async {
    try {
      _batchLocalDataSource.deleteBatch(id);
      return Right(null);
    } catch (e) {
      return (Left(LocalDataBaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getBatches() async {
    try {
      final batches = await _batchLocalDataSource.getBatches();
      return Right(batches);
    } catch (e) {
      return (Left(LocalDataBaseFailure(message: e.toString())));
    }
  }
}
