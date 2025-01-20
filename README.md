# The algebraic phylogenetics database

## Purpose
This repository contains all data to build the algebraic phylogenetics database hosted at [algebraicphylogenetics.org](https://www.algebraicphylogenetics.org). 

## Setup
You will need to have `python` installed (we used v3.9.2) and a virtual environment created in which you run `flask`. The python documentation tells you have to create a [virtual environment](https://docs.python.org/3/library/venv.html), and the [flask application](https://flask.palletsprojects.com/en/stable) helps us build a large number of subpages from a simple template and for loop. You will also need `pyyaml` and `natsort`. Run:

    python3 -m venv venv
    source venv/bin/activate
    pip install flask pyyaml natsort
    cd algphylodatabase
    flask run

The file `app.py` uses flask to create a dynamic version of the website, drawing from the `templates` and `static/data` and `static/tex` folders. Using [`Frozen-Flask`](https://pypi.org/project/Frozen-Flask) and running `freeze.py` will build a static version of the website, creating html files in the `static/build` folder.

The folder `static/texdisplay` contains local copies of the repositories [`MathJax`](https://github.com/mathjax), release 2.7.7, and [`TikZJax`](https://github.com/kisonecat/tikzjax), the version of November 29, 2024.

## Usage and licensing

You are welcome to clone and use the content of this repository at your leisure. This includes both the code generating the website as well as the underlying mathematical data. The former is provided under an MIT license with no attribution necessary, the latter is provided as CC-BY SA requiering acknowledgement. Guidance on how to cite the database can be found on the `about.html` page.

## Contact and contribution

We would be delighted if you wanted to contribute to the development of this website or the generation of algebraic-phylogenetics data. To do so, simply clone this repository or the repository containing [our software package](https://github.com/bkholler/Oscar.jl) and introduce yourself to the team by sending an email to <maintainers@algebraicphylogenetics.org>.

