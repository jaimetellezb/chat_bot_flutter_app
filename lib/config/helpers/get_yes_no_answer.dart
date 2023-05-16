import 'package:chat_bot_flutter_app/domain/entities/message.dart';
import 'package:chat_bot_flutter_app/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  /// dio es un paquete que sirve para hacer peticiones HTTP y mucho más
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}
