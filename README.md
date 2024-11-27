# The algebraic phylogenetics database

This repository contains all data to build the algebraic phylogenetics database hosted at algebraicphylogenetics.org

You will need to have python installed and a virtual environment created in which you run flask. The file app.py will then create a dynamic version of the website, drawing from the templates and static folders. Using flask-frozen and running freeze.py will build a static version of the website, creating html files in the build folder.