//ANCHOR package navigator
import 'package:dokar_aplikasi/berita/detail_page_berita.dart';
import 'package:dokar_aplikasi/berita/edit_semua.dart';
import 'package:dokar_aplikasi/berita/hal_tab_berita_warga.dart';
import 'package:dokar_aplikasi/berita/hal_tab_berita_admin.dart';
import 'package:dokar_aplikasi/berita/detail_page_agenda.dart';
import 'package:dokar_aplikasi/screens/onboarding_screen.dart';
import 'package:dokar_aplikasi/berita/form/form_berita.dart';
import 'package:dokar_aplikasi/berita/hal_berita_edit.dart';
import 'package:dokar_aplikasi/berita/hal_berita_list.dart';
import 'package:dokar_aplikasi/screens/splash_screen.dart';
import 'package:dokar_aplikasi/berita/hal_admin_tes.dart';
import 'package:dokar_aplikasi/daftar_warga_login.dart';
import 'package:dokar_aplikasi/daftar_admin.dart';
import 'package:dokar_aplikasi/daftar_warga.dart';
import 'package:dokar_aplikasi/login_warga.dart';
import 'package:dokar_aplikasi/login_admin.dart';
import 'package:dokar_aplikasi/pilih_akun.dart';
import 'package:dokar_aplikasi/hal_dua.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light),
  );
//ANCHOR routes halaman
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new Login(),
        '/Haldua': (BuildContext context) => new Haldua(),
        '/AdminTes': (BuildContext context) => new AdminTes(),
        '/EditSemua': (BuildContext context) => new EditSemua(),
        '/EditSemua': (BuildContext context) => new EditSemua(),
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/PilihAkun': (BuildContext context) => new PilihAKun(),
        '/FormBerita': (BuildContext context) => new FormBerita(),
        '/DaftarWarga': (BuildContext context) => new DaftarWarga(),
        '/DaftarAdmin': (BuildContext context) => new DaftarAdmin(),
        '/AgendaDetail': (BuildContext context) => new AgendaDetail(),
        '/FormBeritaEdit': (BuildContext context) => new FormBeritaEdit(),
        '/OnboardingPage': (BuildContext context) => new OnboardingPage(),
        '/DaftarWargaLogin': (BuildContext context) => new DaftarWargaLogin(),
        '/HalamanBeritaWarga': (BuildContext context) =>
            new HalamanBeritaWarga(),
        '/HalamanBeritaadmin': (BuildContext context) =>
            new HalamanBeritaadmin(),
        '/FormBeritaDashbord': (BuildContext context) =>
            new FormBeritaDashbord(),
        '/DetailBerita': (BuildContext context) => new DetailBerita(),
      },
      home: SplashScreenPage(),
    ),
  );
}
