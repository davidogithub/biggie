from colorama import init
from termcolor import colored
import time

init()

def prgreen(state):
    print(colored(state, 'green'))

def prcyan(state):
    print(colored(state, 'cyan'))

def pryellow(state):
    print(colored(state, 'yellow'))


def prred(state):
        print(colored(state, 'red'))

def prmagenta(state):
    print(colored(state, 'magenta'))

while True:   
    prgreen("Hey friend, How're you?")
    time.sleep(.5)
    prcyan("Hey friend, How're you?")
    time.sleep(.5)
    pryellow("Hey friend, How're you?")
    time.sleep(.5)
    prred("Hey friend, How're you?")
    time.sleep(.5)
    prmagenta("Hey friend, How're you?")
    time.sleep(.5)







