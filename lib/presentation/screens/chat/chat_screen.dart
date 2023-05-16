import 'package:chat_bot_flutter_app/domain/entities/message.dart';
import 'package:chat_bot_flutter_app/presentation/providers/chat_provider.dart';
import 'package:chat_bot_flutter_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_bot_flutter_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_bot_flutter_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.techopedia.com/wp-content/uploads/2023/03/6e13a6b3-28b6-454a-bef3-92d3d5529007.jpeg'),
          ),
        ),
        title: const Text('Amor'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    /// Sirve para estar pendiente de los cambios de la clase ChatProvider
    /// utilizando el gestor de estados (provider)
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),

            /// Caja de texto de mensajes
            MessageFieldBox(
              /// al devolver el valor el sendMessage agrega el texto
              /// escrito, en la lista de mensajes

              // cuando el valor del parámetro es el mismo que se envía en la función
              // entonces se puede simplemente enviar el nombre de la función
              // ambos casos hacen lo mismo:
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
