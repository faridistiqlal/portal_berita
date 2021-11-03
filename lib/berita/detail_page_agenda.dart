//ANCHOR package detail agenda
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

//ANCHOR class
class AgendaDetail extends StatefulWidget {
  final String judulEvent,
      uraianEvent,
      mulaiEvent,
      selesaiEvent,
      gambarEvent,
      tglmulaiEvent,
      tglselesaiEvent,
      penyelenggaraEvent,
      urlEvent;
  AgendaDetail(
      {this.judulEvent,
      this.uraianEvent,
      this.mulaiEvent,
      this.selesaiEvent,
      this.gambarEvent,
      this.tglmulaiEvent,
      this.tglselesaiEvent,
      this.urlEvent,
      this.penyelenggaraEvent});

  @override
  _AgendaDetailState createState() => _AgendaDetailState();
}

//ANCHOR body
class _AgendaDetailState extends State<AgendaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda Desa'),
        backgroundColor: Color(0xFFee002d),
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 24), //NOTE api gambar image hero
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GestureDetector(
                      child: Hero(
                        tag: 'imageHero',
                        child: Image.network(
                          "${widget.gambarEvent}",
                          fit: BoxFit.cover,
                          height: 195.0,
                          width: 130.0,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return _detail(context);
                        }));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    width: MediaQuery.of(context).size.width - 212,
                    height: MediaQuery.of(context).size.width - 162,
                    //height: 220,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.judulEvent}", //NOTE api judul detail event
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Penyelenggara: ",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "${widget.penyelenggaraEvent}", //NOTE api penyelenggara detail event
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              SizedBox(
                height: 25.0,
                width: 90.0,
                child: InkWell(
                  child: FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Uraian',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              new HtmlView(
                padding: new EdgeInsets.all(5.0),
                data: "${widget.uraianEvent}",
                onLaunchFail: (url) {
                  // optional, type Function
                  print("launch $url failed"); //NOTE api uraian detail event
                },
                scrollable: false,
              ),
              SizedBox(
                height: 15,
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 25.0,
                                child: InkWell(
                                  child: FlatButton(
                                    color: Colors.orange,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          ' Tanggal',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 248,
                                  child: Text(
                                    'Mulai     ' +
                                        "${widget.tglmulaiEvent}", //NOTE api tgl mulai detail event
                                    style: TextStyle(color: Colors.grey),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width - 248,
                                child: Text(
                                  'Selesai  ' +
                                      "${widget.tglselesaiEvent}", //NOTE api tgl selesai detail event
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                          height: 50,
                          child: VerticalDivider(color: Colors.grey)),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 25.0,
                                child: InkWell(
                                  child: FlatButton(
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          ' Waktu',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 268,
                                child: Text(
                                  'Mulai     ' +
                                      "${widget.mulaiEvent}", //NOTE api jam mulai detail event
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 268,
                                child: Text(
                                  'Selesai  ' +
                                      "${widget.selesaiEvent}", //NOTE api jam selesai detail event
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.red.withOpacity(0.1),
                        child: IconButton(
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.home),
                          color: Colors.red,
                          iconSize: 25.0,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text('Home',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.green.withOpacity(0.1),
                        child: IconButton(
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.message),
                          color: Colors.green,
                          iconSize: 25.0,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text('Comment',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.blue.withOpacity(0.1),
                        child: IconButton(
                          padding: EdgeInsets.all(15.0),
                          icon: Icon(Icons.share),
                          color: Colors.blue,
                          iconSize: 25.0,
                          onPressed: () {
                            Share.share(
                                "${widget.urlEvent}"); //NOTE api share link event
                          },
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text('Share',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0))
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detail(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              "${widget.gambarEvent}", //NOTE api gambar detail event
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  String imgAssetPath;
  Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
