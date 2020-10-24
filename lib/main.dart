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
              children: [
                Text(
                  '1',
                ),
                ChatList(),
                Text(
                  '1',
                ),
                Text(
                  '1',
                )
              ],
            )),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: 12,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 1,
          indent: 84.0,
          endIndent: 12.0,
          color: Colors.grey[250],
        ),
        itemBuilder: (_, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 24,
                      child: Icon(Icons.person),
                    ),
                  ),
                  title: Text(
                    'Juan Perez',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Muchas gracias'),
                  trailing: Text(
                    'Ayer',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    print('item');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
