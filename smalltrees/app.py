from flask import Flask, render_template
import yaml

app = Flask(__name__)

def load_data():
    with open('data.yaml', 'r') as file:
        return yaml.safe_load(file)

data = load_data()

@app.route('/')
def index():
    return render_template('index.html', trees=data['trees'])

@app.route('/tree/<tree_name>/model/<model_name>')
def subpage(tree_name, model_name):
    for tree in data['trees']:
        if tree['name'] == tree_name:
            for model in tree['models']:
                if model['name'] == model_name:
                    return render_template('subpage.html', tree_name=tree_name, model_name=model_name, details=model['details'])
    return "Page not found", 404

@app.route('/references')
def about():
    return render_template('references.html')

@app.route('/notation')
def notation():
    return render_template('notation.html')

if __name__ == '__main__':
    app.run(debug=True)
