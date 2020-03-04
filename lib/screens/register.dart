import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:census/models/user.dart';
import 'dart:convert';



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final _user = User();

  Future<http.Response> _signin(BuildContext context, User user) async{
    final http.Response response = await http.post("http://a110aa08.ngrok.io/system/user",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
//        HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkYW4iLCJleHAiOjE1ODQxNDYwMjh9.lCGmkiRMU1GR218Q3-DShjBXXTeboiwExZ-buw52iVsHhOF-SOhO7UZFM08o09T1KwcTLxKepybWB5lrOB3ixw'
      },
      body: jsonEncode(<String,String>{
        'email':user.email,
        'phone':user.telephone,
        'username': user.username,
        'password':user.password,

      }),
    );
    if( response.statusCode == 200) {
      _showDialog(context, Text('Account Created Successfully'));

      Navigator.pushNamed(context,'/');
      _showDialog(context, Text('Account Created Successfully'));

    }else{
      _showDialog(context, Text('Invalid Credentials'));
    }
  }

  _showDialog(BuildContext context, Text text) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: text));
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
//                physics: AlwaysScrollableScrollPhysics(),
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
                        Container(
                          child: Builder(
                            builder: (context) => Form(
                                key: _formkey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextFormField(
                                      decoration:
                                      InputDecoration(
                                          prefixIcon: Icon(Icons.mail),
                                          labelText: 'Email'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your valid email address';
                                        }
                                      },
                                      onSaved: (val) =>
                                          setState(() => _user.email = val),
                                    ),
                                    SizedBox(height: 10.0,),

                                    TextFormField(
                                      decoration:
                                      InputDecoration(
                                          prefixIcon: Icon(Icons.phone),
                                          labelText: 'Phone'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your valid email address';
                                        }
                                      },
                                      onSaved: (val) =>
                                          setState(() => _user.telephone = val),
                                    ),
                                    SizedBox(height: 10.0,),

                                    TextFormField(
                                      decoration:
                                      InputDecoration(
                                          prefixIcon: Icon(Icons.person),
                                          labelText: 'Username'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your username';
                                        }
                                      },
                                      onSaved: (val) =>
                                          setState(() => _user.username = val),
                                    ),
                                    SizedBox(height: 10.0,),
                                    TextFormField(
                                      decoration:
                                      InputDecoration(
                                          prefixIcon: Icon(Icons.lock),
                                          labelText: 'Password'),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your first name';
                                        }
                                      },
                                      onSaved: (val) =>
                                          setState(() => _user.password = val),
                                    ),

                                    Container(
//                                      alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(vertical: 30),
                                        child: Row(

                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Sign In",
                                              style: TextStyle(
                                                  fontSize: 40.0,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                final form = _formkey.currentState;
                                                if (form.validate()) {
                                                  form.save();
                                                  print(_user);
                                                  _showDialog(context, Text('Authenticating'));
                                                  _signin(context, _user);
                                                }
                                              },
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
                                        )
                                    )
                                  ],
                                )),
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