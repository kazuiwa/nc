$(function(){
    var domainData = [
        'docomo.ne.jp',
        'mopera.net',
        'softbank.ne.jp',
        'vodafone.ne.jp',
        'disney.ne.jp',
        'i.softbank.jp',
        'ezweb.ne.jp',
        'biz.ezweb.ne.jp',
        'augps.ezweb.ne.jp',
        'uqmobile.jp',
        'ido.ne.jp',
        'emnet.ne.jp',
        'emobile.ne.jp',
        'emobile-s.ne.jp',
        'ymobile1.ne.jp',
        'ymobile.ne.jp',
        'yahoo.ne.jp',
        'pdx.ne.jp',
        'willcom.com',
        'wcm.ne.jp',
        'y-mobile.ne.jp',
        'kawaii.com',
        'yahoo.co.jp',
        'gmail.com',
        'outlook.jp',
        'outlook.com',
        'hotmail.co.jp',
        'live.jp',
        'mail.ru',
        'zoho.com',
        'excite.co.jp',
        'aol.jp',
        'goo.jp',
        'mail.goo.ne.jp',
        'inter7.jp'
    ];

    var supportInput = '#email'; // autocompleteを適用する要素
    var domains = []; // @より前を含めたドメインリストを格納
    var currentVal; // 入力している内容を取得
    var atindex = 0; // @より前の文字数取得
    var mailname; // @より前の文字列取得
    var autocompleteFlag = false; // autocompleteが構築されているかの管理
    var minDomain = 1; // @以降何文字目まで入力で入力補完を表示するか

    $(function () {
        $(supportInput).on('keyup', function () {
            currentVal = $(supportInput).val();
            // @が含まれている場合
            if (currentVal.match(/@/)) {
                // @を追加してすぐの場合
                if (!autocompleteFlag) {
                    autocompleteFlag = true;
                    // autocompleteの構築
                    autocompleteSet(supportInput);

                    // @が追加されて2回目以降の場合
                } else {
                    // @より前半が変更された場合
                    if (currentVal.indexOf('@') != atindex) {
                        // autocompleteを一旦破棄して再構築
                        $(supportInput).autocomplete('destroy');
                        autocompleteSet(supportInput);
                    }
                }

                // @が含まれていない場合
            } else {
                // @が削除されてすぐのとき
                if (autocompleteFlag) {
                    autocompleteFlag = false;
                    // autocompleteの破棄
                    $(supportInput).autocomplete('destroy');
                }
            }
        });
    });

    function autocompleteSet(target) {
        // @より前の文字数と文字列取得
        atindex = currentVal.indexOf('@');
        mailname = currentVal.slice(0, atindex);
        // @より前を含めたドメインリストの作成
        for (var i = 0; i < domainData.length; i++) {
            domains[i] = mailname + '@' + domainData[i];
        };

        // autocompleteの構築
        $(target).autocomplete({
            source: domains,
            minLength: atindex + 1 + minDomain
        });
    }
});