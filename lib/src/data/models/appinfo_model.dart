import 'package:equatable/equatable.dart';

class AppInfoModel extends Equatable {
  final String id;
  final String userId;
  final String projectId;
  final String name;
  final String version;
  final String telegram;
  final String whatsapp;
  final String email;
  final String thumbnail;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AppInfoModel({
    required this.id,
    required this.userId,
    required this.projectId,
    required this.name,
    required this.version,
    required this.telegram,
    required this.whatsapp,
    required this.email,
    required this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppInfoModel.fromJson(Map<String, dynamic> json) {
    return AppInfoModel(
      id: json['id'],
      userId: json['userId'],
      projectId: json['projectId'],
      name: json['name'],
      version: json['version'],
      telegram: json['telegram'],
      whatsapp: json['whatsapp'],
      email: json['email'],
      thumbnail: json['thumbnail'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'projectId': projectId,
      'name': name,
      'version': version,
      'telegram': telegram,
      'whatsapp': whatsapp,
      'email': email,
      'thumbnail': thumbnail,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props =>
      [id, userId, projectId, name, version, telegram, whatsapp, email, thumbnail, createdAt, updatedAt];
}
