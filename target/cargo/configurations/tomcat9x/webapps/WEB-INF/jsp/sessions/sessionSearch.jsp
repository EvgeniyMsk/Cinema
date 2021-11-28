<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: qsymond
  Date: 24.11.2021
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <style>
        * {box-sizing: border-box;}
        body{margin: 0;}
        div {padding: 30px 0}
        form {
            position: relative;
            width: 300px;
            margin: 0 auto;
        }
        .d1 {background: #A3D0C3;}
        .d1 input {
            width: 100%;
            height: 42px;
            padding-left: 10px;
            border: 2px solid #7BA7AB;
            border-radius: 5px;
            outline: none;
            background: #F9F0DA;
            color: #9E9C9C;
        }
    </style>
</head>
<body>

<div class="col" id="main">
    <div id="count">Найдено записей: </div>
    <div class="d1">
    <form>
        <input type="text" id="search" placeholder="Введите поисковый запрос" style="width: 100%">
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
                            const td4 = tr.insertCell();
                            const td5 = tr.insertCell();
                            const td6 = tr.insertCell();
                            td1.appendChild(document.createTextNode('Дата'));
                            td2.appendChild(document.createTextNode('Кинозал'));
                            td3.appendChild(document.createTextNode('Фильм'));
                            td4.appendChild(document.createTextNode('Цена'));
                            td5.appendChild(document.createTextNode('Ссылка'));
                            td6.appendChild(document.createTextNode('Постер'));
                            for (var i = 0; i < msg.length; i++)
                            {
                                var trr = table.insertRow();
                                var tdd1 = trr.insertCell();
                                var tdd2 = trr.insertCell();
                                var tdd3 = trr.insertCell();
                                var tdd4 = trr.insertCell();
                                var tdd5 = trr.insertCell();
                                var tdd6 = trr.insertCell();
                                var href = document.createElement("a");
                                var image = document.createElement("img");
                                href.className='link-success';
                                href.href = "/sessions/" + msg[i].id;
                                href.innerText = msg[i].movie.title;
                                if (msg[i].movie.hasImage === true)
                                    image.src = 'data:image/jpeg;base64,' + msg[i].movie.imageBytes;
                                else
                                    image.src = '${pageContext.request.contextPath}/img/image.png';
                                image.style.width = '150px';
                                image.style.height = '100px';
                                tdd1.appendChild(document.createTextNode(msg[i].date.year+ '-' +msg[i].date.monthValue + '-' + msg[i].date.dayOfMonth
                                    + ' ' + msg[i].date.hour + ':' + msg[i].date.minute));
                                tdd2.appendChild(document.createTextNode(msg[i].movieHall.id));
                                tdd3.appendChild(document.createTextNode(msg[i].movie.title));
                                tdd4.appendChild(document.createTextNode(msg[i].ticketCost));
                                tdd5.appendChild(href);
                                tdd6.appendChild(image);
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
</div>
</body>
</html>
