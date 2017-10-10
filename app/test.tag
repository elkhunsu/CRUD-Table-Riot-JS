<sample>
  <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    /*padding: 8px;*/
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

  <h3>{ message }</h3>
<nav>
  <table if={ docs.status }>
    <th>Nama</th>
    <th>Kelas</th>
    <th>Create At</th>
    <th>Update At</th>
    <tr each={doc in docs.data}>

        <td>{doc.title}</td>
        <td>{doc.content}</td>
        <td>{doc.created_at}</td>
        <td>{doc.updated_at}</td>
    </tr>

    </table>
</nav>
<script>
    this.docs = {
    "status": true,
    "offset": 0,
    "limit": 25,
    "total": 4,
    "data": [{
        "id": 5,
        "title": "Perbaikan Tahap Dua Fokus pada Keselamatan Stabilitas",
        "content": "Perbaikan Jembatan Cisomang tahap kedua difokuskan pada peningkatan faktor keselamatan stabilitas. Hal itu dilakukan melalui penambahan jangkar tanah untuk menahan beban lateral dan fondasi berbentuk tabung (bored pile).",
        "created_at": "2017-04-05 01:28:12",
        "updated_at": "2017-04-05 01:28:12"
    }, {
        "id": 2,
        "title": "Sisi Positif di Balik Absennya Messi",
        "content": "Bintang sepakbola Argentina itu terpaksa hanya menyaksikan rekan-rekannya dari bangku penonton di pertandingan itu. Messi terkena sanksi skorsing otomatis usai menerima kartu kuning kelima di musim ini dalam pertandingan melawan Valencia sebelum jeda internasional",
        "created_at": "2017-04-05 00:32:29",
        "updated_at": "2017-04-05 00:32:29"
    }, {
        "id": 3,
        "title": "Warna-warni Jam Tangan Pintar Garmin",
        "content": "Garmin merilis seri Fenix 5 yang hadir dengan berbagai ukuran dan pilihan strap warna-warni. Seri ini sudah punya fitur GPS sebagai penunjang kegiatan outdoor.",
        "created_at": "2017-04-05 00:32:29",
        "updated_at": "2017-04-05 00:32:29"
    }, {
        "id": 4,
        "title": "iPhone 7 Kembali ke Indonesia",
        "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
        "created_at": "2017-04-04 18:21:28",
        "updated_at": "2017-04-04 18:21:28"
    }]
};
</script>


  <style>
    :scope { font-size: 2rem }
    h3 { color: #444 }
    ul { color: #999 }
  </style>
</sample>
