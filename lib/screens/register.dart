import 'package:flutter/material.dart';
import 'package:census/widgets/customTF.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/signup2.png"),
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
                    Text("Create         Account",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    SizedBox(
                        height: 80
                    ),
                    Column(
//                    crossAxisAlignment: CrossAxisAlignment.star
                      children: <Widget>[
                        CustomTF( Icon( Icons.alternate_email), "Username"),
                        SizedBox(height: 20.0),
                        CustomTF( Icon( Icons.mail), "Email"),
                        SizedBox(height: 20.0),
                        CustomTF( Icon( Icons.lock), "Pasword"),
                        SizedBox(height: 20.0),
                        CustomTF( Icon( Icons.person), "Role"),
//                        Sign in label and button
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child:  Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/home'),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54,
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
                          onTap: () => Navigator.pushNamed(context,'/'),
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
                                      text: "Already have an account ? ",
                                    ),
                                    TextSpan(
                                        text: "   Sign In",
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