# The algebraic phylogenetics database

## Purpose
This repository contains all data to build the algebraic phylogenetics database hosted at [algebraicphylogenetics.org](https://www.algebraicphylogenetics.org). 

## Installation
You will need to have `python` installed (we used v3.9.2) and a virtual environment created in which you run `flask`. The python documentation tells you have to create a [virtual environment](https://docs.python.org/3/library/venv.html), and the [flask application](https://flask.palletsprojects.com/en/stable) helps us build a large number of subpages from a simple template and for loop.

The file `app.py` uses flask to create a dynamic version of the website, drawing from the `templates` and `static` folders. Using [`Frozen-Flask`](https://pypi.org/project/Frozen-Flask) and running `freeze.py` will build a static version of the website, creating html files in the `build` folder.

## Usage and licensing

You are welcome to clone and use the content of this repository at your leisure. This includes both the code generating the website as well as the underlying mathematical data. The former is provided under an MIT license with no attribution necessary, the latter CC-BY SA requiering acknowledgement. Guidance on how to cite the database can be found on the `about` page.

## Contact and contribution

We would be delighted if you wanted to contribute to the development of this website or the generation of algebraic-phylogenetics data. To do so, simply clone this repository or the repository containing [our software package](https://github.com/bkholler/Oscar.jl) and let us know via email to <maintainers@algebraicphylogenetics.org>

