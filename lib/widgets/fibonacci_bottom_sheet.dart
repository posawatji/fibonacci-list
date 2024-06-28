import 'package:fibonacci_list/utils/scroll_to_index_util.dart';
import 'package:flutter/material.dart';
import '../models/fibonacci_item.dart';
import '../utils/fibonacci_utils.dart';

class FibonacciBottomSheet extends StatefulWidget {
  final List<FibonacciItem> items;
  final FibonacciItem? lastAddedItem;
  final Function(FibonacciItem item) onItemTap;

  const FibonacciBottomSheet({
    super.key,
    required this.items,
    required this.lastAddedItem,
    required this.onItemTap,
  });

  static Future<void> show(
    BuildContext context, {
    required List<FibonacciItem> items,
    required FibonacciItem? lastAddedItem,
    required Function(FibonacciItem item) onItemTap,
  }) async {
    await showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) => FibonacciBottomSheet(
        items: items,
        lastAddedItem: lastAddedItem,
        onItemTap: onItemTap,
      ),
    );
  }

  static void close(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  State<FibonacciBottomSheet> createState() => _FibonacciBottomSheetState();
}

class _FibonacciBottomSheetState extends State<FibonacciBottomSheet> {
  final ScrollController scrollController = ScrollController();

  List<FibonacciItem> sortedItems = [];

  @override
  void initState() {
    super.initState();
    // Sort the items by index
    sortedItems = List.from(widget.items)..sort((a, b) => a.index.compareTo(b.index));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToLastAdded();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToLastAdded() {
    if (widget.lastAddedItem != null) {
      int index = sortedItems.indexOf(widget.lastAddedItem!);

      if (index != -1) {
        ScrollToIndexUtil.scrollToIndex(
          index: index,
          listLength: sortedItems.length,
          scrollController: scrollController,
          itemHeight: 56.0,
          constraintsHeight: MediaQuery.of(context).size.height / 2,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        controller: scrollController,
        itemCount: sortedItems.length,
        itemBuilder: (context, index) {
          final item = sortedItems[index];
          return ListTile(
            title: Text('Number: ${item.number}'),
            subtitle: Text('Index: ${item.index}'),
            trailing: Icon(FibonacciUtils.getIconForType(item.type)),
            selectedColor: Colors.black,
            selected: item == widget.lastAddedItem,
            selectedTileColor: Colors.green,
            onTap: () => widget.onItemTap(item),
          );
        },
      ),
    );
  }
}
