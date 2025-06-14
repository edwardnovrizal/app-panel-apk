import 'package:equatable/equatable.dart';
import 'package:panel_apk/src/data/models/project_model.dart';

class ProjectResponeEntity extends Equatable {
  final bool success;
  final int code;
  final String message;
  final List<ProjectModel> data;

  const ProjectResponeEntity({
    required this.success,
    required this.code,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, code, message, data];
}
