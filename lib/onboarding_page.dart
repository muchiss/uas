import 'package:flutter/material.dart';
import 'package:wicat/login_page.dart';
import 'package:wicat/register.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),

          Image.asset('assets/img/wicat.png', height: 50, width: 120),

          SizedBox(
            height: 30,
          ),

          Image.asset(
            'assets/img/wicat2.png',
            height: 280,
            width: 280,
          ),

          // Container(
          //   width: 150,
          //   height: 150,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(100),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.red.shade400.withOpacity(0.2),
          //         spreadRadius: 20,
          //       )
          //     ],
          //   ),
          //   child: CircleAvatar(
          //     backgroundImage: AssetImage('assets/images/gambar.png', ),
          //   ),
          // ),

          SizedBox(
            height: 20,
          ),

          Text(
            'all about cat \n breeds are here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Text(
            'Your friends all day long',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          SizedBox(
            height: 50,
          ),

          SizedBox(
            height: 55,
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 231, 77, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                print("tesss");
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 55,
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(color: Colors.grey)),
              onPressed: () {
                print("tesss");
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: const Text(
                'Register',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
