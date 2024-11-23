import 'package:equatable/equatable.dart';

class FaqQuestionItem extends Equatable {
  const FaqQuestionItem({
    required this.question,
    required this.answer,
  });
  final String question;
  final String answer;

  @override
  List<Object?> get props => [
        question,
        answer,
      ];

  FaqQuestionItem copyWith({
    String? id,
    String? categoryId,
    String? question,
    String? answer,
  }) {
    return FaqQuestionItem(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }
}
