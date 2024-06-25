import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String number;
  final String message;
  final bool status;

  const ErrorMessageModel({
    required this.number,
    required this.message,
    required this.status,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        number: json['number'].toString(),
        message: json['message'],
        status: json['status'],
      );

  @override
  List<Object> get props => [
        number,
        message,
        status,
      ];
}
