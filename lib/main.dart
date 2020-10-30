import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(CloneWhatsApp(firstCamera));
}

const _primaryColor = Color(0xFF075E54);
const _buttonColor = Color(0xFF01A909);

class CloneWhatsApp extends StatelessWidget {
  final CameraDescription camera;
  CloneWhatsApp(this.camera);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: _primaryColor,
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
                ContentCamera(
                  camera: this.camera,
                ),
                ContentChat(),
                ContentStatus(),
                ContentCall(),
              ],
            )),
      ),
    );
  }
}

class ContentCamera extends StatefulWidget {
  final CameraDescription camera;

  const ContentCamera({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _ContentCameraState createState() => _ContentCameraState();
}

class _ContentCameraState extends State<ContentCamera> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ContentChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 12,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 1,
          indent: 84.0,
          endIndent: 12.0,
          color: Colors.grey[250],
        ),
        itemBuilder: (_, index) {
          return ItemChat('Juan Perez', 'muchas gracias', true, null);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _buttonColor,
        child: Icon(Icons.message),
        onPressed: null,
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool showTrailing;
  final IconButton icon;
  ItemChat(this.title, this.subTitle, this.showTrailing, this.icon);

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
            trailing: this.icon == null
                ? this.showTrailing
                    ? Text(
                        'Ayer',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    : null
                : this.icon,
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
            ItemChat(
              'Mi estado',
              'Añade una actualización',
              false,
              null,
            ),
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
                return ItemChat('Juana de Arco', 'hace 8 minutos', false, null);
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
                return ItemChat('Pancho Fierro', 'hace 8 minutos', false, null);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
        ),
        backgroundColor: _buttonColor,
        onPressed: () {},
      ),
    );
  }
}

class ContentCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (_, index) => ItemChat(
          'Papá',
          '22 de Octubre 23:43',
          false,
          IconButton(
            icon: Icon(
              Icons.call,
              color: _primaryColor,
            ),
            onPressed: null,
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 1,
          indent: 84.0,
          endIndent: 12.0,
          color: Colors.grey[250],
        ),
        itemCount: 12,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _buttonColor,
        child: Icon(Icons.call),
        onPressed: null,
      ),
    );
  }
}
