import 'package:dartz/dartz.dart';
import 'package:student_management/app/use_case/use_case.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';
import 'package:student_management/features/course/domain/repository/course_repository.dart';

class GetallCourseUsecase implements UseCaseWithoutParams<List<CourseEntity>> {
  final ICourseRepository courseRepository;

  GetallCourseUsecase({required this.courseRepository});

  @override
  Future<Either<Failure, List<CourseEntity>>> call() {
    return courseRepository.getCourses();
  }
}
