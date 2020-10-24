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
                ContentCamera(),
                ContentChat(),
                ContentStatus(),
                Text(
                  '1',
                )
              ],
            )),
      ),
    );
  }
}

class ContentCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ContentChat extends StatelessWidget {
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
          return ItemChat('Juan Perez', 'muchas gracias', true);
        },
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showTrailing;
  ItemChat(this.title, this.subTitle, this.showTrailing);

  @override
  Widget build(BuildContext context) {
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
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(this.subTitle),
            trailing: this.showTrailing
                ? Text(
                    'Ayer',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  )
                : null,
            onTap: () {
              print('item');
            },
          ),
        ),
      ],
    );
  }
}

class ContentStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ItemChat('Mi estado', 'Añade una actualización', false),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Recientes'),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                indent: 84.0,
                endIndent: 12.0,
                color: Colors.grey[250],
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (_, index) {
                return ItemChat(
                  'Pancho Fierro',
                  'hace 8 minutos',
                  false,
                );
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Vistos'),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                indent: 84.0,
                endIndent: 12.0,
                color: Colors.grey[250],
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (_, index) {
                return ItemChat(
                  'Pancho Fierro',
                  'hace 8 minutos',
                  false,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
        ),
        backgroundColor: Color(0xFF01A909),
        onPressed: () {},
      ),
    );
  }
}

class ContentCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
