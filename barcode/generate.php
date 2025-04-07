<?php
$num = $_POST['number'];
$barcode = $_POST['barcode'];
$count = 1;
while ($count <= $num) {
    echo '<img alt="' . $barcode . '" src="barcode/barcode.php?codetype=Code39&size=40&text=' . $barcode . '&print=true" />';
    $count++;
}
