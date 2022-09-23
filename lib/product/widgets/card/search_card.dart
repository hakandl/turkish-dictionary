import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../feature/search/view/search_view.dart';
import '../svg.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 5,
      openColor: context.colorScheme.primary,
      closedColor: context.colorScheme.primary,
      closedShape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
      closedBuilder: (context, VoidCallback action) {
        return Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          child: SizedBox(
            width: context.dynamicWidth(.9),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: context.paddingNormal,
                  child: SvgWidget(
                    icon: IconNameEnum.search.value,
                    color: context.colorScheme.background,
                  ),
                ),
                Text(
                  'Türkçe Sözlükte Ara',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.background,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        );
      },
      openBuilder: (context, action) {
        return const SearchView();
      },
    );
  }
}
