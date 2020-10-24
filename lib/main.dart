import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF075E54),
              title: Text('WhatsApp'),
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: new Icon(Icons.search),
                  onPressed: () {
                    print('OnPress icon search');
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: new Icon(Icons.more_vert),
                  onPressed: () {
                    print('OnPress icon menu');
                  },
                )
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: new Icon(Icons.camera_alt),
     
                  ),
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'ESTADOS',
                  ),
                  Tab(
                    text: 'LLAMADAS',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [Text('1'), Text('1'), Text('1'), Text('1')],
            )),
      ),
    );
  }
}
