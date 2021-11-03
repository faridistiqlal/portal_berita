import 'package:dokar_aplikasi/berita/hal_berita_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http; //api
import 'dart:async'; // api syn
import 'dart:convert'; // api to json

class EditSemua extends StatefulWidget {
  @override
  _EditSemuaState createState() => _EditSemuaState();
}

class _EditSemuaState extends State<EditSemua> {
  String username = "";
  String kecamatan = "";
  int jumlah;
  int jumlahkeg;
  int jumlahB;
  int jumlahBum;

  Future<String> jumlahBerita() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(
        "http://dokar.kendalkab.go.id/webservice/android/kabar/jumlahberita",
        body: {
          "IdDesa": pref.getString("IdDesa"),
        });
    var jumlahberita = json.decode(response.body);
    print(jumlahberita);
    setState(() {
      if (jumlahberita == null) {
        jumlah = 0;
      } else {
        jumlah = jumlahberita;
      }
    });
  }

  Future<String> jumlahKegiatan() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(
        "http://dokar.kendalkab.go.id/webservice/android/kabar/jumlahkegiatan",
        body: {
          "IdDesa": pref.getString("IdDesa"),
        });
    var jumlahkegiatan = json.decode(response.body);
    print(jumlahkegiatan);
    setState(() {
      if (jumlahkegiatan == null) {
        jumlahkeg = 0;
      } else {
        jumlahkeg = jumlahkegiatan;
      }
    });
  }

  Future<String> jumlahBid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(
        "http://dokar.kendalkab.go.id/webservice/android/bid/jumlah",
        body: {
          "IdDesa": pref.getString("IdDesa"),
        });
    var jumlahbid = json.decode(response.body);
    print(jumlahbid);
    setState(() {
      if (jumlahbid == null) {
        jumlahB = 0;
      } else {
        jumlahB = jumlahbid;
      }
    });
  }

  Future<String> jumlahBumdes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(
        "http://dokar.kendalkab.go.id/webservice/android/bumdes/jumlah",
        body: {
          "IdDesa": pref.getString("IdDesa"),
        });
    var jumlahbumdes = json.decode(response.body);
    print(jumlahbumdes);
    setState(() {
      if (jumlahbumdes == null) {
        jumlahBum = 0;
      } else {
        jumlahBum = jumlahbumdes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Konten'),
        backgroundColor: Color(0xFFee002d),
      ),
      body: Container(
        padding: new EdgeInsets.all(5.0),
        child: new GestureDetector(
          child: Column(
            children: <Widget>[
              cardBerita(),
              beritaEdit(),
              kegiatanEdit(),
              bidEdit(),
              bumdesEdit(),
            ],
          ),
        ),
      ),
    );
  }

  Future _cekUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("userAdmin") != null) {
      setState(() {
        username = pref.getString("userAdmin");
        kecamatan = pref.getString("kecamatan");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _cekUser();
    jumlahBerita();
    jumlahKegiatan();
    jumlahBid();
    jumlahBumdes();
  }

  Widget beritaEdit() {
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => new FormBeritaDashbord(),
          ),
        );
      },
      child: new Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(Icons.library_books, size: 35, color: Colors.white),
          subtitle: new Text(
            "Lihat detail",
            style: new TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          title: new Text(
            "Berita",
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          trailing:
              Icon(Icons.arrow_forward_ios, size: 14.0, color: Colors.white),
        ),
      ),
    );
  }

  Widget kegiatanEdit() {
    return Card(
      color: Colors.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(Icons.directions_run, size: 35, color: Colors.white),
        subtitle: new Text(
          "Lihat detail",
          style: new TextStyle(fontSize: 12.0, color: Colors.white),
        ),
        title: new Text(
          "Kegiatan",
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 14.0, color: Colors.white),
      ),
    );
  }

  Widget bidEdit() {
    return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading:
            Icon(Icons.store_mall_directory, size: 35, color: Colors.white),
        subtitle: new Text(
          "Lihat detail",
          style: new TextStyle(fontSize: 12.0, color: Colors.white),
        ),
        title: new Text(
          "BID",
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 14.0, color: Colors.white),
      ),
    );
  }

  Widget bumdesEdit() {
    return Card(
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(Icons.shopping_basket, size: 35, color: Colors.white),
        subtitle: new Text(
          "Lihat detail",
          style: new TextStyle(fontSize: 12.0, color: Colors.white),
        ),
        title: new Text(
          "Bumdes",
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing:
            Icon(Icons.arrow_forward_ios, size: 14.0, color: Colors.white),
      ),
    );
  }

  Widget cardBerita() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.all(5.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFee002d),
                    Color(0xFFe3002a),
                    Color(0xFFd90028),
                    Color(0xFFcc0025),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 15.0)
                ]),
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/logos/logokendal.png',
                        width: 70.0,
                        height: 70.0,
                      ),
                      SizedBox(width: 20.0),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Desa ' + username,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Kec. ' + kecamatan,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          Text(
                            'Kab. Kendal',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white24,
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "$jumlah",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('Berita',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13.0))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("$jumlahkeg",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          SizedBox(height: 8.0),
                          Text('Kegiatan',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13.0))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("$jumlahB",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          SizedBox(height: 8.0),
                          Text('BID',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13.0))
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text("$jumlahBum",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          SizedBox(height: 8.0),
                          Text('Bumdes',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 13.0))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
