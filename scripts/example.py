import random
import sys
sys.path.append('/Users/colinmeyers/dev/')

from wrapplescript.models import Name, email_from_name, Person
from wrapplescript.wrapplescript import run_script
from wrapplescript.template import make_template
from wrapplescript.data import (COMPUTER_SCIENTIST_NAMES,
                                EXAMPLE_ADDRESSES_BY_STATE, ADJECTIVES)

try:
    state = sys.argv[1].upper()
except IndexError:
    state = 'NY'

try:
    site = sys.argv[2]
except IndexError:
    site = 'dev'

if site == 'dev':
    url = 'http://www.dev.tastingroom.com:5000/signup'
if site == 'qa':
    url = 'http://www.qa.tastingroom.com/signup'
if site == 'testo':
    url = 'http://www.tastingroom.com/signup'

name = random.choice(COMPUTER_SCIENTIST_NAMES)
adjective = random.choice(ADJECTIVES)
person = Person.from_name(name, email_from_name, modifier=adjective)
address = EXAMPLE_ADDRESSES_BY_STATE[state]
values = {
    'person': person,
    'address': address,
    'phone_number': '703-505-2219',
    'credit_card_number': '4111111111111111',
    'credit_card_cvv': '123',
    'expiration_year': '2020',
    'password': 'asdfasdf',
    'url':url,
}

script = make_template('/Users/colinmeyers/dotfiles/scripts/fragments/signup.applescript', **values)
run_script(script)

print script
print type(sys.argv)
print state
print sys.argv
