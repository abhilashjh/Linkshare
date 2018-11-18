/**
 * Created by abhilash on 28/3/17.
 */
$(document).ready(function () {
    // $('#btnLogin').click(function () {
    //     validateLogin();
    // })

    $('#btnRegister').click(function () {
        if (validateAllFields('#divRegister')) {
            if(!emailValidator('#txtEmail')){
                return false;
            }
            if($('#txtPassword').val() != $('#txtConfirmPass').val()){
                error.showError('#txtConfirmPass', 'The entered password and confirm password does not match.');
                return false;
            }
            var url = $('#hdnBaseUrl').val().trim()+'/Registration/customerRegistration';
            console.log(url);
            try {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        firstName: $('#txtFirstName').val(),
                        lastName: $('#txtLastName').val(),
                        email: $('#txtEmail').val(),
                        username: $('#txtUserName').val(),
                        password: $('#txtPassword').val()
                    },
                    success: function (data) {
                        if(data.Status==1){
                            toastr.success(data.Message);
                        }
                        else{
                            toastr.error(data.Message);
                        }

                    },
                    error: function (data) {
                        toastr.error("Error in request submitted");
                    }
                });
            }
            catch(e){
                console.log(e);
            }
        }
        return false;
    });

});

function validateLogin(){
    if(validateAllFields('#divLogin')){

        return true;
    }
    return false;
}

