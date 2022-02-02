import matplotlib.pyplot as plt
import numpy as np
import plotly.express as px

import altair as alt
from vega_datasets import data

def altair_plot():
    source = data.cars()

    brush = alt.selection(type='interval', resolve='global')

    base = alt.Chart(source).mark_point().encode(
        y='Miles_per_Gallon',
        color=alt.condition(brush, 'Origin', alt.ColorValue('gray')),
    ).add_selection(
        brush
    ).properties(
        width=400,
        height=400
    )
    return base


def sin_plot(amp=1, w=1, phi=0, figsize=(16, 10)):
    x = np.linspace(0, 2 * np.pi, 100)
    y = amp * np.sin(w * (x - phi))

    fig, ax = plt.subplots(figsize=figsize)
    ax.set_ylim([-5, 5])
    ax.grid(True)
    ax.plot(x, y);


def plot_with_dropdown(y="lifeExp"):
    df = px.data.gapminder()
    fig = px.area(df, x="year", y=y, color="continent", line_group="country")
    fig.show()


def interactive_plot():
    df = px.data.gapminder()
    fig = px.scatter(df, x="gdpPercap", y="lifeExp", animation_frame="year", animation_group="country",
               size="pop", color="continent", hover_name="country", facet_col="continent",
               log_x=True, size_max=45, range_x=[100,100000], range_y=[25,90])
    fig.show()
