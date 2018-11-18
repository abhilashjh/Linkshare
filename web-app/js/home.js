/**
 * Created by abhilash on 17/4/17.
 */
$(document).ready(function () {
    $('#btnCreteTopic').click(function(){
        if (validateAllFields('#modalTopicCreate')) {
            try{
            $.ajax({
                url: $('#hdnBaseUrl').val().trim() + '/Topic/createTopic',
                type: 'POST',
                data: {
                    topicName: $('#txtTopicName').val(),
                    visibility: $('#ddlVisibility option:selected').val()
                },
                success: function (data) {

                },
                error: function () {

                }

            });
            }
            catch (e){
                console.log(e);
            }
        }
    });
});