import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lists_example/main.dart';
import 'package:lists_example/screens/FirstPage.dart';
import 'package:lists_example/screens/ThirdPage.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  List<UserInfo> userInfoList = [];

  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();

  void setUserInfo() {
    UserInfo userInfo = UserInfo();
    setState(() {
      userInfo.login = _login.text;
      userInfo.password = _password.text;

      userInfoList.add(userInfo);

    });
  }

  void toTheNextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ThirdPage()));
  }

  void clearItem(int index){
    setState(() {
      userInfoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: toTheNextPage, child: Text("To the third page"))),
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
          Expanded(child:
            ListView.builder(
              itemCount: userInfoList.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(userInfoList[index].toString()),
                  trailing: IconButton(onPressed: () => clearItem(index), icon: Icon(Icons.delete)),
                );
              },
            )
          )
        ],
      ),
    );
  }

}