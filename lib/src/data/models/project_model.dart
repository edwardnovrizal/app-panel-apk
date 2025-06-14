import 'package:equatable/equatable.dart';

import '../../domain/entities/project_entity.dart';

class ProjectResponeModel extends ProjectResponeEntity {
  const ProjectResponeModel({
    required super.success,
    required super.code,
    required super.message,
    required super.data,
  });

  ProjectResponeModel.fromJson(Map<String, dynamic> json)
      : super(
          success: json['success'],
          code: json['code'],
          message: json['message'],
          data: List<ProjectModel>.from(json['data'].map((x) => ProjectModel.fromJson(x))),
        );
}

class ProjectModel extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String packageName;
  final String godevName;
  final String logo;
  final String createdAt;
  final String updatedAt;

  const ProjectModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.packageName,
    required this.godevName,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic>? json) {
    return ProjectModel(
      id: json?['id'],
      userId: json?['userId'],
      name: json?['name'],
      packageName: json?['packageName'],
      godevName: json?['godevName'],
      logo: json?['logo'],
      createdAt: json?['createdAt'],
      updatedAt: json?['updatedAt'],
    );
  }
  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        packageName,
        godevName,
        logo,
        createdAt,
        updatedAt,
      ];
}
