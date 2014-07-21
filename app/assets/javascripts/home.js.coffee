$(document).ready (() ->
    $('#regis-div').hide()

    $('#register-btn').click(() ->
        $('#login-div').hide()
        $('#regis-div').show()
    )

    $('#login-btn').click(() ->
        $('#login-div').show()
        $('#regis-div').hide()
    )

)
