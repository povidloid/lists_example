import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lists_example/main.dart';

import 'SecondPage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  List<UserInfo> userInfoList = [];

  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();

  void setUserInfo() {
    setState(() {
      UserInfo userInfo = UserInfo();
      userInfo.login = _login.text;
      userInfo.password = _password.text;

      userInfoList.add(userInfo);
    });
  }

  void toTheNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondPage()));
  }

  void clearItem(int index) {
    setState(() {
      userInfoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: toTheNextPage, child: Text("To the second page"))),
          TextField(
            controller: _login,
            decoration: InputDecoration(labelText: "Login: "),
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(labelText: "Password: "),
          ),
          SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: setUserInfo, child: Text("OK"))),
          ...userInfoList.asMap().entries.map((entry) {
            int index = entry.key;
            UserInfo user = entry.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(user.toString(), textAlign: TextAlign.start),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => clearItem(index),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    ));
  }
}
