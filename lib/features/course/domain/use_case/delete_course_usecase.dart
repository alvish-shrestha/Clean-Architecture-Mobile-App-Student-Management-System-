import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/app/use_case/use_case.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/course/domain/repository/course_repository.dart';

class DeleteCourseParams extends Equatable {
  final String courseId;
  const DeleteCourseParams({required this.courseId});

  @override
  List<Object?> get props => [courseId];
}

class DeleteCourseUsecase
    implements UseCaseWithParams<void, DeleteCourseParams> {
  final ICourseRepository repository;
  DeleteCourseUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(DeleteCourseParams params) async {
    return repository.deleteCourse(params.courseId);
  }
}
