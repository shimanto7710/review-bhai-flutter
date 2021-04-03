import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/food_item/food_item_screen.dart';
import 'package:reviewbahi/ui/resturant_screen/bloc/restaurant_bloc.dart';
import 'package:reviewbahi/ui/resturant_screen/bloc/restaurant_state.dart';
import 'package:reviewbahi/ui/resturant_screen/bloc/restaurant_state.dart';
import 'package:reviewbahi/ui/resturant_screen/bloc/restaurant_state.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class RestaurantScreen extends StatefulWidget {
  static const routeName = '/restaurantScreen';

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  RestaurantBloc _bloc;

  List<String> _foodItem = [];

  //appbar search
  final _scrollController = ScrollController();
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  void initState() {
    _bloc = RestaurantBloc();

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
      //     "Restaurants",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body: BlocProvider<RestaurantBloc>(
          create: (_) => _bloc,
          // ignore: missing_return
          child: BlocConsumer<RestaurantBloc, RestaurantState>(
              listener: (BuildContext context, RestaurantState state) {
            // ignore: missing_return
          },
              // ignore: missing_return
              builder: (BuildContext context, RestaurantState state) {
            return Container(
              child: Container(
                color: Colors.black12,
                child: new ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: _foodItem.length,
                  // ignore: missing_return
                  itemBuilder: (BuildContext context, int index) {
                    return _restaurantItem(context, index);
                  },
                ),
              ),
            );
          })),
    );
  }

  Widget _restaurantItem(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: () {
        _navigateToProfileScreen();
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: Image.asset(
                  "assets/imgs/${item}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lake Green Lounge",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Aftab nagar, Dhaka",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                        textAlign: TextAlign.left,
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
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Text(
                                "Rating (120)",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                                textAlign: TextAlign.left,
                              )),
                        ],
                      )
                    ],
                  ),
                ))
          ],
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
            "Restaurant",
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


  _navigateToProfileScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodItemScreen(),
        ));
  }
}
