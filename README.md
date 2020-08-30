# sphinx-drawio-docker
Sphinx with readthedocs theme &amp; drawio support

## usage
In your _conf.py_ simply append the following for draw.io support:
```
# -- Options for draw.io plugin ----------------------------------------------
# @see https://pypi.org/project/sphinxcontrib-drawio/

drawio_default_transparency = True
drawio_headless = True
drawio_no_sandbox = True
```
