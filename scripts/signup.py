from applescript import asrun

defaults = dict(
    url="http://www.dev.tastingroom.com:5000/signup",
    email='olaf@sven.com',
    first_name="Jerry",
    last_name="Brown",
    street_address="1526 H St",
    city="Sacramento",
    state="CA",
    zip="95814",
    phone_number="703-828-7113",
    credit_card_number="4111111111111111",
    cvv="123",
    expiration_year="2019",
    password="asdfasdf",
)

ascript = '''
set jscriptPage1 to "

document.forms.signup_email.email.value =  '{email}';
document.getElementById('birthdate-month').selectedIndex = 3;
document.getElementById('birthdate-day').selectedIndex = 3;

document.getElementById('birthdate-year').selectedIndex = 11;

document.forms.signup_email.submit.click();
"

set jscriptPage2 to "
document.getElementById('shipping_first_name').value = '{first_name}';
document.getElementById('shipping_last_name').value = '{last_name}';
document.getElementById('shipping_street1').value = '{street_address}';
document.getElementById('shipping_city').value = '{city}';
document.getElementById('shipping_zip_code').value = '{zip}';
document.getElementById('shipping_phone').value = '{phone_number}';

document.getElementById('shipping_state').value = '{state}';

document.getElementById('submit').click();
"

set jscriptPage3 to "
document.getElementById('credit_card_number').value = '{credit_card_number}';
document.getElementById('credit_card_cvv').value = '{cvv}';
document.getElementById('password').value = '{password}';

document.getElementById('credit_card_exp_year').value = '{expiration_year}';

document.getElementById('submit').click();
"

tell application "Google Chrome"
    tell window 1
            tell active tab
                    open location "{url}"
            end tell
    end tell

    delay 1
    tell window 1
            tell active tab
                    execute javascript jscriptPage1
            end tell
    end tell
    delay 2
    tell window 1
            tell active tab
                    execute javascript jscriptPage2
            end tell
    end tell
    delay 2
    tell window 1
            tell active tab
                    execute javascript jscriptPage3
            end tell
    end tell
    end tell
'''.format(**defaults)

asrun(ascript)
