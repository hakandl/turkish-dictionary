import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

class DetailWordCard extends StatelessWidget {
  const DetailWordCard({
    Key? key,
    required this.text,
    this.onTap,
    this.isRight = true,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: context.lowBorderRadius,
      ),
      child: ListTile(
        title: Text(text),
        trailing: isRight
            ? SvgWidget(
                icon: IconNameEnum.right.value,
                color: Colors.red,
              )
            : const SizedBox.shrink(),
        onTap: onTap,
      ),
    );
  }
}
