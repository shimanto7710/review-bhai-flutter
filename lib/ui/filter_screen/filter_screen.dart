import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/filter_screen/bloc/filter_bloc.dart';
import 'package:reviewbahi/ui/filter_screen/bloc/filter_state.dart';
import 'package:reviewbahi/ui/filter_screen/bloc/filter_state.dart';
import 'package:reviewbahi/ui/filter_screen/bloc/filter_state.dart';
import 'package:reviewbahi/ui/home/fragment/explore_fragment/explore_fragment.dart';
import 'package:reviewbahi/ui/home/home.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  FilterBloc _bloc;

  TextEditingController _locationController;
  List<FoodModel> _foodList = [];
  List<FoodModel> _restaurantList = [];

  bool isTopRated = false;
  bool isLowToHigh = false;
  bool isClosest = false;

  bool isRecommendation = false;
  bool isOffer = false;
  bool isRooftop = false;

  RangeValues _currentRangeValues = const RangeValues(0, 2000);

  @override
  void initState() {
    _bloc = FilterBloc();

    _locationController = TextEditingController();

    _foodList.add(FoodModel("f1", 0xffFFC0BF, "All", false));
    _foodList.add(FoodModel("f2", 0xffFCECCF, "Burger", false));
    _foodList.add(FoodModel("f3", 0xffCEEED1, "Coffee", false));
    _foodList.add(FoodModel("f4", 0xffF4D8B6, "Drinks", false));
    _foodList.add(FoodModel("f5", 0xffFFE7F2, "Pizza", false));
    _foodList.add(FoodModel("f6", 0xffDAF7FF, "Pasta", false));
    _foodList.add(FoodModel("f2", 0xffFCECCF, "Burger", false));
    _foodList.add(FoodModel("f3", 0xffCEEED1, "Coffee", false));
    _foodList.add(FoodModel("f4", 0xffF4D8B6, "Drinks", false));
    _foodList.add(FoodModel("f6", 0xffDAF7FF, "Pasta", false));
    _foodList.add(FoodModel("f5", 0xffFFE7F2, "Pizza", false));

    _restaurantList.add(FoodModel("r1", 0xffFFC0BF, "All", false));
    _restaurantList.add(FoodModel("r2", 0xffFFC0BF, "StreetFood", false));
    _restaurantList.add(FoodModel("r3", 0xffFFC0BF, "FastFood", false));
    _restaurantList.add(FoodModel("r3", 0xffFFC0BF, "FastFood", false));
    _restaurantList.add(FoodModel("r3", 0xffFFC0BF, "FastFood", false));
    _restaurantList.add(FoodModel("r3", 0xffFFC0BF, "FastFood", false));
    _restaurantList.add(FoodModel("r3", 0xffFFC0BF, "FastFood", false));
    _restaurantList.add(FoodModel("r3", 0xffFFC0BF, "FastFood", false));
    _restaurantList.add(FoodModel("r3", 0xffFFC0BF, "FastFood", false));
  }

  @override
  void dispose() {
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          child: Text(
            "Reset",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        title: Text(
          "Filter",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
                _navigateToAScreen(HomeScreen());
              },
              child: Text(
                "Done",
                style: TextStyle(
                  color: CustomColors.primaryColor,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocProvider<FilterBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<FilterBloc, FilterState>(
          listener: (BuildContext context, FilterState state) {
            // ignore: missing_return
          },
          // ignore: missing_return
          builder: (BuildContext context, FilterState state) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              scrollDirection: Axis.vertical,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: CustomColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.location_on,
                                color: CustomColors.primaryColor,
                                size: 26,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 2,
                              color: CustomColors.primaryColor,
                              margin: EdgeInsets.only(left: 16),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 10, bottom: 0),
                                child: TextFormField(
                                  onChanged: (text) {},
                                  controller: _locationController,
                                  style: TextStyle(
                                      color: CustomColors.primaryColor,
                                      fontSize: 20),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Location you want to find",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: Container(
                        margin: EdgeInsets.only(left: 14, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Restaurants",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              height: 85,
                              child: new ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: _restaurantList.length,
                                // ignore: missing_return
                                itemBuilder: (BuildContext context, int index) {
                                  return restaurantItem(context, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Container(
                        margin: EdgeInsets.only(left: 14, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Food Type",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              height: 85,
                              child: new ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: _foodList.length,
                                // ignore: missing_return
                                itemBuilder: (BuildContext context, int index) {
                                  return foodTypeListItem(context, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 14, right: 16, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: size.width,
                            child: Text(
                              "Sort By",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          isTopRated = !isTopRated;
                                          setState(() {});
                                        },
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Top Rated",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                              Spacer(),
                                              (isTopRated)
                                                  ? Icon(
                                                      Icons.select_all,
                                                      color: CustomColors
                                                          .primaryColor,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        height: 1,
                                        width: size.width,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          isLowToHigh = !isLowToHigh;
                                          setState(() {});
                                        },
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Cost low to high",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                              Spacer(),
                                              (isLowToHigh)
                                                  ? Icon(
                                                      Icons.select_all,
                                                      color: CustomColors
                                                          .primaryColor,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        height: 1,
                                        width: size.width,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          isClosest = !isClosest;
                                          setState(() {});
                                        },
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Nearest me",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ),
                                              Spacer(),
                                              (isClosest)
                                                  ? Icon(
                                                      Icons.select_all,
                                                      color: CustomColors
                                                          .primaryColor,
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        height: 1,
                                        width: size.width,
                                        color: Colors.black26,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: CustomColors.primaryColor,
                                        value: isRecommendation,
                                        onChanged: (value) {
                                          setState(() {
                                            isRecommendation =
                                                !isRecommendation;
                                          });
                                        },
                                      ),
                                      Text('Only Recommended'),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: CustomColors.primaryColor,
                                        value: isOffer,
                                        onChanged: (value) {
                                          setState(() {
                                            isOffer = !isOffer;
                                          });
                                        },
                                      ),
                                      Text('Only Offer Available'),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: CustomColors.primaryColor,
                                        value: isRooftop,
                                        onChanged: (value) {
                                          setState(() {
                                            isRooftop = !isRooftop;
                                          });
                                        },
                                      ),
                                      Text('Roof Top'),
                                    ],
                                  ),
                                ),
                               
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Container(

                        margin: EdgeInsets.only(left: 14, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Price Range  (${_currentRangeValues.start.round().toString()} - ${_currentRangeValues.end.round().toString()})",
                              style: TextStyle(
                                  color: CustomColors.fontLight, fontSize: 12),
                            ),

                            Container(
                              child: RangeSlider(
                                values: _currentRangeValues,
                                min: 0,
                                max: 2000,
                                divisions: 2000,
                                labels: RangeLabels(
                                  _currentRangeValues.start.round().toString(),
                                  _currentRangeValues.end.round().toString(),
                                ),
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _currentRangeValues = values;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget foodTypeListItem(BuildContext context, int index) {
    FoodModel item = _foodList[index];
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            height: 60,
            child: InkWell(
              onTap: () {
                _foodList[index].isSelected = !_foodList[index].isSelected;
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Container(
                    color: (item.isSelected)
                        ? CustomColors.primaryColor
                        : Colors.white,
                    child: Image.asset("assets/imgs/${item.url}.png")),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text("${item.name}"),
          ),
        ],
      ),
    );
  }

  Widget restaurantItem(BuildContext context, int index) {
    FoodModel item = _restaurantList[index];
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            height: 60,
            child: InkWell(
              onTap: () {
                _restaurantList[index].isSelected =
                    !_restaurantList[index].isSelected;
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: CustomColors.primaryColor,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Container(
                    color: (item.isSelected)
                        ? CustomColors.primaryColor
                        : Colors.white,
                    child: Image.asset("assets/imgs/${item.url}.png")),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text("${item.name}"),
          ),
        ],
      ),
    );
  }

  _navigateToAScreen(Widget screenName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screenName,
        ));
  }

}
