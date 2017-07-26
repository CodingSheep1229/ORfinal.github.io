<!DOCTYPE html>
<html lang="en">
<?PHP
    $filer = fopen("history.txt", "r");
    $times = fread($filer, filesize("history.txt"));
    fclose($filer);
    $file = fopen("history.txt","w"); //開啟檔案
    fwrite($file,$times+1);
    fclose($file);
?>
<head>
    
    <meta charset="UTF-8">
    <title>鄭揚</title>
    <link rel="stylesheet" type="text/css" href="my_page_css.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>

<body>
<div class="row">
    <div class="col-lg-4">
        <p id='visit'>Welcome, you're the <?php echo $times?>th visitor of this website!!! </p>
    </div>
    <div class="col-lg-4">
            <center id="topic">MY WEBBO</center>
            <center id="beep">beep beep i'm a sheep</center>
            <center><img id="me" class="img-circle" src="img/me.jpg" align="center">
            </center>
        
    </div>
    <div class="col-lg-4">

        <div class="panel panel-default" id='ABOUT'>
            <div class="panel-heading">
                <center class="panel-title" id='about_title'>ABOUT ME</center>
            </div>
            <div class="panel-body" id= 'about_body'>
                    <p>學歷：新竹高中、台大資管</p>
                    <br>
                    <p>興趣：合唱、Acapella</p>
                    <br>
                    <p>感情狀態：單身QQ</p>
                    <br>
                    <p>技能：中文、英文、Python、C++</p>
            </div>
        </div>
    </div>
</div>
<div class="row">
<div class="col-lg-8"></div>
<div id='doggo'>
</div>
</div>


<script src="my_page_js.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>

