import 'package:flutter/material.dart';
import 'package:wicat/cat_service.dart';
import 'package:wicat/contactme.dart';
import 'package:wicat/detail_cat.dart';
import 'package:wicat/login_page.dart';

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
        backgroundColor: Colors.deepOrange,
        elevation: 0,

        centerTitle: true,
        title: Text(
          'WiCat',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkphAy8NuQgtXLWZViER1ngGGAMkbW7lxMkg&usqp=CAU"))),
        margin: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 27, 27, 27)),
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
                    color: Color.fromARGB(255, 151, 144, 144),
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
                                color: Color.fromARGB(255, 250, 134, 98),
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
                                                      fontSize: 30,
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
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          new DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            ),
            child: new Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  child: new Image.asset(
                    'img/wicat2.png',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'CATLOVERS',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.contact_support_outlined),
            title: new Text('Contact us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Contactme()));
            },
          ),
        ],
      )),
    );
  }
}
