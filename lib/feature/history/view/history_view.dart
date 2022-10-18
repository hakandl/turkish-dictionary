import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../product/widgets/container/empty_value_view.dart';
import '../viewmodel/history_viewmodel.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('history').listenable(),
      builder: (context, value, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('History'),
              actions: [
                IconButton(
                    onPressed: context.read<HistoryViewModel>().historyWordBox.isNotEmpty
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
                                      context.read<HistoryViewModel>().historyWordBox.clear();
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
            body: context.watch<HistoryViewModel>().historyWordBox.length >= 1
                ? ListView.builder(
                    itemCount: context.watch<HistoryViewModel>().historyWordBox.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(context.watch<HistoryViewModel>().historyWordBox.getAt(index)),
                        background: const _DismissibleBackground(),
                        secondaryBackground: const _DismissibleBackground(direction: MainAxisAlignment.end),
                        onDismissed: (direction) {
                          context.read<HistoryViewModel>().historyWordBox.deleteAt(index);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(context.watch<HistoryViewModel>().historyWordBox.getAt(index) ?? ''),
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
