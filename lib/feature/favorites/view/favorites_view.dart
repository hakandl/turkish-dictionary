import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/widgets/container/empty_value_view.dart';

import '../viewmodel/favorites_viewmodel.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('favorites_word').listenable(),
      builder: (context, value, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Favorites'),
              actions: [
                IconButton(
                    onPressed: context.read<FavoritesViewModel>().favoriteWordBox.isNotEmpty
                        ? () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Are you sure?'),
                                content: const Text(
                                  '**********************',
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('No'),
                                    onPressed: () {},
                                  ),
                                  ElevatedButton(
                                    child: const Text('Yes'),
                                    onPressed: () {
                                      context.read<FavoritesViewModel>().favoriteWordBox.clear();
                                      context.pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        : null,
                    icon: const Icon(Icons.delete))
              ],
            ),
            body: context.watch<FavoritesViewModel>().favoriteWordBox.length >= 1
                ? ListView.builder(
                    itemCount: context.watch<FavoritesViewModel>().favoriteWordBox.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(context.watch<FavoritesViewModel>().favoriteWordBox.getAt(index)),
                        background: const _DismissibleBackground(),
                        secondaryBackground: const _DismissibleBackground(direction: MainAxisAlignment.end),
                        onDismissed: (direction) {
                          context.read<FavoritesViewModel>().favoriteWordBox.deleteAt(index);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(context.watch<FavoritesViewModel>().favoriteWordBox.getAt(index) ?? ''),
                          ),
                        ),
                      );
                    },
                  )
                : const EmptyValueView(
                    icon: false,
                  ));
      },
    );
  }
}

class _DismissibleBackground extends StatelessWidget {
  const _DismissibleBackground({
    Key? key,
    this.direction,
  }) : super(key: key);
  final MainAxisAlignment? direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.error,
      padding: context.horizontalPaddingNormal,
      child: Row(
        mainAxisAlignment: direction ?? MainAxisAlignment.start,
        children: const [
          Icon(Icons.delete),
        ],
      ),
    );
  }
}


/* confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text(
                      'Do you want to remove the item from the cart?',
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                      ),
                      ElevatedButton(
                        child: Text('Yes'),
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                      ),
                    ],
                  ),
            );
          }, */