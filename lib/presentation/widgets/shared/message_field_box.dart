import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  /// permite devolver siempre un valor, en este caso un String
  /// es una función como funcionan los eventos por ejemplo:
  ///```dart
  /// onFieldSubmitted: (value) {
  ///
  ///   debugPrint("submit value $value");
  ///
  /// }
  /// ```
  final ValueChanged<String> onValue;
  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    /// controlador de un TextFormField
    final textController = TextEditingController();

    /// es un elemento para colocar cuando un widget necesita un focus
    final focusNode = FocusNode();

    const outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(40.0)));

    final inputDecoration = InputDecoration(
      /// mensaje de ayuda sobre el input
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();

          /// toma el valor ingresado en el input y lo devuelve a la función
          onValue(textValue);
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,

      /// evento para cuando se hace clic fuera del InputText
      onTapOutside: (event) {
        /// quitamos el focus del elemento
        focusNode.unfocus();
      },

      /// evento referente al enter del celular
      onFieldSubmitted: (value) {
        debugPrint("submit value $value");

        /// limpia la información del inputText
        textController.clear();

        /// Esto hace que siempre se mantenga el focus en este elemento
        focusNode.requestFocus();

        /// se manda a llamar el value cuando se da enter en el teclado
        onValue(value);
      },

      /// evento cada que se presiona una letra en el celular
      onChanged: (value) {
        debugPrint("changed value $value");
      },
    );
  }
}
