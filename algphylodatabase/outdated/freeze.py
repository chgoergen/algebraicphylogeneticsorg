# https://frozen-flask.readthedocs.io/en/latest/
# https://www.youtube.com/watch?v=W09zIet38kI

from flask_frozen import Freezer
#from website import app
from smalltrees import app

freezer = Freezer(app)
url_default_functions={}
if __name__ == '__main__':
    freezer.freeze()