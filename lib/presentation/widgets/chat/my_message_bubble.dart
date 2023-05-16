import 'package:chat_bot_flutter_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 7.0,
        )
      ],
    );
  }
}
