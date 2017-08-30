$(function(){
    if ($("#client-new").length || $("#client-edit").length) {
        if ($("#client-new").length) {
            if ($("#set_birthday_year").val().length) {
                $("#client_birthday_1i").val($("#set_birthday_year").val())
                $("#client_birthday_2i").val($("#set_birthday_month").val())
                $("#client_birthday_3i").val($("#set_birthday_day").val())
            } else {
                $("#client_birthday_1i").val(1990)
            }
        }
        if ($("#client-edit").length) {
            $("#client_birthday_1i").val($("#set_birthday_year").val())
            $("#client_birthday_2i").val($("#set_birthday_month").val())
            $("#client_birthday_3i").val($("#set_birthday_day").val())
        }
        //動機プルダウン変更時のアクション
        $("#client_douki").change(function () {
            //紹介の場合
            if ($("#client_douki").val() == 4) {
                $("#form-shoukaisha").css('display', 'block');
                $("#form-douki-etc").css('display', 'none')
            //その他の場合
            } else if ($("#client_douki").val() == 6) {
                $("#form-shoukaisha").css('display', 'none');
                $("#form-douki-etc").css('display', 'block');
            } else {
                $("#form-shoukaisha").css('display', 'none');
                $("#form-douki-etc").css('display', 'none');
            }
        });
    }
});