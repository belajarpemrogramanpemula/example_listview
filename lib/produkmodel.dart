class ProdukModel {
  final int id;
  final String nama;
  final String harga;
  final String satuan;

  ProdukModel({this.id, this.nama, this.harga, this.satuan});

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id: json['id'] as int,
      nama: json['nama'] as String,
      harga: json['harga'] as String,
      satuan: json['satuan'] as String,
    );
  }
}
