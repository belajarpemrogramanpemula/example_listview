import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './produkmodel.dart';

class Produk extends StatefulWidget {
  @override
  _ProdukState createState() => new _ProdukState();
}

class _ProdukState extends State<Produk> {
  final String sUrl = "https://mysimrs.com/api/";
  List<ProdukModel> listproduk;

  @override
  void initState() {
    super.initState();
  }

  Future<List<ProdukModel>> _fetchData() async {
    var params = "produk.php";
    try {
      var jsonResponse = await http.get(sUrl + params);
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

        listproduk = jsonItems.map<ProdukModel>((json) {
          return ProdukModel.fromJson(json);
        }).toList();
      }
    } catch (e) {}
    return listproduk;
  }

  Future<Null> _refresh() {
    return _fetchData().then((_listproduk) {
      setState(() => listproduk = _listproduk);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: Text(' Data Produk'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<ProdukModel>>(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Container(
              margin: EdgeInsets.only(bottom: 0.0),
              child: ListView(
                padding: EdgeInsets.only(bottom: 160.0),
                children: snapshot.data
                    .map(
                      (_data) => Column(children: <Widget>[
                        Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.perm_media, size: 50),
                                title: Text(_data.nama),
                                subtitle:
                                    Text(_data.harga + ' / ' + _data.satuan),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
