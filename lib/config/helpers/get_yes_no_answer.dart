import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entites/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio(BaseOptions(
    baseUrl: 'https://yesno.wtf/api',
  ));
  Future<Message> getAnswer() async {
    final response = await _dio.get("/");

    final yesNoModel = YesNoModel.fromJson(response.data); // hago el mapper

    return yesNoModel.toMessageEntity();
  }
}
