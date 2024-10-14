import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lists_example/main.dart';
import 'package:lists_example/screens/FirstPage.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPage createState() => _ThirdPage();
}

class _ThirdPage extends State<ThirdPage> {
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
        context, MaterialPageRoute(builder: (context) => FirstPage()));
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
                  onPressed: toTheNextPage, child: Text("To the first page"))),
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
          ListView.separated(
            itemCount: userInfoList.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(userInfoList[index].toString()),
                trailing: IconButton(onPressed: () => clearItem(index), icon: Icon(Icons.delete)),
              );
            },
            separatorBuilder: (context, index) => Divider(),
          )
          )
        ],
      ),
    );
  }

}