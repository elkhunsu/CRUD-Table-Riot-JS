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
              <th>No</th>
              <th>Title</th>
              <th>Content</th>
              <th>create at</th>
              <th>update at</th>
              <th>Edit</th>
              <th>Delete</th>
            </thead>
            <tbody>
              <!-- <tr each={doc, i in filter(articles)}><td>{ (page * pagesize) + i + 1 }. -->
              <tr each={doc in articles}>
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
          <div id="pagination" class="dataTables_paginate paging_simple_numbers">
    <ul class="pagination">
        <li each={pageList} class="paginate_button {disabled:!enabled} {active:selected}">
            <a href="javascript:void(0)" onclick={changePage}>{name}</a>
        </li>
    </ul>
</div>

          <ul class="pagination pull-right">
            <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
          </ul>

        </div>

      </div>
    </div>
    <div class="row">
      <div class="col-md-12 text-right">
          <button class="btn btn-primary" data-title="create-modal" data-toggle="modal" data-target="#create-modal">Create</button>
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
          <button type="button" class="btn btn-warning btn-lg" style="width: 100%;" onclick="{update}"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
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

  <div class="modal fade" id="create-modal" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align">Create Article</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Title</label>
            <input class="form-control " type="text" placeholder="" id="create-title" value="">
          </div>
          <div class="form-group">
            <label>Content</label>
            <textarea class="form-control " rows="4" type="text" placeholder="" id="create-content" value=""> </textarea>
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
          <button type="button" class="btn btn-warning btn-lg" style="width: 100%;" onclick="{create}"><span class="glyphicon glyphicon-ok-sign"></span> Submit</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>

  <div>
  <script>
  // this.page = 0
  // this.pagesize = 4
  // this.array = []
  // first() {
  //   this.page = 0
  // }
  // prev() {
  //   console.log('prev')
  //   if (this.page > 0) {
  //     this.page--
  //   }
  // }
  // next() {
  //   console.log('next', this.page, (this.array.length / this.pagesize) - 1, this.array.length)
  //   if (this.page < (this.array.length / this.pagesize) - 1) {
  //     this.page++
  //   }
  // }
  // last() {
  //   this.page = Math.ceil(this.array.length / this.pagesize) - 1
  // }
  // filter(array) {
  //   return array.slice(this.page * this.pagesize, (this.page + 1) * this.pagesize)
  // }

  var self = this;
  this.todos = []
  this.on('mount', function(){
   self.articles = self.allArticles()
   self.update()
  })

  allArticles(){
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
            self.articles = data.data;
            self.update();
            console.log(self.articles);
         }
       },
   });
 }
  var modal = document.getElementById('edit');

  this.edit = function (e){
    e.preventDefault();
    var id = this.doc.id;
    $('#edit').modal('toggle');
    $.ajax({
      url: 'https://rest-api.r10.co/articles/' + id,
      type: 'GET',
      contentType: "application/json; charset=utf-8",
      timeout: 60000,
      crossDomain: true,
      traditional: true,
      success: function(data) {
        console.log(data);
        if(data.status === true){
          $('#edit-title').val(data.data.title);
          $('#edit-content').val(data.data.content);
          $('#created_at').val(data.data.created_at);
          $('#updated_at').val(data.data.updated_at);
        }
      },
    });
  }

  this.update = function(e){
    e.preventDefault();
    var dataPost = {};
    dataPost.title = $('#edit-title').val(data.data.title);
    dataPost.content = $('#edit-content').val(data.data.content);
    dataPost.created_at = $('#created_at').val(data.data.created_at);
    dataPost.updated_at = $('#updated_at').val(data.data.updated_at);

    $.ajax({
      url: 'https://rest-api.r10.co/articles/' + id,
      type: 'PUT',
      contentType: "application/json; charset=utf-8",
      timeout: 60000,
      crossDomain: true,
      traditional: true,
      data: dataPost,
      success: function(data) {
        console.log(data);
      },
    });
  }

  this.delete = function (e){
    $('#delete').modal('toggle');
    $('#id_entry').val(this.docs.id);
  }

  this.deleteArticle = function (){
    var a = $('#id').val();
    $.ajax({
      url: 'https://rest-api.r10.co/articles/'+ this.docs.id,
      type: 'POST',
      success: function (data) {

      },
      error: function (data) {

      }
    });
  }

  this.create = function (e){
    e.preventDefault();
    var dataPost = {};
    $('#edit-title').val(data.data.title);
    $('#edit-content').val(data.data.content);
    $('#created_at').val(data.data.created_at);
    $('#updated_at').val(data.data.updated_at);
    $.ajax({
      url: 'https://rest-api.r10.co/articles/',
      type: 'POST',
      contentType: "application/json; charset=utf-8",
      crossDomain: true,
      traditional: true,
      data: dataPost,
      success: function(data) {
        console.log(data);
        if(data.status === true){
        }
      },
    });
  }

//   var data = {
//     "status": true,
//     "offset": 0,
//     "limit": 25,
//     "total": 8,
//     "data": [{
//         "id": 5,
//         "title": "Perbaikan Tahap Dua Fokus pada Keselamatan Stabilitas",
//         "content": "Perbaikan Jembatan Cisomang tahap kedua difokuskan pada peningkatan faktor keselamatan stabilitas. Hal itu dilakukan melalui penambahan jangkar tanah untuk menahan beban lateral dan fondasi berbentuk tabung (bored pile).",
//         "created_at": "2017-04-05 01:28:12",
//         "updated_at": "2017-04-05 01:28:12"
//     }, {
//         "id": 2,
//         "title": "Sisi Positif di Balik Absennya Messi",
//         "content": "Bintang sepakbola Argentina itu terpaksa hanya menyaksikan rekan-rekannya dari bangku penonton di pertandingan itu. Messi terkena sanksi skorsing otomatis usai menerima kartu kuning kelima di musim ini dalam pertandingan melawan Valencia sebelum jeda internasional",
//         "created_at": "2017-04-05 00:32:29",
//         "updated_at": "2017-04-05 00:32:29"
//     }, {
//         "id": 3,
//         "title": "Warna-warni Jam Tangan Pintar Garmin",
//         "content": "Garmin merilis seri Fenix 5 yang hadir dengan berbagai ukuran dan pilihan strap warna-warni. Seri ini sudah punya fitur GPS sebagai penunjang kegiatan outdoor.",
//         "created_at": "2017-04-05 00:32:29",
//         "updated_at": "2017-04-05 00:32:29"
//     }, {
//         "id": 4,
//         "title": "iPhone 7 Kembali ke Indonesia",
//         "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
//         "created_at": "2017-04-04 18:21:28",
//         "updated_at": "2017-04-04 18:21:28"
//     }, {
//         "id": 5,
//         "title": "iPhone 7 Kembali ke Indonesia",
//         "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
//         "created_at": "2017-04-04 18:21:28",
//         "updated_at": "2017-04-04 18:21:28"
//     }, {
//         "id": 6,
//         "title": "iPhone 7 Kembali ke Indonesia",
//         "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
//         "created_at": "2017-04-04 18:21:28",
//         "updated_at": "2017-04-04 18:21:28"
//     }, {
//         "id": 7,
//         "title": "iPhone 7 Kembali ke Indonesia",
//         "content": "Ponsel pintar besutan Apple seri terbaru, yakni iPhone 7 dan iPhone 7 Plus, resmi menyambangi jaringan ritel resmi di Indonesia dengan penjualan serentak pada Jumat (31/3). Produk ini bisa tersedia setelah Apple lama terkendala terkait regulasi kandungan lokal",
//         "created_at": "2017-04-04 18:21:28",
//         "updated_at": "2017-04-04 18:21:28"
//     }]
// };
  </script>
</table-tag>
