import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/notification_fragment/bloc/notification_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/notification_fragment/bloc/notification_state.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:reviewbahi/core/MyColor.dart';

class NotificationFragment extends StatefulWidget {
  @override
  _NotificationFragmentState createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  //appbar search
  final _scrollController = ScrollController();
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  NotificationBloc _bloc;

  @override
  void initState() {
    _bloc = NotificationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<NotificationBloc, NotificationState>(
            listener: (BuildContext context, NotificationState state) {
              // ignore: missing_return
            },
            // ignore: missing_return
            builder: (BuildContext context, NotificationState state) {
              return Scaffold(
                appBar: _appBar(),
                body: Container(),
              );
            }));
  }


  ScrollAppBar _appBar() {
    return ScrollAppBar(
      brightness: Brightness.light,
      elevation: 2,
      backgroundColor: Colors.white,
      leading: _isSearching
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          // if (_searchQueryController == null ||
          //     _searchQueryController.text.isEmpty) {
          //   Navigator.pop(context);
          //   return;
          // }
          Navigator.pop(context);
          _clearSearchQuery();
        },
      )
          : Container(
          margin: EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.iconBgColor,
          )),
      title: _isSearching
          ? _buildSearchField()
          : Row(
        children: [
          Spacer(),
          Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          Spacer()
        ],
      ),
      actions: _buildActions(),
      controller: _scrollController,
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black87),
      ),
      style: TextStyle(color: Colors.black87, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      InkWell(
        onTap: () {
          _startSearch();
          // showSearch(context: context, delegate: DataSearch(listWords));
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.iconBgColor,
          ),
        ),
      ),
      InkWell(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: 40,
          height: 40,
          child: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.iconBgColor,
          ),
        ),
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }


}
