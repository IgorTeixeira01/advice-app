import 'package:equatable/equatable.dart';

class SlipEntity extends Equatable{
  final int id;
  final String advice;

  const SlipEntity({
    required this.id,
    required this.advice,
  });

  @override
  List<Object?> get props => [id, advice];
}