# sphinx-drawio-docker
Sphinx with readthedocs theme &amp; drawio support

## usage
In your _conf.py_ simply append the following for headless draw.io support:
```
# -- Options for draw.io plugin ----------------------------------------------
# @see https://pypi.org/project/sphinxcontrib-drawio/

drawio_default_transparency = True
drawio_headless = True
drawio_no_sandbox = True
```
To generate html and pdf, simply run in the docs root:
```
docker run --rm -v `pwd`:/docs jaredweinfurtner/sphinx-drawio-docker make html latexpdf
```
