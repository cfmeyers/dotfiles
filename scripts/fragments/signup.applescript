set jscriptPage1 to "
function fillInForm(){
    document.forms.signup_email.email.value =  '{{person.email}}';
    document.getElementById('birthdate-month').selectedIndex = 3;
    document.getElementById('birthdate-day').selectedIndex = 3;
    document.getElementById('birthdate-year').selectedIndex = 11;
    submit()
}

function submit(){
    document.forms.signup_email.submit.click();
}
fillInForm()
"

set jscriptPage2 to "
function fillInForm(){
    document.getElementById('shipping_first_name').value = '{{person.name.first}}';
    document.getElementById('shipping_last_name').value = '{{person.name.last}}';
    document.getElementById('shipping_street1').value = '{{address.street_address}}';
    document.getElementById('shipping_city').value = '{{address.city}}';
    document.getElementById('shipping_zip_code').value = '{{address.zip_code}}';
    document.getElementById('shipping_phone').value = '{{phone_number}}';
    document.getElementById('shipping_state').value = '{{address.state}}';
    submit()
}

function submit(){
    document.getElementById('submit').click();
}
fillInForm()
"

set jscriptPage3 to "
function fillInForm(){
    document.getElementById('credit_card_number').value = '{{credit_card_number}}';
    document.getElementById('credit_card_cvv').value = '{{credit_card_cvv}}';
    document.getElementById('password').value = '{{password}}';
    document.getElementById('credit_card_exp_year').value = '{{expiration_year}}';

    submit()
}

function submit(){
    document.getElementById('submit').click();
}

fillInForm()
"

tell application "Google Chrome"
    tell window 1
            tell active tab
                    open location "{{url}}"
            end tell
    end tell

    delay 3
    tell window 1
            tell active tab
                    execute javascript jscriptPage1
            end tell
    end tell
    delay 3
    tell window 1
            tell active tab
                    execute javascript jscriptPage2
            end tell
    end tell
    delay 3
    tell window 1
            tell active tab
                    execute javascript jscriptPage3
            end tell
    end tell
end tell
