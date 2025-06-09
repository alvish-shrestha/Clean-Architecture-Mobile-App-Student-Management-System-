import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:student_management/app/use_case/use_case.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/auth/domain/repository/student_repository.dart';

class UploadImageParams {
  final File file;

  const UploadImageParams({required this.file});
}

class UploadImageUsecase
    implements UseCaseWithParams<String, UploadImageParams> {
  final IStudentRepository _studentRepository;

  UploadImageUsecase({required IStudentRepository studentRepository})
    : _studentRepository = studentRepository;

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _studentRepository.uploadProfilePicture(params.file);
  }
}
