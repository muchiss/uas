import 'package:flutter/material.dart';
import 'package:wicat/datacat.dart';
import 'package:wicat/model/model_cat.dart';
import 'package:wicat/onboarding_page.dart';

class Detailcat extends StatelessWidget {
  final Cat datacat;

  const Detailcat({Key? key, required this.datacat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 158, 43, 43),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            print('back');
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'WiCat',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
              fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: new Icon(Icons.bookmark_outline),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(datacat.image), fit: BoxFit.cover)),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      datacat.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      datacat.description,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              primary: Colors.deepOrange),
                          child: Text(
                            'Baca',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
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
}
