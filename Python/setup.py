from setuptools import setup

setup(
   name='wetherspoons',
   version='1.0',
   description='Boozy cocktail colour palettes courtesy of JD Wetherspoon',
   author='Dougal Toms',
   author_email='dougal.toms@gmail.com',
   packages=['wetherspoons'],
   install_requires=['Color', 'matplotlib']
)