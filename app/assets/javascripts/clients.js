$(function(){
    if ($("#client-new").length || $("#client-edit").length) {
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