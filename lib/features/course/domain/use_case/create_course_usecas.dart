import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';
import 'package:student_management/features/course/domain/repository/course_repository.dart';

import '../../../../app/use_case/use_case.dart';

class CreateCourseParams extends Equatable {
  final String courseName;
  const CreateCourseParams({required this.courseName});

  const CreateCourseParams.empty() : courseName = "_empty.string";

  @override
  List<Object?> get props => [courseName];
}

class CreateCourseUseCase
    implements UseCaseWithParams<void, CreateCourseParams> {
  final ICourseRepository courseRepository;

  CreateCourseUseCase({required this.courseRepository});

  @override
  Future<Either<Failure, void>> call(CreateCourseParams params) async {
    return await courseRepository.createCourse(
      CourseEntity(courseName: params.courseName),
    );
  }
}
