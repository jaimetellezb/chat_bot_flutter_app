import 'package:chat_bot_flutter_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_bot_flutter_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: "Hola Amor!", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // si el texto escrito en el textFiled termina el ?
    // llama el método herSuply para llamar el API que trae los gifs
    if (text.endsWith('?')) {
      herReply();
    }

    /// este método notifica que hubo cambios
    notifyListeners();

    /// cada que se notifiquen cambios, también se realiza la animación del scroll
    _moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);

    notifyListeners();
    _moveScrollToBottom();
  }

  Future<void> _moveScrollToBottom() async {
    // dar un delay para que se note la animación
    await Future.delayed(const Duration(milliseconds: 100));

    /// `[offset]` la posición
    ///`[duration]` la duración de la animación
    ///`[curve]` que tipo de animación se quiere
    ///
    ///`[position.maxScrollExtent]` hace que vaya a lo máximo que el scroll pueda ir
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  /// nueva función de dart que permite desestructuración
  (int lat, int log) getLat() {
    return (10, 4);
  }
}
