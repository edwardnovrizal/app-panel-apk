part of 'appinfo_bloc.dart';

sealed class AppinfoEvent extends Equatable {
  const AppinfoEvent();

  @override
  List<Object> get props => [];
}

class ReadAppInfoEvent extends AppinfoEvent {
  final String token;
  final String projectId;
  const ReadAppInfoEvent({required this.token, required this.projectId});
}

class CreateAppInfoEvent extends AppinfoEvent {
  final String token;
  final String projectId;
  final String? name;
  final String? version;
  final String? telegram;
  final String? whatsapp;
  final String? email;
  final XFile? thumbnail;
  const CreateAppInfoEvent({
    required this.token,
    required this.projectId,
    this.name,
    this.version,
    this.telegram,
    this.whatsapp,
    this.email,
    this.thumbnail,
  });
}

class DeleteAppinfoEvent extends AppinfoEvent {
  final String token;
  final String appinfoId;
  final String projectId;
  const DeleteAppinfoEvent({required this.projectId, required this.token, required this.appinfoId});
}
