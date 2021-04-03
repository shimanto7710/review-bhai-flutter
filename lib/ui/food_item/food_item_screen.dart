import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/food_item/bloc/food_item_bloc.dart';
import 'package:reviewbahi/ui/food_item/bloc/food_item_state.dart';
import 'package:reviewbahi/ui/food_item/bloc/food_item_state.dart';
import 'package:reviewbahi/ui/food_item/bloc/food_item_state.dart';
import 'package:reviewbahi/ui/profile_screen/profile_screen.dart';
import 'package:reviewbahi/ui/write_que_screen/write_que_screen.dart';
import 'package:reviewbahi/ui/write_review_screen/write_review_screen.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class FoodItemScreen extends StatefulWidget {
  static const routeName = '/foodItemScreen';

  @override
  _FoodItemScreenState createState() => _FoodItemScreenState();
}

class _FoodItemScreenState extends State<FoodItemScreen> {
  FoodItemBloc _bloc;
  List<String> _foodItem = [];

  //appbar search
  final _scrollController = ScrollController();
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  void initState() {
    _bloc = FoodItemBloc();

    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
  }

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   brightness: Brightness.light,
      //   elevation: 0,
      //   title: Text(
      //     "Food Items",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body: BlocProvider<FoodItemBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<FoodItemBloc, FoodItemState>(
            listener: (BuildContext context, FoodItemState state) {
          // ignore: missing_return
        },
            // ignore: missing_return
            builder: (BuildContext context, FoodItemState state) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Container(
              color: Colors.black12,
              child: new ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: _foodItem.length,
                // ignore: missing_return
                itemBuilder: (BuildContext context, int index) {
                  return _FoodIListItem(context, index);
                },
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _FoodIListItem(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: (){
        _navigateToWriteReviewScreen();
      },
      child: Card(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.only(top: 10,bottom: 10),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                height: 100,
                width: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Image.asset(
                    "assets/imgs/${item}.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "Lake Green Lounge",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Aftab nagar, Dhaka",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 13,
                        ),
                        Text(
                          "4.5",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 2),
                            child: Text(
                              "Rating (120)",
                              style: TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.left,
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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
          child: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
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
            "Food Items",
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
      // InkWell(
      //   child: Container(
      //     margin: EdgeInsets.only(right: 10),
      //     alignment: Alignment.center,
      //     width: 40,
      //     height: 40,
      //     child: Icon(
      //       Icons.notifications,
      //       color: Colors.black,
      //     ),
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: CustomColors.iconBgColor,
      //     ),
      //   ),
      // ),
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

  _navigateToWriteReviewScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WriteReviewScreen(),
        ));
  }

}
