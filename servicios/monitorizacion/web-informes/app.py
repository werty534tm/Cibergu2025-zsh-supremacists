from dash import Dash, html, dcc, callback, Output, Input, State
import pandas as pd

app = Dash()

host = "grafana_service"
port = 3000

opciones = {
    'intervalo':["minuto", "hora", "día", "mes"],
}
opt = pd.DataFrame(opciones)

app.layout = [
    html.H1(children='Generador de informes', style={'textAlign':'center'}),

    html.Div(children='''
        Elija los parámetros que quiera reflejados en el informe
    ''', style={'textAlign':'center'}),

    dcc.Dropdown(opt.intervalo.unique(), 'minuto', id='intervalo-elegido', style={'max-width':'200px', 'textAlign':'center', 'padding':'10px', 'paddingTop':'50px'}),

    html.Button("Generar informe", id='generar-informe', n_clicks=0, style={'marginLeft':'auto', 'marginRight':'auto', 'width':'300px', 'height':'50px', 'padding':'10px'}),

    html.Div(id='container-button-basic',
             children='')
]

@callback(
    Output('container-button-basic', 'children'),
    Input('generar-informe', 'n_clicks'),
    State('intervalo-elegido', 'value'),
    prevent_initial_call=True
)
def update_output(n_clicks, value):

    return ''.format()
if __name__ == '__main__':
    app.run(debug=True)
