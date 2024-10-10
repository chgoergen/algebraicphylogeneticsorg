from flask import Flask, render_template
import yaml
import glob
import natsort
from natsort import natsorted

app = Flask(__name__)

datafiles = glob.glob("static/data/*.yaml")
texfiles = natsorted(glob.glob("static/tex/*.yaml"))

def load_data(filename):
    with open(filename, 'r') as file:
        return yaml.safe_load(file)

texlist = [load_data(filename) for filename in texfiles]
datalist = [load_data(filename) for filename in datafiles]

treesandmodels = {}
for tikzpicture in texlist:
    idx = tikzpicture['id']
    treesandmodels[idx] = [d for d in datalist if idx in d['id']]

@app.route('/')
def index():
    return render_template('index.html', 
                            treesandmodels=treesandmodels,
                            treesastex=texlist)

@app.route('/details/<treeandmodel_id>')
def subpage(treeandmodel_id):
    tree_id = treeandmodel_id.rpartition('-')[0]
    treeandmodels = treesandmodels[tree_id]
    texpicture = [d for d in texlist if tree_id == d['id']]
    for treeandmodel in treeandmodels:
        if treeandmodel['id'] == treeandmodel_id:
            return render_template('subpage.html', tree_id=tree_id, treeandmodel_id=treeandmodel_id, data=treeandmodel, picture=texpicture[0])     
    return "Page not found", 404

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/notation')
def notation():
    return render_template('notation.html')

if __name__ == '__main__':
    app.run(debug=True)
