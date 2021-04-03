import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/write_review_screen/bloc/write_review_bloc.dart';
import 'package:reviewbahi/ui/write_review_screen/bloc/write_review_state.dart';
import 'package:reviewbahi/ui/write_review_screen/bloc/write_review_state.dart';
import 'package:reviewbahi/ui/write_review_screen/bloc/write_review_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WriteReviewScreen extends StatefulWidget {
  static const routeName = '/writeReviewScreen';

  @override
  _WriteReviewScreenState createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  WriteReviewBloc _bloc;
  final maxLines = 5;

  List<String> _foodItem = [];
  List<String> _gender_status = ["Low", "Moderate", "High"];
  String _genderGrop = "gender";

  @override
  void initState() {
    _bloc = WriteReviewBloc();

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,

        title: Text(
          "Write Review",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            child: Text(
              "Done",
              style: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocProvider<WriteReviewBloc>(
          create: (_) => _bloc,
          // ignore: missing_return
          child: BlocConsumer<WriteReviewBloc, WriteReviewState>(
              listener: (BuildContext context, WriteReviewState state) {
            // ignore: missing_return
          },
              // ignore: missing_return
              builder: (BuildContext context, WriteReviewState state) {
            return Container(
              color: CustomColors.ratingBg,
              child: ListView(
                children: [
                  Card(
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Title",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 75.0,
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText: "Type a text",
                                  fillColor: CustomColors.textFieldBg,
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Description",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: maxLines * 24.0,
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  hintText: "Type a text",
                                  fillColor: CustomColors.textFieldBg,
                                  filled: true,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Images",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 5, top: 5, bottom: 10),
                            height: 80,
                            child: new ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _foodItem.length,
                              scrollDirection: Axis.horizontal,
                              // ignore: missing_return
                              itemBuilder: (BuildContext context, int index) {
                                return _iamgeListItem(context, index);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Restaurant",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        children: [
                                          Text(
                                            "Sultan Dine",
                                            style: TextStyle(fontSize: 20),
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
                                                "Top Rated",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              )),
                                        ],
                                      ),
                                      Text(
                                        "Gulshan-2, Dhaka",
                                        style: TextStyle(
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Card(
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(3.0),
                                        ),
                                      ),
                                      color: CustomColors.ratingBg,
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(5),
                                        child: Wrap(
                                          children: [
                                            Text(" 4.5",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color:
                                                        CustomColors.fontDark)),
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
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Service Rating",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: RatingBar.builder(
                              itemSize: 25,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Environment Rating",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: RatingBar.builder(
                              itemSize: 25,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Decoration Rating",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: RatingBar.builder(
                              itemSize: 25,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),

                          Text(
                            "Food Item",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Kacchi",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Description",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: maxLines * 24.0,
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                maxLines: maxLines,
                                decoration: InputDecoration(
                                  hintText: "Type a text",
                                  fillColor: CustomColors.textFieldBg,
                                  filled: true,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Title",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 40.0,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(fontSize: 16),
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: "Type a text",
                                  fillColor: CustomColors.textFieldBg,
                                  filled: true,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Taste Rating",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            child: RatingBar.builder(
                              itemSize: 25,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Price Range",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 0, bottom: 0,right: 50),
                            child: Container(
                              child: RadioGroup<String>.builder(
                                direction: Axis.horizontal,
                                groupValue: _genderGrop,
                                onChanged: (value) => setState(() {
                                  _genderGrop = value;
                                }),
                                items: _gender_status,
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }

  Widget _iamgeListItem(BuildContext context, int index) {
    String item = _foodItem[index];
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.0),
              child: Image.asset(
                "assets/imgs/${item}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              right: 12,
              top: 3,
              child: Icon(
                Icons.close,
                color: Colors.white,
              )),
        ],
      ),
    );
  }

}
