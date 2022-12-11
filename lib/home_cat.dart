import 'package:flutter/material.dart';
import 'package:wicat/cat_service.dart';
import 'package:wicat/detail_cat.dart';

import 'model/model_cat.dart';
import 'onboarding_page.dart';

class Home_page extends StatefulWidget {
  const Home_page();

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 158, 43, 43),
        backgroundColor: Color.fromARGB(255, 233, 233, 233),
        elevation: 0,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            print('back');
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home_page()));
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
            icon: new Icon(Icons.logout_rounded),
            color: Colors.black,
            onPressed: () {
              print('Sudah Logout');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()));
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Lets know about cat, \nCatLovers",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<List<Cat>>(
                  future: CatService.fetchCat(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        print(snapshot.data![0].name);
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detailcat(
                                              datacat: Cat(
                                                  id: int.parse(
                                                      "${snapshot.data?[index].id}"),
                                                  name:
                                                      "${snapshot.data?[index].name}",
                                                  description:
                                                      "${snapshot.data?[index].description}",
                                                  image:
                                                      "${snapshot.data?[index].image}"),
                                            )));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, right: 10, left: 0),
                                          child: Container(
                                            height: 120,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(snapshot
                                                        .data![index].image),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot.data![index].name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
