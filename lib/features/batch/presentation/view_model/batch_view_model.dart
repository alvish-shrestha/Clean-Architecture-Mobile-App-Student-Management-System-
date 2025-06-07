import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:student_management/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:student_management/features/batch/domain/use_case/getall_batch_usecase.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_event.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_state.dart';

class BatchViewModel extends Bloc<BatchEvent, BatchState> {
  final CreateBatchUseCase _createBatchUseCase;
  final GetallBatchUsecase _getAllBatchUseCase;
  final DeleteBatchUsecase _deleteBatchUsecase;

  BatchViewModel({
    required CreateBatchUseCase createBatchUseCase,
    required GetallBatchUsecase getAllBatchUseCase,
    required DeleteBatchUsecase deleteBatchUsecase,
  }) : _createBatchUseCase = createBatchUseCase,
       _getAllBatchUseCase = getAllBatchUseCase,
       _deleteBatchUsecase = deleteBatchUsecase,
       super(BatchState.initial()) {
    on<LoadBatches>(_onLoadBatches);
    on<AddBatch>(_onAddBatch);
    on<DeleteBatch>(_onDeleteBatch);

    //call this event whenever the bloc is created
    add(LoadBatches());
  }

  Future<void> _onLoadBatches(
    LoadBatches event,
    Emitter<BatchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllBatchUseCase.call();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) => emit(state.copyWith(isLoading: false, batches: batches)),
    );
  }

  Future<void> _onAddBatch(AddBatch event, Emitter<BatchState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createBatchUseCase.call(
      CreateBatchParams(batchName: event.batchName),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadBatches());
      },
    );
  }

  Future<void> _onDeleteBatch(
    DeleteBatch event,
    Emitter<BatchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteBatchUsecase.call(
      DeleteBatchParams(batchId: event.batchId),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadBatches());
      },
    );
  }
}
