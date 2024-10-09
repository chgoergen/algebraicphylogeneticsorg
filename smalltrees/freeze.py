# https://frozen-flask.readthedocs.io/en/latest/
# https://www.youtube.com/watch?v=W09zIet38kI

from flask_frozen import Freezer
import app

freezer = Freezer(app)

if __name__ == '__main__':
    freezer.freeze()