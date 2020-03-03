import 'package:flutter/material.dart';
import 'package:census/widgets/customTF.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Widget _emailTF(){
    return Container(
      alignment: Alignment.centerLeft,
      height: 40.0,
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(
                Icons.alternate_email
            ),
            hintText: "Username",
            hintStyle: TextStyle(
                fontSize: 25
            )
        ),

      ),
    );
  }
  void _onSignUpTap(BuildContext context){
    Navigator.pushNamed(context,'/register');
  }

  void _onSIgnInTap(BuildContext context) {
    Navigator.pushNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sigin1.png"),
              fit: BoxFit.cover,
            )
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 90.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome         Back",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  SizedBox(
                    height: 100
                  ),
                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.star
                    children: <Widget>[
                      CustomTF( Icon( Icons.alternate_email), "Username"),
                      SizedBox(height: 30.0),
                      CustomTF( Icon( Icons.lock), "Password"),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child:  Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Sign In",
                              style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                            GestureDetector(
                              onTap: () => print('enter'),
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                  boxShadow: [],
                                ),
                                child: Icon( Icons.arrow_forward,
                                color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () => Navigator.pushNamed(context,'/register'),
                          child: Container(
                            height: 30.0,
                            alignment: Alignment.bottomLeft,
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Don't have an account ? ",
                                    ),
                                    TextSpan(
                                        text: "   Sign Up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400
                                        )
                                    )
                                  ]
                              ),
                            ),
                          )
                      )

                    ],
                  )
                ],
              ),
            ),
          )
        )
      ],

    );
  }
}