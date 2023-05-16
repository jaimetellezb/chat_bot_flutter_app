import 'package:chat_bot_flutter_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
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
          height: 5.0,
        ),
        _ImageBubble(image: message.imageUrl!),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;

  const _ImageBubble({required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      child: Image.network(
        image,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: const Text("Enviando una imagen"),
          );
        },
      ),
    );
  }
}
