<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="<c:url value="/js/jquery-1.9.1.min.js" />"></script>

    <script type="text/javascript" charset="utf-8">

        $(document).ready(function() {

                $.ajax({
                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                    type: "GET",
                    url: "/restapp/rest/service/liststates",
                    //data: 'cityName='+ $('#cityName').val(),
                    dataType:"json",
                    success: function(json) {
                        $.each(json, function(i, value) {

                            console.log("Antes do Ajax cidade");

                            $('#state').append($('<option>').text(value.uf).attr('value', value.uf));

                            $('#state').change(function() {

                                $('#city').empty();

                                $.ajax({
                                    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                                    type: "GET",
                                    url: "/restapp/rest/service/listcitiesbystate/",
                                    data: 'uf='+ $('#state').val(),
                                    dataType:"json",
                                    success: function(json) {
                                        $.each(json, function(i, value) {
                                            console.log("Retorno do Ajax cidade");
                                            $('#city').append($('<option>').text(value.nome).attr('value', value.nome));
                                        });
                                    }
                                });

                        });


                        });
                    }
                });

        });

    </script>

</head>
<body>
         <form action="" id="test">

          <h2>Rest Service</h2>

            <select id="state" name="state"></select>
              <br />

            <select id="city" name="city"></select>

          </form>
</body>
</html>