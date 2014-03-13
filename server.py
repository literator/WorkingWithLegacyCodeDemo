from bottle import route, run
import random

names = ["John", "Mark", "Bruce", "Jason", "Roy", "Ryan", "David", "Charles", "George", "Tomas", "Jeniffer", "Lisa",
         "Zoe", "Peter", "Leon", "Paul", "Frank"]
surnames = ["Johnson", "Jackson", "McBride", "Larson", "Phoenix", "Galaman", "Calahan", "Smith", "Jackman",
        "Underwood", "Stark", "Parker", "Forcyde"]
roles = {
    "admin": 2,
    "reporter": 1,
    "basic": 0
}


def generate_contacts(number_of_contacts=8):
    contacts = []
    for i in range(1, number_of_contacts):
        name = names[random.randint(0, len(names) - 1)]
        surname = surnames[random.randint(0, len(surnames) - 1)]
        role = roles[roles.keys()[random.randint(0, len(roles) - 1)]]
        contact = {
            "name": name,
            "surname": surname,
            "role": role
        }
        contacts.append(contact)
    return contacts


@route('/contacts')
def contacts():
    return {"response": generate_contacts()}


run(host='localhost', port=8080, debug=True)
