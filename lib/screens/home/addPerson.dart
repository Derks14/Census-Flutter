import 'dart:convert';
import 'dart:io';

import 'package:census/models/person.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final _formkey = GlobalKey<FormState>();
  final _user = Person();

  _showDialog(BuildContext context, Text text) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: text));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 90.0,
        ),
          child: Column(
            children: <Widget>[
              Text("Add Person",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300
                ),
              ),
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
                            InputDecoration(labelText: 'First name'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.firstname = val),
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'lastname'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.lastname = val),
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Age'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.age = val),
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Gender'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.gender = val),
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Nationality'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.nationality = val),
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Phone'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.phone = val),
                          ),
                          Container(
                            alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    final form = _formkey.currentState;
                                    if (form.validate()) {
                                      form.save();
                                      print(_user);
                                      _showDialog(context, Text('Submitting form'));
                                      _sendPerson(context, _user);
                                    }
                                  },
                                  child: Text('Save'))
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
      ),
      )
    );
  }

    Future<http.Response> _sendPerson(BuildContext context, Person person) async{
    final http.Response response = await http.post("http://a110aa08.ngrok.io/data/person",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkYW4iLCJleHAiOjE1ODQxNDYwMjh9.lCGmkiRMU1GR218Q3-DShjBXXTeboiwExZ-buw52iVsHhOF-SOhO7UZFM08o09T1KwcTLxKepybWB5lrOB3ixw'
      },
      body: jsonEncode(<String,String>{
        'firstname':person.firstname,
        'lastname':person.lastname,
        'age':person.age,
        'gender':person.gender,
        'nationality':person.nationality,
        'phone':person.phone
      }),
    );
    if( response.statusCode == 201) {
      _showDialog(context, Text('Person Added'));
    }else{
      _showDialog(context, Text('Error, Person not added'));
    }
  }


}
