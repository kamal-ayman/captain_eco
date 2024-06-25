import 'package:equatable/equatable.dart';

class SuccessMessageModel extends Equatable {
  final String number;
  final String message;
  final bool status;

  const SuccessMessageModel({
    required this.number,
    required this.message,
    required this.status,
  });

  factory SuccessMessageModel.fromJson(Map<String, dynamic> json) =>
      SuccessMessageModel(
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
