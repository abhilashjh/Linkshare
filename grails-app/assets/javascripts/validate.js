/**
 * Created by abhilash on 30/3/17.
 */
var count;
$(document).ready(function () {
    k(".errorbox").live('input', function () {
        $(this).removeClass('errorbox');
    });
});

function emailValidator(emailObj){
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if(filter.test($(emailObj).val())){
        return true;
    }
    error.showError(emailObj, "Please enter a valid Email ID.")
    return false;
}

function validateAllFields(fieldId){
    $('.w2ui-tag ').hide();
    count = 0;
    var errorField;
    $(fieldId).find('input[mandatory="1"],select[mandatory="1"]').each(function () {
        var $this = $(this)
        if ($($this)[0].type == "select-one"){
            if($($this[0]).find('option:selected')[0].value.trim().length == 0){
                $this.addClass('errorbox');
                if(count == 0){
                    $this.focus();
                    errorField = $this[0];
                }
                count++;
            }
        }
        else if($this.val().trim().length == 0){
            $this.addClass('errorbox');
            if(count == 0){
                $this.focus();
                errorField = $this[0];
            }
            count++;
        }
    });
    if(count > 1){
        toastr.error('Please enter all the mandatory information.')
    }
    else if(count == 1){
        validateSingleField(errorField);
    }
    else{
        return true;
    }
    return false;
}

function validateSingleField(errorField) {
    error.showError(errorField, $(errorField).attr('errorMessage'))
}

var error = {
    showError: function (obj, message) {
        try {
            $(obj).addClass('errorbox');
            if (message.length > 0) {
                $(obj).w2tag(message);
                if (message.length > 150) {
                    $('.w2ui-tag').addClass('w2ui-tag-length');
                }
            }
        } catch (e) {
            console.log(e.message);
        }

    },
    hideError: function (obj) {
        try {
            $(obj).removeClass('errorbox');
            $(obj).w2tag('');
        }
        catch (e) {
            console.log(e.message);
        }

    }
}