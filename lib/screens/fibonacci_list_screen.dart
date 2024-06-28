import 'package:fibonacci_list/utils/scroll_to_index_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fibonacci_list/enums/fibonacci_type.dart';
import '../models/fibonacci_item.dart';
import '../utils/fibonacci_utils.dart';
import '../widgets/fibonacci_bottom_sheet.dart';

class FibonacciListScreen extends StatefulWidget {
  const FibonacciListScreen({super.key});

  @override
  State<FibonacciListScreen> createState() => _FibonacciListScreenState();
}

class _FibonacciListScreenState extends State<FibonacciListScreen> {
  final ScrollController _mainScrollController = ScrollController();
  final int _initialListSize = 40;

  List<FibonacciItem> _mainList = [];
  Map<FibonacciType, List<FibonacciItem>> _bottomSheetLists = {};
  int _highlightedIndex = -1;
  FibonacciItem? _lastAddedToBottomSheet;

  @override
  void initState() {
    super.initState();
    _initializeLists();
  }

  void _initializeLists() {
    _mainList = FibonacciUtils.generateFibonacciList(_initialListSize);
    _bottomSheetLists = {
      for (var type in FibonacciType.values) type: [],
    };
  }

  void _reset() {
    setState(() {
      _initializeLists();
      _highlightedIndex = -1;
      _lastAddedToBottomSheet = null;
    });
    ScrollToIndexUtil.scrollToTop(_mainScrollController);
  }

  void _moveItemToMainList(FibonacciItem item, FibonacciType type) {
    FibonacciBottomSheet.close(context);
    setState(() {
      _bottomSheetLists[type]!.remove(item);
      _mainList.add(item);
      _mainList.sort((a, b) => a.index.compareTo(b.index));
      _highlightedIndex = _mainList.indexOf(item);
      _lastAddedToBottomSheet = null;
    });
    _scrollToHighlighted();
  }

  void _moveItemToBottomSheet(FibonacciItem item, int index) {
    setState(() {
      _bottomSheetLists[item.type]!.add(item);
      _mainList.removeAt(index);
      _highlightedIndex = -1;
      _lastAddedToBottomSheet = item;
    });

    FibonacciBottomSheet.show(
      context,
      items: _bottomSheetLists[item.type]!,
      lastAddedItem: _lastAddedToBottomSheet,
      onItemTap: (fibonacciItem) {
        _moveItemToMainList(fibonacciItem, fibonacciItem.type);
      },
    );
  }

  void _scrollToHighlighted() {
    if (_highlightedIndex != -1) {
      ScrollToIndexUtil.scrollToIndex(
        index: _highlightedIndex,
        listLength: _mainList.length,
        scrollController: _mainScrollController,
        itemHeight: 56.0,
        constraintsHeight: MediaQuery.of(context).size.height,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMainList(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Fibonacci List'),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leading: CupertinoButton(
        onPressed: _reset,
        child: const Icon(Icons.refresh),
      ),
      elevation: 0,
    );
  }

  Widget _buildMainList() {
    return ListView.builder(
      controller: _mainScrollController,
      itemCount: _mainList.length,
      itemBuilder: (context, index) {
        final item = _mainList[index];
        return ListTile(
          title: Text('Index: ${item.index}, Number: ${item.number}'),
          trailing: Icon(FibonacciUtils.getIconForType(item.type)),
          tileColor: index == _highlightedIndex ? Colors.red : null,
          onTap: () => _moveItemToBottomSheet(item, index),
        );
      },
    );
  }
}
