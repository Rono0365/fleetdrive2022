import 'package:flutter/material.dart';

class ruxxball extends StatelessWidget {
  const ruxxball({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    var ery ;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Afleetdrive"),
      ),
      body: Wrap(
        children: [
          ListTile(
            title: Text('Start Trip'),
            subtitle: Text('hello driver'),
            trailing: Switch(
              activeColor: Colors.green,
              inactiveThumbColor:
                  ery == 'ig' ? Colors.green : Colors.red,
              value: isSwitched,
              onChanged: (value) {
                
                isSwitched = value;
                isSwitched ? ery = 'hoih': ery = 'ig';
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(
                      10.0) //                 <--- border radius here
                  ),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Row(children: [
                SizedBox(
                  width: 7,
                ),
                CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent.withOpacity(0.1),
                  radius: 28,
                  child: Icon(Icons.person_outlined,
                      color: Colors.deepPurple),
                )
              ]),
              SizedBox(
                height: 52,
              ),
              Row(children: [
                SizedBox(
                  width: 5,
                ),
                Text('Users will appear here', style: TextStyle(fontSize: 20)),
              ]),
            ]),
            //color: Colors.deepPurple.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
