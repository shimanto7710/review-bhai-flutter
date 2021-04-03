import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/ask_detail_screen/bloc/ask_detail_bloc.dart';
import 'package:reviewbahi/ui/ask_detail_screen/bloc/ask_detail_state.dart';
import 'package:reviewbahi/ui/ask_detail_screen/bloc/ask_detail_state.dart';
import 'package:reviewbahi/ui/ask_detail_screen/bloc/ask_detail_state.dart';

class AskDetailScreen extends StatefulWidget {
  static const routeName = '/askDetailScreen';

  @override
  _AskDetailScreenState createState() => _AskDetailScreenState();
}

class _AskDetailScreenState extends State<AskDetailScreen> {
  AskDetailBloc _bloc;

  bool isHelpful = false;
  bool isLike = false;
  bool _isBookmark = false;
  FocusNode myFocusNode;

  // view pager
  final _viewPagerController = new PageController();
  List<String> _imageList = [];
  double _pagerIndex = 0.0;

  final _scrollController = ScrollController();
  @override
  void initState() {
    _bloc = AskDetailBloc();
    myFocusNode = FocusNode();

    _imageList.add("1");
    _imageList.add("2");
  }

  @override
  void dispose() {
    _bloc.close();
    myFocusNode = FocusNode();
  }

  void _updatePosition(double position) {
    setState(() => _pagerIndex = position);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text(
          "Q&A Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   brightness: Brightness.light,
      //   title: Text(
      //     "Questionnaire",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      //   elevation: 2,
      // ),
      body: BlocProvider<AskDetailBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<AskDetailBloc, AskDetailState>(
            listener: (BuildContext context, AskDetailState state) {
          // ignore: missing_return
        },
            // ignore: missing_return
            builder: (BuildContext context, AskDetailState state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: ListView(children: [
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Text(
                              "Asked By",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Image.asset(
                                    'assets/imgs/james.jpg',
                                    width: 40.0,
                                    height: 40,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        Text(
                                          "James Rodriquez",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 3),
                                            padding: EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 2,
                                                bottom: 2),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                gradient: new LinearGradient(
                                                  end: const Alignment(
                                                      0.0, -1),
                                                  begin: const Alignment(
                                                      0.0, 0.6),
                                                  colors: <Color>[
                                                    const Color(0xffFFAE7F),
                                                    const Color(0xffFF97A1),
                                                  ],
                                                ),
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(50))),
                                            child: Text(
                                              "Noob",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            )),
                                      ],
                                    ),
                                    Text(
                                      "36 reviews",
                                      style: TextStyle(
                                          fontSize: 12,
                                          decoration:
                                          TextDecoration.underline),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      _isBookmark = !_isBookmark;
                                      setState(() {});
                                    },
                                    child: (_isBookmark)
                                        ? Icon(
                                      Icons.bookmark,
                                      color: CustomColors.primaryColor,
                                      size: 32,
                                    )
                                        : Icon(
                                      Icons.bookmark_border_outlined,
                                      color: CustomColors.primaryColor,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 18),
                        child: Text(
                          "Sultan's Dine-এ চলছে অফারের উৎসব। এই বসন্তে সংযোজন হল আরও একটি ধামাকা অফার।",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 18),
                        child: Text(
                          "পাঠাও ফুডে আগামি ১ সপ্তাহ ব্যাপী চলবে ডাবল ডাবল কাচ্চির উৎসব। আগামিকাল থেকে পাচ্ছেন ২৫০ টাকার কাচ্চির প্যাকেজের সাথে আরও ২৫০ টাকার কাচ্চি ফ্রি। আর দেরী না করে পাঠাও - এ অর্ডার করুন সেরা স্বাদের কাচ্চির ২৫০ টাকার প্যাকেজ।",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 300,
                        width: size.width,
                        child: _imagePager(),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 16, right: 16,top: 4),
                          child: _reactionWidget()),
                      Container(
                        width: size.width,
                        height: 1,
                        color: Colors.black26,
                        margin: EdgeInsets.only( top: 4),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          controller: _scrollController,
                          itemCount: 5,
                          // ignore: missing_return
                          itemBuilder: (BuildContext context, int index) {
                            return _mainComments(context, index);
                          },
                        ),
                      ),
                    ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: CustomColors.ratingBg,
                        height: 50,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.asset(
                                  'assets/imgs/james.jpg',
                                  width: 40.0,
                                  height: 40,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                color: Color(0xffE9EBFF),
                                child: Wrap(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 16),
                                      child: TextField(
                                        focusNode: myFocusNode,
                                        style: TextStyle(
                                            color: CustomColors.primaryColor,
                                            fontSize: 15),
                                        decoration: InputDecoration(
                                          hintText: "Type a text",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),

                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _mainComments(BuildContext context, int index) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/imgs/james.jpg',
                      width: 40.0,
                      height: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        color: Color(0xffE9EBFF),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Sultan Dine",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "এই পোস্টে যারা হা হা দেয় তারা প্রতিবন্ধী",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLike = !isLike;
                              });
                            },
                            child: Icon(
                              (isLike) ? Icons.favorite : Icons.favorite_border,
                              color: CustomColors.primaryColor,
                              size: 18,
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
                              print("click on main comment reply");
                              FocusScope.of(context).requestFocus(myFocusNode);
                            },
                            child: Container(
                              child: Text(
                                'Reply',
                                style: TextStyle(color: CustomColors.fontDark),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Delete',
                              style: TextStyle(color: CustomColors.fontDark),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '2h',
                            style: TextStyle(color: CustomColors.fontDark),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          controller: _scrollController,
                          itemCount: 5,
                          // ignore: missing_return
                          itemBuilder: (BuildContext context, int index) {
                            return _subComments(context, index);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 45, top: 10),
                        height: 45,
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).requestFocus(myFocusNode);
                          },
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            color: Color(0xffE9EBFF),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 16),
                                child: Text(
                                  "Write a reply",
                                  textAlign: TextAlign.start,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [],
            )
          ],
        ));
  }

  Widget _subComments(BuildContext context, int index) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/imgs/james.jpg',
                      width: 30.0,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        color: Color(0xffE9EBFF),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Sultan Dine",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "এই পোস্টে যারা হা হা দেয় তারা প্রতিবন্ধী",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLike = !isLike;
                              });
                            },
                            child: Icon(
                              (isLike) ? Icons.favorite : Icons.favorite_border,
                              color: CustomColors.primaryColor,
                              size: 18,
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
                              print("click on sub comment reply");
                              FocusScope.of(context).requestFocus(myFocusNode);
                            },
                            child: Text(
                              'Reply',
                              style: TextStyle(color: CustomColors.fontDark),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Delete',
                              style: TextStyle(color: CustomColors.fontDark),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '2h',
                            style: TextStyle(color: CustomColors.fontDark),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [],
            )
          ],
        ));
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

}
