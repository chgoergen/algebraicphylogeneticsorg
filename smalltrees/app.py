from flask import Flask, render_template
import yaml
import glob

app = Flask(__name__)

datafiles = glob.glob("static/data_and_tex/data/*.yaml")
texfiles = glob.glob("static/data_and_tex/tex/*.yaml")

def load_data(filename):
    with open(filename, 'r') as file:
        return yaml.safe_load(file)

data = [load_data(filename) for filename in datafiles]
latex = [load_data(filename) for filename in texfiles]

@app.route('/')
def index():
    return render_template('index.html', 
                            treesandmodels=[data[i]['treeandmodel'] for i in range(len(data))], 
                            treesastex=[latex[j]['treeandmodel'] for j in range(len(latex))])

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
