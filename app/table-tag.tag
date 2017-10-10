<table-tag>
  <div class="container">
    <div class="row">

      <div class="col-md-12">
        <h4>Datatable</h4>
        <div class="table-responsive">

          <input type='hidden' id='current_page' />
          <input type='hidden' id='show_per_page' />
          <table id="mytable" class="table table-bordred table-striped">

            <thead>

              <!-- <th><input type="checkbox" id="checkall" /></th> -->
              <th>Title</th>
              <th>Content</th>
              <th>create at</th>
              <th>update at</th>
              <th>Edit</th>
              <th>Delete</th>
            </thead>
            <tbody>
              <tr each={doc in todos}>
                <!-- <td><input type="checkbox" class="checkthis" /></td> -->
                <!-- <td>{doc.id}</td> -->
                <td>{doc.title}</td>
                <td>{doc.content}</td>
                <td>{doc.created_at}</td>
                <td>{doc.updated_at}</td>
                <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs open-edit" data-title="Edit" data-toggle="modal" onclick={edit} data-test="test"><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" onclick={delete} ><span class="glyphicon glyphicon-trash"></span></button></p></td>
              </tr>
            </tbody>

          </table>
          <div class="paging"></div>
          <div class="clearfix"></div>
          <div class="pagination" id="page_navigation"></div>
          <!-- <ul class="pagination pull-right">
            <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
          </ul> -->

        </div>

      </div>
    </div>
  </div>


  <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align">Edit Your Detail</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Title</label>
            <input class="form-control " type="text" placeholder="" id="edit-title" value="">
          </div>
          <div class="form-group">
            <label>Content</label>
            <textarea class="form-control " rows="4" type="text" placeholder="" id="edit-content" value=""> </textarea>
          </div>
          <div class="form-group">
            <label>Create At</label>
            <input class="form-control " type="text" placeholder="" id="created_at" value="">
          </div>
          <div class="form-group">
            <label>Update At</label>
            <input class="form-control " type="text" placeholder="" id="updated_at" value="">
          </div>
        </div>
        <div class="modal-footer ">
          <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>



  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align">Delete this entry</h4>
          <span class="hide" id="id_entry"></span>
        </div>
        <div class="modal-body">

          <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>

        </div>
        <div class="modal-footer ">
          <button type="button" class="btn btn-success" onclick={deleteArticle} ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <script>
  var self = this;
  this.todos = []
  this.on('mount', function(){
   self.todos = self.allTodos()
   self.update()
  })

  allTodos(){
  $.ajax({
       url: 'https://rest-api.r10.co/articles',
       type: 'GET',
       contentType: "application/json; charset=utf-8",
       timeout: 60000,
       crossDomain: true,
       traditional: true,
       complete: function(data) {
         //hideLoader();
        //  this.docs = data;
       },
       success: function(data) {
        //  console.log(data);
         if(data.status === true){
            self.todos = data.data;
            self.update();
            console.log(self.todos);
         }
       },
   });
 }
  var modal = document.getElementById('edit');

  this.edit = function (e){
    e.preventDefault();
    $('#edit').modal('toggle');
    $('#edit-title').val(this.doc.title);
    $('#edit-content').val(this.doc.content);
    $('#created_at').val(this.doc.created_at);
    $('#updated_at').val(this.doc.updated_at);
  }

  this.delete = function (e){
    $('#delete').modal('toggle');
    $('#id_entry').val(this.docs.id);
  }

  this.deleteArticle = function (){
    var a = $('#id').val();
    $.ajax({
      url: 'articles/'+ this.docs.id,
      type: 'POST',
      success: function (data) {

      },
      error: function (data) {

      }
    });
  }

  // this.docss = {
  //   "status": true,
  //   "offset": 0,
  //   "limit": 25,
  //   "total": 4,
  //   "data": [{
  //     "id": 5,
  //     "title": "Perbaikan Tahap Dua Fokus pada Keselamatan Stabilitas",
  //     "content": "Perbaikan Jembatan Cisomang tahap kedua difokuskan pada peningkatan faktor keselamatan stabilitas. Hal itu dilakukan melalui penambahan jangkar tanah untuk menahan beban lateral dan fondasi berbentuk tabung (bored pile).",
  //     "created_at": "2017-04-05 01:28:12",
  //     "updated_at": "2017-04-05 01:28:12"
  //   }, {
  //     "id": 2,
  //     "title": "Sisi Positif di Balik Absennya Messi",
  //     "content": "Bintang sepakbola Argentina itu terpaksa hanya menyaksikan rekan-rekannya dari bangku penonton di pertandingan itu. Messi terkena sanksi skorsing otomatis usai menerima kartu kuning kelima di musim ini dalam pertandingan melawan Valencia sebelum jeda internasional",
  //     "created_at": "2017-04-05 00:32:29",
  //     "updated_at": "2017-04-05 00:32:29"
  //   }, {
  //     "id": 3,
  //     "title": "Warna-warni Jam Tangan Pintar Garmin",
  //     "content": "Garmin merilis seri Fenix 5 yang hadir dengan berbagai ukuran dan pilihan strap warna-warni. Seri ini sudah punya fitur GPS sebagai penunjang kegiatan outdoor.",
  //     "created_at": "2017-04-05 00:32:29",
  //     "updated_at": "2017-04-05 00:32:29"
  //   }, {
  //     "id": 4,
  //     "title": "iPhone 7 Kembali ke Indonesia",
  //     "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
  //     "created_at": "2017-04-04 18:21:28",
  //     "updated_at": "2017-04-04 18:21:28"
  //   }, {
  //     "id": 5,
  //     "title": "iPhone 7 Kembali ke Indonesia",
  //     "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
  //     "created_at": "2017-04-04 18:21:28",
  //     "updated_at": "2017-04-04 18:21:28"
  //   }, {
  //     "id": 6,
  //     "title": "iPhone 7 Kembali ke Indonesia",
  //     "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
  //     "created_at": "2017-04-04 18:21:28",
  //     "updated_at": "2017-04-04 18:21:28"
  //   }, {
  //     "id": 7,
  //     "title": "iPhone 7 Kembali ke Indonesia",
  //     "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
  //     "created_at": "2017-04-04 18:21:28",
  //     "updated_at": "2017-04-04 18:21:28"
  //   }, {
  //     "id": 8,
  //     "title": "iPhone 7 Kembali ke Indonesia",
  //     "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
  //     "created_at": "2017-04-04 18:21:28",
  //     "updated_at": "2017-04-04 18:21:28"
  //   }, {
  //     "id": 9,
  //     "title": "iPhone 7 Kembali ke Indonesia",
  //     "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
  //     "created_at": "2017-04-04 18:21:28",
  //     "updated_at": "2017-04-04 18:21:28"
  //   }]
  // };

  $('#edit').click( function (){
    alert();
  });
  </script>
</table-tag>
