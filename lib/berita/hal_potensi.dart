//ANCHOR PACKAGE halaman potensi
import 'package:dokar_aplikasi/berita/detail_page_potensi.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';

import 'hal_tab_berita_admin.dart';

//ANCHOR StatefulWidget Potensi
class Potensi extends StatefulWidget {
  @override
  _PotensiState createState() => _PotensiState();
}

class _PotensiState extends State<Potensi> {
//ANCHOR Atribut
/*
  List dataJSON;
  GlobalKey<RefreshIndicatorState> refreshKey;
  var loading = false;

//ANCHOR api BID desa
  Future<String> ambildata() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("http://dokar.kendalkab.go.id/webservice/android/bid"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      dataJSON = json.decode(hasil.body);
      // if (!mounted) return;
    });
  }

  @override
  void initState() {
    this.ambildata();
  }

//ANCHOR Body halaman
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'Rekomendasi',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 160.0,
//ANCHOR listview bid atas
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dataJSON == null ? 0 : dataJSON.length,
                itemBuilder: (context, i) {
                  return new Container(
                    child: new Card(
                      child: new Container(
                        padding: new EdgeInsets.all(5.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage: NetworkImage(dataJSON[i]
                                  ["inovasi_gambar"]), // NOTE api gambar berita
                              radius: 50,
                            ),
                            Container(
                              height: 3.0,
                            ),
                            SizedBox(
                              width: 100.0,
                              child: AutoSizeText(
                                dataJSON[i]
                                    ["inovasi_judul"], // NOTE api judul berita
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                    //fontSize: 16.0,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ),
                            new Wrap(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.account_circle,
                                    size: 16, color: Colors.black45),
                                SizedBox(
                                  width: 100.0,
                                  child: AutoSizeText(
                                    dataJSON[i][
                                        "inovasi_admin"], // NOTE api admin berita
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Berita terkait',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              //height: 200.0,
//ANCHOR listview bawah
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataJSON == null ? 0 : dataJSON.length,
                itemBuilder: (context, i) {
                  return new Container(
                    //padding: new EdgeInsets.all(5.0),
                    child: new GestureDetector(
                      onTap: () {
                        // NOTE onpress container bid listview
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPotensi(
                              dGambar: dataJSON[i]["inovasi_gambar"],
                              dJudul: dataJSON[i]["inovasi_judul"],
                              dTempat: dataJSON[i]["inovasi_tempat"],
                              dAdmin: dataJSON[i]["inovasi_admin"],
                              dTanggal: dataJSON[i]["inovasi_tanggal"],
                              dHtml: dataJSON[i]["inovasi_isi"],
                            ),
                          ),
                        );
                      },
                      child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 64,
                              minHeight: 64,
                              maxWidth: 84,
                              maxHeight: 84,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                dataJSON[i][
                                    "inovasi_gambar"], // NOTE api gambar bid bawah
                                fit: BoxFit.cover,
                                height: 150.0,
                                width: 110.0,
                              ),
                            ),
                          ),
                          subtitle: Row(
                            children: <Widget>[
                              new Text(
                                dataJSON[i][
                                    "inovasi_admin"], // NOTE api admin bid bawah
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                            ],
                          ),
                          title: new Text(
                            dataJSON[i]
                                ["inovasi_judul"], // NOTE api admin judul bawah
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: new TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }*/
  String nextPage =
      "http://dokar.kendalkab.go.id/webservice/android/bid/loadmorebid"; //NOTE url api load berita
  ScrollController _scrollController = new ScrollController();
  GlobalKey<RefreshIndicatorState> refreshKey;
  List databerita = new List();
  bool isLoading = false;
  final dio = new Dio();
  String dibaca;
  List dataJSON;

  void _getMoreData() async {
    //NOTE if else load more
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final response = await dio.get(nextPage);
      List tempList = new List();
      nextPage = response.data['next'];

      for (int i = 0; i < response.data['result'].length; i++) {
        tempList.add(response.data['result'][i]);
      }

      setState(() {
        isLoading = false;
        databerita.addAll(tempList);
      });
    }
  }

//ANCHOR inistate berita
  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

//ANCHOR dispose
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

//ANCHOR loading
  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

//ANCHOR listview berita
  Widget _buildList() {
    return ListView.builder(
      //+1 for progressbar
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      controller: _scrollController,
      itemCount: databerita.length + 1, //NOTE if else listview berita
      itemBuilder: (BuildContext context, int index) {
        if (index == databerita.length) {
          return _buildProgressIndicator();
        } else {
          if (databerita[index]["inovasi_id"] == 'Notfound') {
            /*
            return new Container(
              child: ListTile(
                title: new Text(
                  databerita[index]["inovasi_id"], // NOTE api admin judul bawah
                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
            );*/
          } else {
            return new Container(
              //padding: new EdgeInsets.all(5.0),
              child: new GestureDetector(
                onTap: () {
                  // NOTE onpress container bid listview
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPotensi(
                        dGambar: databerita[index]["inovasi_gambar"],
                        dJudul: databerita[index]["inovasi_judul"],
                        dTempat: databerita[index]["inovasi_tempat"],
                        dAdmin: databerita[index]["inovasi_admin"],
                        dTanggal: databerita[index]["inovasi_tanggal"],
                        dHtml: databerita[index]["inovasi_isi"],
                      ),
                    ),
                  );
                },
                child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 64,
                        minHeight: 64,
                        maxWidth: 84,
                        maxHeight: 84,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          databerita[index]
                              ["inovasi_gambar"], // NOTE api gambar bid bawah
                          fit: BoxFit.cover,
                          height: 150.0,
                          width: 110.0,
                        ),
                      ),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        new Text(
                          databerita[index]
                              ["inovasi_admin"], // NOTE api admin bid bawah
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                    title: new Text(
                      databerita[index]
                          ["inovasi_judul"], // NOTE api admin judul bawah
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: new TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.0,
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }

//ANCHOR body berita
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              Navigator.pushReplacementNamed(context, '/HalamanBeritaadmin');
            });
          },
          child: new Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: Text(
                      "Bursa Inovasi Desa",
                      style: new TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: _buildList(),
                  ),
                ]),
          )),
      resizeToAvoidBottomPadding: false,
    );
  }
}
