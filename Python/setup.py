import setuptools
  
setuptools.setup(
    name="wetherspoons",
    version="0.0.1",
    author="Dougal Toms",
    author_email="dougal.toms@gmail.com",
    packages=["wetherspoons"],
    description="Colormaps inspired by the cocktails of JD Wetherspoon",
    url="https://github.com/dougaltoms/wetherspoons",
    license='MIT',
    python_requires='>=3.8',
    install_requires=["matplotlib", "colours"]
)