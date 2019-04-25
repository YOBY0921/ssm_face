
    function changeSound(elem) {
        var sound = $("#" + elem).val();
        $("#" + elem).parent("div").prev("div").children("input").val(sound);
    }
    
	function change(elem) {
        var sound = $("input[name=" + elem + "]").val();
        $("#" + elem).val(sound);
    }
