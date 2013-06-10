$(document).ready(function (){
  $('.inputGhost').on('change', function() {
    $("input[type=submit]").prop('disabled', $(this).val().length > 0);
  });


$(document).ready(function (){
    validate();
    $('#inputName, #inputEmail, #inputTel').change(validate);
});

function validate(){
    if ($('#inputName').val().length   >   0   &&
        $('#inputEmail').val().length  >   0   &&
        $('#inputTel').val().length    >   0) {
        $("input[type=submit]").prop("disabled", false);
    }
    else {
        $("input[type=submit]").prop("disabled", true);
    }
}

