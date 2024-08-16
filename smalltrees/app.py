from flask import Flask, render_template
import yaml
import glob

app = Flask(__name__)

datafiles = glob.glob("static/data/*.yaml")
texfiles = glob.glob("static/tex/*.yaml")

def load_data(filename):
    with open(filename, 'r') as file:
        return yaml.safe_load(file)

texlist = [load_data(filename) for filename in texfiles]
treeindex = [texlist[i]['id'] for i in range(len(texlist))]

### just test
datalist = [load_data(filename) for filename in datafiles]
modelandtree_idx = [datalist[i]['id'] for i in range(len(datalist))]

longertreeidx = treeindex+['4-0-0']

[v for v in modelandtree_idx if treeindex[0] in v]
### until here

#aim is to transform the above to
#datadict = 
#texdict =




#treeindex = all values of id in latex
#treeandmodelindex = all values of id in data 

# dict where key=tikzpicture; value=data


@app.route('/')
def index():
    return render_template('index.html', 
                            treesandmodels=datadict,
                            treesastex=texdict)

#@app.route('/tree/<tree_name>/model/<model_name>')
#def subpage(tree_name, model_name):
#    for tree in data['trees']:
#        if tree['name'] == tree_name:
#            for model in tree['models']:
#                if model['name'] == model_name:
#                    return render_template('subpage.html', tree_name=tree_name, model_name=model_name, details=model['details'])
#    return "Page not found", 404

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/notation')
def notation():
    return render_template('notation.html')

if __name__ == '__main__':
    app.run(debug=True)
