import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_movieflix/src/core/opacity.utils.dart';

class CustomStructure extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final ScrollController scrollController;
  final bool pinned;

  const CustomStructure({
    Key? key,
    required this.body,
    required this.appBar,
    required this.scrollController,
    this.pinned = true,
  }) : super(key: key);

  @override
  _CustomStructureState createState() => _CustomStructureState();
}

class _CustomStructureState extends State<CustomStructure> {
  double _offset = 0;

  @override
  void initState() {
    widget.scrollController.addListener(_setOffset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const ScrollPhysics(parent: PageScrollPhysics()),
      headerSliverBuilder: headerSliverApp,
      body: widget.body,
    );
  }

  void _setOffset() {
    setState(() {
      _offset = widget.scrollController.offset;
    });
  }

  List<Widget> headerSliverApp(context, innerBoxIsScrolled) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: _color),
    );
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          pinned: widget.pinned,
          floating: true,
          excludeHeaderSemantics: true,
          snap: true,
          elevation: 0,
          toolbarHeight: 0.001,
          backgroundColor: _color,
          bottom: widget.appBar,
        ),
      ),
    ];
  }

  Color get _color {
    return Colors.black.withOpacity(
      OpacityUtils.calculateOpacity(
            fullOpacityOffset: MediaQuery.of(context).size.height * 0.6,
            offset: _offset,
          ) *
          0.8,
    );
  }
}
