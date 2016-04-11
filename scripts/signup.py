import os
from random import choice

from applescript import asrun
from pyrsistent import m

CS_PEOPLE_PATH = os.path.join(os.path.expanduser('~'), 'dotfiles/scripts/names/computer_scientists.txt')
ADJ_PATH = os.path.join(os.path.expanduser('~'), 'dotfiles/scripts/names/adjectives.txt')

defaults = m(
    url="http://www.dev.tastingroom.com:5000/signup",
    email='example@example.com',
    first_name="Jerry",
    last_name="Brown",
    street_address="1526 H St",
    city="Sacramento",
    state="CA",
    zip_code="95814",
    phone_number="703-818-7223",
    credit_card_number="4111111111111111",
    cvv="123",
    expiration_year="2019",
    password="asdfasdf",
)


def get_random_name():
    with open(CS_PEOPLE_PATH) as f:
        names = [name.strip() for name in f.readlines()]
        return choice(names)


def get_random_adjective():
    with open(ADJ_PATH) as f:
        adjectives = [adj.strip() for adj in f.readlines()]
        return choice(adjectives)


def make_email(first_name, last_name, adjective):
    params = dict(adj=adjective, first=first_name, last=last_name)
    return '{adj}.{first}.{last}@example.com'.format(**params)


def build_random_person():
    names = get_random_name().split()
    adjective = get_random_adjective()
    first_name = names[0]
    last_name = ' '.join(names[1:])
    email = make_email(first_name, last_name, adjective)
    attributes = m(
        email=email,
        first_name=first_name,
        last_name=last_name,
    )

    return attributes


attributes = defaults.update(build_random_person())

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
document.getElementById('shipping_zip_code').value = '{zip_code}';
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
    delay 1
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
'''.format(**attributes)
asrun(ascript)
print ascript
