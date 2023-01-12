<u><h1><?= $data['title'] ?></h1></u> 

<h2>auto van instructeur: <?= $data['Naam'] ?></h2>
<h2>e-mail adres: <?= $data['Email'] ?></h2>
<h2>Kenteken auto: <?= $data['Kenteken'] ?> - <?= $data['Type'] ?></h2>

<table>
    <thead>
        <tr>
            <th>Datum</th>
            <th>Mankement</th>
        </tr>
    </thead>
    <tbody>
        <?php echo $data['rows']; ?>
    </tbody>
</table>

<a href= "<?= URLROOT . '/Mankementen/invoegen/' . $data['carId'] ?> ">Mankement toevoegen</a>