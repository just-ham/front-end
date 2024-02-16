import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../chat.dart';
import 'chat_view.dart';

class WizardScreen extends StatelessWidget {
  const WizardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: const ChatView(),
    );
  }
}
