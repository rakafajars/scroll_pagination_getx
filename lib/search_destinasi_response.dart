class SearchDestinasiResponse {
  String? status;
  String? message;
  List<DataDestinasi>? data;
  Pagination? pagination;
  String? sort;
  String? filter;

  SearchDestinasiResponse({
    this.status,
    this.message,
    this.data,
    this.pagination,
    this.sort,
    this.filter,
  });

  factory SearchDestinasiResponse.fromJson(Map<String, dynamic> json) =>
      SearchDestinasiResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DataDestinasi>.from(
                json["data"]!.map(
                  (x) => DataDestinasi.fromJson(x),
                ),
              ),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        sort: json["sort"],
        filter: json["filter"],
      );
}

class DataDestinasi {
  String? id;
  String? nama;
  String? urlMedia;
  String? provinsi;
  String? kota;
  int? visitCount;
  Kategori? kategori;

  DataDestinasi({
    this.id,
    this.nama,
    this.urlMedia,
    this.provinsi,
    this.kota,
    this.visitCount,
    this.kategori,
  });

  factory DataDestinasi.fromJson(Map<String, dynamic> json) => DataDestinasi(
        id: json["id"],
        nama: json["nama"],
        urlMedia: json["url_media"],
        provinsi: json["provinsi"],
        kota: json["kota"],
        visitCount: json["visit_count"],
        kategori: json["kategori"] == null
            ? null
            : Kategori.fromJson(json["kategori"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "url_media": urlMedia,
        "provinsi": provinsi,
        "kota": kota,
        "visit_count": visitCount,
        "kategori": kategori?.toJson(),
      };
}

class Kategori {
  String? idKategori;
  String? nama;

  Kategori({
    this.idKategori,
    this.nama,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        idKategori: json["id_kategori"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id_kategori": idKategori,
        "nama": nama,
      };
}

class Pagination {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Pagination({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "current_page": currentPage,
        "last_page": lastPage,
      };
}
