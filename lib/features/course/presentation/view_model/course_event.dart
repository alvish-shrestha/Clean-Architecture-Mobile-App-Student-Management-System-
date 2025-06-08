import 'package:equatable/equatable.dart';

@override
sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

final class LoadCourses extends CourseEvent {}

final class AddCourse extends CourseEvent {
  final String courseName;
  const AddCourse({required this.courseName});

  @override
  List<Object> get props => [courseName];
}

final class DeleteCourse extends CourseEvent {
  final String courseId;
  const DeleteCourse({required this.courseId});

  @override
  List<Object> get props => [courseId];
}
