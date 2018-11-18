/**
 * Created by abhilash on 30/3/17.
 */

$(document).ready(function(){
    $('input[mandatory="1"],select[mandatory="1"]').each(function(){
        $(this).after("<span style='color:#c12e2a;padding-left:3px;font-size:20px;'>*</span>");
    });
});




