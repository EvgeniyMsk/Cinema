<#import "/spring.ftl" as spring/>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<header>
    <h1 class="header"><a class="header" href="/">На главную</a></h1>
</header>
<main>
<div class="col" id="main">

    <div class="d1">
    <form>
        <label id="count" style="background-color: black; color: white; font-size: xx-large">Найдено записей: </label>
        <input type="text" id="search" placeholder="Введите поисковый запрос" style="width: 30%; font-size: xx-large">
    </form>
    </div>
    <script>
        $(document).ready(function() {
            var $result = $('#search_box-result');
            var table = document.createElement("table");
            $('#search').on('keyup', function(){
                var search = $(this).val();
                if ((search !== '') && (search.length > 1)){
                    $.ajax({
                        type: "get",
                        url: "/sessions/search",
                        data: {'filmName': search},
                        success: function(msg){
                            var el = document.getElementById("count");
                            el.innerText='Найдено записей: ' + msg.length;
                            table.remove();
                            table = document.createElement("table");
                            table.style.width  = '40%';
                            table.style.border = '1px solid black';
                            table.style.textAlign = 'center';
                            table.style.margin = 'auto';
                            const tr = table.insertRow();
                            const td1 = tr.insertCell();
                            const td2 = tr.insertCell();
                            const td3 = tr.insertCell();
                            td1.appendChild(document.createTextNode('Дата'));
                            td2.appendChild(document.createTextNode('Фильм'));
                            td3.appendChild(document.createTextNode('Постер'));
                            table.border = '3';
                            // table.style = 'margin-left: auto; margin-right: auto; text-align: center; color: black; background-color: darkgrey;';
                            for (var i = 0; i < msg.length; i++)
                            {
                                var trr = table.insertRow();
                                var tdd1 = trr.insertCell();
                                var tdd2 = trr.insertCell();
                                var tdd3 = trr.insertCell();
                                var href = document.createElement("a");
                                var image = document.createElement("img");
                                href.className='link-success';
                                href.href = "/sessions/" + msg[i].id;
                                href.innerText = msg[i].movieDao.name;
                                image.src = '/films/' + msg[i].movieDao.id + '/image';
                                image.onerror = function () {
                                    image.src = '/img/image.png';
                                }
                                image.style.width = '150px';
                                image.style.height = '100px';
                                tdd1.appendChild(document.createTextNode(msg[i].dateTime));
                                tdd2.appendChild(href);
                                tdd3.appendChild(image);
                            }
                            document.getElementById("main").appendChild(table);
                            if(msg !== ''){
                                $result.fadeIn();
                            } else {
                                $result.fadeOut(100);
                            }
                        }
                    });
                } else {
                    $result.html('');
                    $result.fadeOut(100);
                }
            });

            $(document).on('click', function(e){
                if (!$(e.target).closest('.search_box').length){
                    $result.html('');
                    $result.fadeOut(100);
                }
            });
        });
    </script>
</div>
</main>
<footer>
    <h2 class="footer">Москва 2022</h2>
</footer>
</body>
</html>
