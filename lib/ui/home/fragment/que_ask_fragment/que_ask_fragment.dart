import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/home/fragment/que_ask_fragment/bloc/que_ask_bloc.dart';

import 'package:reviewbahi/ui/home/fragment/que_ask_fragment/bloc/que_ask_fragment_state.dart';

class QueAskFragment extends StatefulWidget {
  @override
  _QueAskFragmentState createState() => _QueAskFragmentState();
}

class _QueAskFragmentState extends State<QueAskFragment> {
  //appbar search
  final _scrollController = ScrollController();
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  AskBloc _bloc;

  int desLength = 150;
  double _pagerIndex = 0.0;

  List<String> _imageList = [];
  bool isHelpful = false;
  bool isLike = false;

  // view pager
  final _viewPagerController = new PageController();

  @override
  void initState() {
    _bloc = AskBloc();

    _imageList.add("1");
    _imageList.add("2");
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
    return BlocProvider<AskBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<AskBloc, AskState>(
            listener: (BuildContext context, AskState state) {
          // ignore: missing_return
        },
            // ignore: missing_return
            builder: (BuildContext context, AskState state) {
          return Scaffold(
            appBar: _appBar(),
            body: Snap(
              controller: _scrollController.appBar,
              child: Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Container(
                  color: Colors.black12,
                  child: new ListView.builder(
                    controller: _scrollController,
                    itemCount: 10,
                    // ignore: missing_return
                    itemBuilder: (BuildContext context, int index) {
                      return listItem(context);
                    },
                  ),
                ),
              ),
            ),
          );
        }));
  }

  Widget listItem(BuildContext context) {
    String des =
        "পাঠাও ফুডে আগামি ১ সপ্তাহ ব্যাপী চলবে ডাবল ডাবল কাচ্চির উৎসব। আগামিকাল থেকে পাচ্ছেন ২৫০ টাকার কাচ্চির প্যাকেজের সাথে আরও ২৫০ টাকার কাচ্চি ফ্রি। আর দেরী না করে পাঠাও - এ অর্ডার করুন সেরা স্বাদের কাচ্চির ২৫০ টাকার প্যাকেজ।";
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/imgs/james.jpg',
                      width: 50.0,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Wrap(
                      children: [
                        Text("James Rodriguez",
                            style: TextStyle(
                                fontSize: 18, color: CustomColors.fontDark)),
                        Text(" asked a question.",
                            style: TextStyle(
                                fontSize: 18, color: CustomColors.fontLight)),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.more_vert,
                    color: CustomColors.iconColorOnWhite,
                  ),
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Sultan's Dine-এ চলছে অফারের উৎসব। এই বসন্তে সংযোজন হল আরও একটি ধামাকা অফার।",
                style: TextStyle(color: CustomColors.fontDark, fontSize: 15),
              )),
          Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: (des.length > desLength)
                            ? des.substring(0, desLength)
                            : des,
                        style: TextStyle(
                            color: CustomColors.fontDark, fontSize: 15)),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("on resend click");
                        },
                      text: (des.length > desLength) ? "...show more" : "",
                      style:
                          TextStyle(color: CustomColors.fontDark, fontSize: 15),
                    ),
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 200,
            width: size.width,
            child: _imagePager(),
          ),
          // Container(width: size.width,height: 1,color: Colors.black12,),
          Container(
              margin: EdgeInsets.only(left: 10), child: _reactionWidget()),
        ],
      ),
    );
  }

  Widget _reactionWidget() {
    return Container(
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                isLike = !isLike;
              });
            },
            child: Icon(
              (isLike) ? Icons.favorite : Icons.favorite_border,
              color: CustomColors.primaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Text(
              ' 25',
              style: TextStyle(color: CustomColors.fontDark),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isHelpful = !isHelpful;
              });
            },
            child: Icon(
              (isHelpful) ? Icons.verified : Icons.verified_outlined,
              color: CustomColors.primaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Text(
              ' 13',
              style: TextStyle(color: CustomColors.fontDark),
            ),
          ),
          Spacer(),
          Text(
            "26 Comment",
            style: TextStyle(
              color: CustomColors.fontDark,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 20),
    );
  }

  Widget _imagePager() {
    return Stack(
      children: [
        PageView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _viewPagerController,
          itemCount: _imageList.length,
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
              dotsCount: _imageList.length,
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
    String item = _imageList[index];
    return Container(
      child: Center(
          child: Image.asset(
        "assets/imgs/$item.jpg",
        fit: BoxFit.cover,
        alignment: Alignment.center,
        width: double.maxFinite,
      )),
    );
  }

  Widget items() {
    List<int> text = [1, 2];
    return Wrap(
      children: [
        for (var i in text)
          Wrap(
            children: [
              Text(" Kacchi ",
                  style: TextStyle(fontSize: 18, color: CustomColors.fontDark)),
              Container(
                color: CustomColors.ratingBg,
                child: Wrap(
                  children: [
                    Text(" 4.5",
                        style: TextStyle(
                            fontSize: 18, color: CustomColors.fontDark)),
                    Container(
                      height: 10,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ],
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
