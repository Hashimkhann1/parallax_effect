
import 'package:flutter/cupertino.dart';
import 'package:parallax_scroll/utils/widgets/my_text.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
      child: MyText(title: "Parallax Effect",fontSize: 22,fontWeight: FontWeight.w600,color: CupertinoColors.systemGreen.withOpacity(0.8),),
    );
  }
}
