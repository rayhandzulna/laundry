<?php
include "connect.php";
$user = (isset($_POST['user'])) ? htmlentities($_POST['user']) : "";
$layanan = (isset($_POST['layanan'])) ? htmlentities($_POST['layanan']) : "";
$qty = (isset($_POST['qty'])) ? htmlentities($_POST['qty']) : "";
$notes = (isset($_POST['notes'])) ? htmlentities($_POST['notes']) : "";
$harga = (isset($_POST['harga'])) ? htmlentities($_POST['harga']) : "";


if (!empty($_POST['input_order_validate'])) {

        $query = mysqli_query($conn, "INSERT into tb_order (packet_id,user_id,total_price,qty,notes,status) values ('$layanan','$user','$harga','$qty','$notes',0)");
        if ($query) {
            $message = '<script>alert("Data berhasil dimasukkan")
        window.location="../order"</script>
        </script>';
        } else {
            $message = '<script>alert("Data gagal dimasukkan")</script>';
        }
}
echo $message;
?>