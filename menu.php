<?php
include "proses/connect.php";
$query = mysqli_query($conn, "SELECT * FROM tb_daftar_paket");
while ($record = mysqli_fetch_array($query)) {
    $result[] = $record;
}
?>

<div class="col-lg-9 mt-2">

    <?php
            if (empty($result)) {
                echo "Data Menu Makanan atau Minuman tidak ada";
            } else {
            foreach ($result as $row) {
            
            ?>
    <!--Modal Edit-->
    <div class="modal fade" id="ModalEdit<?php echo $row['id_paket'] ?>" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-fullscreen-md-down">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Paket Laundry</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="needs-validation" novalidate action="proses/proses_edit_paket.php" method="post"
                        enctype="multipart/form-data">
                        <input type="hidden" value="<?php echo $row['id_paket'] ?>" name="id_paket">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="input-group mb-3">
                                    <input type="file" class="form-control  py-3" id="uploadFoto"
                                        placeholder="your name" name="foto" required>
                                    <label class="input-group-text" for="uploadFoto">Upload Foto Paket</label>
                                    <div class="invalid-feedback">
                                        Masukkan File Foto Paket
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Nama Paket"
                                        name="nama_paket" required value="<?php echo $row['nama_paket'] ?>">
                                    <label for="floatingInput">Nama Paket</label>
                                    <div class="invalid-feedback">
                                        Masukkan Nama Paket
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" placeholder="keterangan"
                                        name="keterangan" value="<?php echo $row['keterangan'] ?>">
                                    <label for="floatingPassword">Keterangan</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-floating mb-3">
                                    <input type="number" class="form-control" id="floatingInput" placeholder="harga"
                                        name="harga" required value="<?php echo $row['harga'] ?>">
                                    <label for="floatingInput">Harga</label>
                                    <div class="invalid-feedback">
                                        Masukkan Harga Paket
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" name="input_menu_validate" value="12345">Save
                                changes</button>
                        </div>
                </div>

                </form>
            </div>
        </div>
    </div>
    <!--Akhir Modal Edit-->


    <?php
            }
            ?>

    <!-- Card -->
    <div class="card">
        <div class="card-header">
            Halaman Paket Laundry
        </div>
        <!-- Card Row -->
        <div class="row d-flex justify-content-around py-4">
            <?php
            function rupiah($angka){
	
                $hasil_rupiah = "Rp " . number_format($angka,2,',','.');
                return $hasil_rupiah;
             
            }
                $no = 1;
                foreach ($result as $row) {
             ?>
            <div class="col-3">
                <div class="card-group">
                    <div class="card">
                        <img src="assets/img/<?php echo $row['foto'] ?>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><b><?php echo $row['nama_paket'] ?></b></h5>
                            <h6 class="card-subtitle mb-2"><?php echo rupiah(intval($row['harga'])) ?></h6>
                            <p class="card-text"><?php echo $row['keterangan'] ?></p>
                            <button class="btn btn-warning btn-sm" data-bs-toggle="modal"
                                data-bs-target="#ModalEdit<?php echo $row['id_paket'] ?>">Edit</button>
                        </div>
                    </div>
                </div>
            </div>
            <?php
            }
            ?>
        </div>
        <!-- Card Row End -->
    </div>
    <!-- Card End -->
    <?php
            }
            ?>
</div>