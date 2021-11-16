import 'package:flutter/material.dart';
import 'package:my_movieflix/src/core/presentation/widgets/cast_action.widget.dart';
import 'package:my_movieflix/src/core/presentation/widgets/custom_structure.widget.dart';
import 'package:my_movieflix/src/features/profile/presentation/ui/pages/profile.text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomStructure(
        appBar: _appBar,
        pinned: false,
        body: _content,
        scrollController: _scrollController,
      ),
    );
  }

  Widget get _content {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _avatar,
          const SizedBox(height: 10),
          _changeProfile,
          const SizedBox(height: 60),
          _tabBar,
          const SizedBox(height: 10),
          _tabContent,
        ],
      ),
    );
  }

  Widget get _avatar {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        gradient: LinearGradient(
          colors: [
            Color(0xFFC732AD),
            Color(0xFF6025CC),
          ]
        )
      ),
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(
            color: Colors.transparent,
            width: 6,
          ),
          color: const Color(0xFF1E053E)
        ),
        child: const Center(
          child: Text(
            'M',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _changeProfile {
    return Text(
      ProfileText.changeProfile,
      style: TextStyle(
        color: Colors.deepPurple.shade300,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget get _tabBar {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.5),
        )),
        child: TabBar(
          indicatorColor: Colors.deepPurple.shade300,
          indicatorWeight: 4,
          isScrollable: true,
          unselectedLabelStyle: _unselectedMenuTextStyle,
          labelStyle: _selectedMenuTextStyle,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          indicatorPadding: const EdgeInsets.only(top: 15),
          tabs: const [
            Text(ProfileText.myList),
            Text(ProfileText.downloads),
            Text(ProfileText.keepWatching),
          ],
        ),
      ),
    );
  }

  Widget get _tabContent {
    return Flexible(
      child: TabBarView(
        controller: _tabController,
        children: [
          _myListTab,
          _downloadTab,
          _keepWatchingTab,
        ],
      ),
    );
  }

  Widget get _myListTab {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(ProfileText.createList),
        const SizedBox(height: 45),
        Text(
          ProfileText.whatIsInMyList,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.deepPurple.shade300,
              letterSpacing: 1),
        )
      ],
    );
  }

  Widget get _downloadTab {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.download_outlined,
              color: Colors.grey,
              size: 50,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          ProfileText.haventDownloads,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 45),
        Text(
          ProfileText.searchTitles,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.deepPurple.shade300,
              letterSpacing: 1),
        )
      ],
    );
  }

  Widget get _keepWatchingTab {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Text(ProfileText.haventVideosInProgress)],
    );
  }

  TextStyle get _selectedMenuTextStyle {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontSize: 16,
    );
  }

  TextStyle get _unselectedMenuTextStyle {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 16,
    );
  }

  PreferredSizeWidget get _appBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.white,
      bottomOpacity: 0,
      elevation: 0,
      titleSpacing: 0,
      actions: const [
        CastActionWidget(),
      ],
    );
  }
}
