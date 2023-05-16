import 'package:chat_bot_flutter_app/config/theme/app_theme.dart';
import 'package:chat_bot_flutter_app/presentation/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// todos los widgets de la aplicación tienen acceso a estos providers
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat bot App',
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
