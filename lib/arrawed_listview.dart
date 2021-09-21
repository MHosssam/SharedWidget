import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ArrowedListView extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    int index,
    int currentIndex,
    AutoScrollController autoScrollController,
  ) itemBuilder;
  final int? itemCount;
  final int? initialIndex;
  final AutoScrollPosition? autoScrollPosition;
  final bool? navigateOnTap;
  final double? itemWidth;
  final Function(int index)? onTap;
  final bool? isgreyArrow;
  const ArrowedListView({
    Key? key,
    required this.itemBuilder,
    this.itemCount,
    this.initialIndex,
    this.autoScrollPosition = AutoScrollPosition.begin,
    this.navigateOnTap = false,
    this.itemWidth,
    this.onTap,
    this.isgreyArrow,
  }) : super(key: key);

  @override
  _ArrowedListViewState createState() => _ArrowedListViewState();
}

class _ArrowedListViewState extends State<ArrowedListView> {
  late AutoScrollController scrollController;

  var currentIndex = 0;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? currentIndex;

    scrollController = AutoScrollController(
      axis: Axis.horizontal,
      initialScrollOffset: widget.initialIndex != null
          ? widget.initialIndex! * widget.itemWidth!
          : 0.0,
    );
    scrollController.scrollToIndex(
      currentIndex,
      preferPosition: widget.autoScrollPosition,
      duration: Duration(
        microseconds: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            if (currentIndex > 0) {
              setState(() {
                --currentIndex;
              });

              scrollController.scrollToIndex(currentIndex,
                  preferPosition: widget.autoScrollPosition);
              widget.onTap?.call(currentIndex);
            }
          },
          child: currentIndex == 0
              ? Container(
                  width: 100,
                )
              : Center(
                  child: Icon(
                    Icons.arrow_left_rounded,
                    color: (widget.isgreyArrow!
                        ? Colors.black.withOpacity(0.8)
                        : Colors.white),
                    size: 100,
                  ),
                ),
        ),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.itemCount,
            itemBuilder: (context, index) => AutoScrollTag(
              key: ValueKey('activity:$index'),
              index: index,
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: widget.itemWidth,
                  child: widget.itemBuilder(
                    context,
                    index,
                    currentIndex,
                    scrollController,
                  ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            if (currentIndex < widget.itemCount! - 1) {
              setState(() {
                ++currentIndex;
              });
              scrollController.scrollToIndex(currentIndex,
                  preferPosition: widget.autoScrollPosition);
              widget.onTap?.call(currentIndex);
            }
          },
          child: currentIndex == widget.itemCount! - 1
              ? Container(
                  width: 100,
                )
              : Icon(
                  Icons.arrow_right_rounded,
                  color: (widget.isgreyArrow!
                      ? Colors.black.withOpacity(0.8)
                      : Colors.white),
                  size: 100,
                ),
        ),
      ],
    );
  }
}
