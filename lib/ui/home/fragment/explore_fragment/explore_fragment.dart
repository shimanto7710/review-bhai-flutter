import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/filter_screen/filter_screen.dart';
import 'package:reviewbahi/ui/home/fragment/explore_fragment/bloc/explore_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/explore_fragment/bloc/explore_state.dart';
import 'package:reviewbahi/ui/profile_screen/profile_screen.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:reviewbahi/core/MyColor.dart';

class ExploreFragment extends StatefulWidget {
  @override
  _ExploreFragmentState createState() => _ExploreFragmentState();
}

class _ExploreFragmentState extends State<ExploreFragment> {

  //appbar search
  final _scrollController = ScrollController();
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  List<FoodModel> _foodList = [];
  List<String> _foodItem = [];
  List<String> _bannerList = [];

  double _pagerIndex = 0.0;

  // view pager
  final _viewPagerController = new PageController();

  ExploreBloc _bloc;

  @override
  void initState() {
    _bloc = ExploreBloc();

    _foodList.add(FoodModel("f1", 0xffFFC0BF, "All",false));
    _foodList.add(FoodModel("f2", 0xffFCECCF, "Burger",false));
    _foodList.add(FoodModel("f3", 0xffCEEED1, "Coffee",false));
    _foodList.add(FoodModel("f4", 0xffF4D8B6, "Drinks",false));
    _foodList.add(FoodModel("f5", 0xffFFE7F2, "Pizza",false));
    _foodList.add(FoodModel("f6", 0xffDAF7FF, "Pasta",false));
    _foodList.add(FoodModel("f2", 0xffFCECCF, "Burger",false));
    _foodList.add(FoodModel("f3", 0xffCEEED1, "Coffee",false));
    _foodList.add(FoodModel("f4", 0xffF4D8B6, "Drinks",false));
    _foodList.add(FoodModel("f6", 0xffDAF7FF, "Pasta",false));
    _foodList.add(FoodModel("f5", 0xffFFE7F2, "Pizza",false));

    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");
    _foodItem.add("1");
    _foodItem.add("2");

    _bannerList.add("b1");
    _bannerList.add("b1");
    _bannerList.add("b1");
  }

  @override
  void dispose() {
    _bloc.close();
  }

  void _updatePosition(double position) {
    setState(() => _pagerIndex = position);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider<ExploreBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<ExploreBloc, ExploreState>(
            listener: (BuildContext context, ExploreState state) {
          // ignore: missing_return
        },
            // ignore: missing_return
            builder: (BuildContext context, ExploreState state) {
          return Scaffold(
            appBar: _appBar(),
            body: Snap(
              controller: _scrollController.appBar,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  margin: EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: [
                      Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          color: Colors.white,
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 14, right: 16, bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Food Type",
                                  style: TextStyle(
                                      color: CustomColors.fontLight,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(

                                  height: 100,
                                  child: new ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _foodList.length,
                                    // ignore: missing_return
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return foodTypeListItem(context, index);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 16, right: 16, bottom: 8, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Most Popular",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 160,
                              child: new ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: _foodItem.length,
                                // ignore: missing_return
                                itemBuilder: (BuildContext context, int index) {
                                  return _popularItem(context, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(

                        height: 150,
                        width: size.width,
                        child: _imagePager(),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 16, right: 16, bottom: 8, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Top Restaurant",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 165,
                              child: new ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: _foodItem.length,
                                // ignore: missing_return
                                itemBuilder: (BuildContext context, int index) {
                                  return _topRestaurantItem(context, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 16, right: 16, bottom: 8, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Special Offer",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 120,
                              child: new ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: _foodItem.length,
                                // ignore: missing_return
                                itemBuilder: (BuildContext context, int index) {
                                  return _discountedItem(context, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 16, right: 16, bottom: 8, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "On Recommendation",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              height: 120,
                              child: new ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: _foodItem.length,
                                // ignore: missing_return
                                itemBuilder: (BuildContext context, int index) {
                                  return _onRecommendation(context, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }

  Widget _onRecommendation(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: Image.asset(
                  "assets/imgs/${item}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3, left: 4),
              child: Wrap(
                children: [
                  Text("Set Menu 69"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: Wrap(
                children: [
                  Text("Green Lounge",
                      style: TextStyle(
                          fontSize: 12, color: CustomColors.fontDark)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _discountedItem(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: Image.asset(
                  "assets/imgs/${item}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3, left: 4),
              child: Wrap(
                children: [
                  Text("Set Menu 69"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: Wrap(
                children: [
                  Text("30% off",
                      style: TextStyle(
                          fontSize: 12, color: CustomColors.fontDark)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topRestaurantItem(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.asset(
                      "assets/imgs/${item}.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(3.0),
                      ),
                    ),
                    color: CustomColors.ratingBg,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(1),
                      child: Wrap(
                        children: [
                          Text(" 4.5",
                              style: TextStyle(
                                  fontSize: 14, color: CustomColors.fontDark)),
                          Container(
                            child: Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.yellow[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 3, left: 4),
              child: Wrap(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 3),
                      child: Text("Lake Green Lounge")),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: Wrap(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    alignment: Alignment.center,
                    child: Text("Aftab nagar, Dhaka",
                        style: TextStyle(
                            fontSize: 12, color: CustomColors.fontLight)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePager() {
    return Stack(
      children: [
        PageView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _viewPagerController,
          itemCount: _bannerList.length,
          onPageChanged: (int pos) {
            _updatePosition(pos.ceilToDouble());
          },
          itemBuilder: (BuildContext context, int index) {
            return _imagePagerItem(context, index);
          },
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Center(
                child: new DotsIndicator(
              dotsCount: _bannerList.length,
              position: _pagerIndex,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            )),
          ),
        ),
      ],
    );
  }

  Widget _imagePagerItem(BuildContext context, int index) {
    String item = _bannerList[index];
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
          child: Image.asset(
        "assets/imgs/$item.png",
        fit: BoxFit.cover,
        alignment: Alignment.center,
        width: double.maxFinite,
      )),
    );
  }

  Widget _popularItem(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: Image.asset(
                  "assets/imgs/${item}.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3, left: 4),
              child: Wrap(
                children: [
                  Text("Set Menu 69"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 4),
              child: Wrap(
                children: [
                  Text(" 4.5",
                      style: TextStyle(
                          fontSize: 12, color: CustomColors.fontDark)),
                  Container(
                    margin: EdgeInsets.only(left: 1, right: 10),
                    height: 6,
                    width: 6,
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.yellow[700],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    alignment: Alignment.center,
                    child: Text("(12 rating)",
                        style: TextStyle(
                            fontSize: 12, color: CustomColors.fontLight)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodTypeListItem(BuildContext context, int index) {
    FoodModel item = _foodList[index];
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 80,
            child: Card(
              color: Color(item._color),
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(3.0),
                ),
              ),
              child: Image.asset("assets/imgs/${item._url}.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text("${item._name}"),
          ),
        ],
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
          : InkWell(
        onTap: (){
          _navigateToProfileScreen();
        },
            child: Container(
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
          ),
      title: _isSearching
          ? _buildSearchField()
          : Row(
              children: [
                Spacer(),
                Text(
                  "Explore",
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
          child: InkWell(
            onTap: (){
              _navigateToFilterScreen();
            },
            child: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.iconBgColor,
          ),
        ),
      ),
    ];
  }

  _navigateToProfileScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
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

  _navigateToFilterScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilterScreen(),
        ));
  }

}

class FoodModel {
  String _url;
  int _color;
  String _name;
  bool isSelected;




  FoodModel(this._url, this._color, this._name, this.isSelected);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get color => _color;

  set color(int value) {
    _color = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }




}
