import 'package:equatable/equatable.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class BatchState extends Equatable {
  final List<BatchEntity> batches;
  final bool isLoading;
  final String? error;

  const BatchState({
    required this.batches,
    required this.isLoading,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(batches: [], isLoading: false);
  }

  BatchState copyWith({
    List<BatchEntity>? batches,
    bool? isLoading,
    String? error,
  }) {
    return BatchState(
      batches: batches ?? this.batches,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [batches, isLoading, error];
}
