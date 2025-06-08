import 'package:equatable/equatable.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';

class CourseState extends Equatable {
  final List<CourseEntity> courses;
  final bool isLoading;
  final String? error;

  const CourseState({
    required this.courses,
    required this.isLoading,
    this.error,
  });

  factory CourseState.initial() {
    return CourseState(courses: [], isLoading: false);
  }

  CourseState copyWith({
    List<CourseEntity>? courses,
    bool? isLoading,
    String? error,
  }) {
    return CourseState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [courses, isLoading, error];
}
