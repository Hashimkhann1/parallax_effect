

import 'package:flutter/material.dart';
import 'package:parallax_scroll/utils/widgets/my_text.dart';

class MessageScreenView extends StatelessWidget {
  const MessageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(title: "Messages"),
      ),
      body: Center(
        child: MyText(title: "All Messages :)"),
      ),
    );
  }
}
