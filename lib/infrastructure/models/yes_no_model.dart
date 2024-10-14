import 'package:yes_no_app/domain/entites/message.dart';

/**
 * Mapper para la respuesta del api
 */
class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
      answer: json["answer"], forced: json["forced"], image: json["image"]);

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'forced': forced,
        'image': image,
      };

  Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'Si' : 'No',
        fromWho: FromWho.her,
        imageUrl: image,
      );
}
