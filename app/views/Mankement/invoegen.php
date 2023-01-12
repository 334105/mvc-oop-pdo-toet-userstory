<u><h1><?= $data['title'] ?></h1></u> 

<h1><?= $data['Kenteken'] ?> - <?= $data['Type'] ?></h1>


<form method="POST">
    <label for="mankement">Vul hier je mankement in:</label>
    <input type="text" name="mankement">
    <input type="hidden" name="carId" value="<?= $data['id'] ?>">
    <input type="submit" value="Voer in">
</form>