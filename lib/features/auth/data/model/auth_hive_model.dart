import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/app/constant/hive/hive_table_constant.dart';
import 'package:student_management/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? studentId;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final BatchHiveModel batch;
  @HiveField(4)
  final List<CourseHiveModel> courses;
  @HiveField(5)
  final String username;
  @HiveField(6)
  final String password;

  AuthHiveModel({
    String? studentId,
    required this.firstName,
    required this.lastName,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  const AuthHiveModel.initial()
    : studentId = "",
      firstName = "",
      lastName = "",
      batch = const BatchHiveModel.initial(),
      courses = const [],
      username = "",
      password = "";

  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      studentId: entity.userId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      batch: BatchHiveModel.fromEntity(entity.batch),
      courses: CourseHiveModel.fromEntityList(entity.courses),
      username: entity.username,
      password: entity.password,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      userId: studentId,
      firstName: firstName,
      lastName: lastName,
      batch: batch.toEntity(),
      courses: CourseHiveModel.toEntityList(courses),
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props => [
    studentId,
    firstName,
    lastName,
    batch,
    courses,
    username,
    password,
  ];
}
