import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/features/course/domain/use_case/create_course_usecas.dart';
import 'package:student_management/features/course/domain/use_case/delete_course_usecase.dart';
import 'package:student_management/features/course/domain/use_case/get_course_usecase.dart';
import 'package:student_management/features/course/presentation/view_model/course_event.dart';
import 'package:student_management/features/course/presentation/view_model/course_state.dart';

class CourseViewModel extends Bloc<CourseEvent, CourseState> {
  final GetallCourseUsecase _getAllCourseUsecase;
  final CreateCourseUseCase _createCourseUsecase;
  final DeleteCourseUsecase _deleteCourseUsecase;
  CourseViewModel({
    required GetallCourseUsecase getAllCourseUsecase,
    required CreateCourseUseCase createCourseUsecase,
    required DeleteCourseUsecase deleteCourseUsecase,
  }) : _getAllCourseUsecase = getAllCourseUsecase,
       _createCourseUsecase = createCourseUsecase,
       _deleteCourseUsecase = deleteCourseUsecase,
       super(CourseState.initial()) {
    on<LoadCourses>(_onCourseLoad);
    on<AddCourse>(_onCreateCourse);
    on<DeleteCourse>(_onDeleteCourse);

    add(LoadCourses());
  }

  Future<void> _onCourseLoad(
    LoadCourses event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllCourseUsecase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (courses) => emit(state.copyWith(isLoading: false, courses: courses)),
    );
  }

  Future<void> _onCreateCourse(
    AddCourse event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createCourseUsecase(
      CreateCourseParams(courseName: event.courseName),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(LoadCourses());
      },
    );
  }

  Future<void> _onDeleteCourse(
    DeleteCourse event,
    Emitter<CourseState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteCourseUsecase(
      DeleteCourseParams(courseId: event.courseId),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(LoadCourses());
      },
    );
  }
}
