=========================
GetValkyrie Documentation
=========================

This documentation is intended primarily for internal use at GetValkyrie. Here
we document our processes for developing, testing, deploying, etc. our systems.

How to use this documentation
-----------------------------

This documentation is built using Sphinx_, which builds documentation using the
reStructuredText_ (.rst) markup format.

To get a local copy of the GetValkyrie documentations, simply clone this repo
and point your browser to the compiled HTML

::

    $ git clone https://github.com/GetValkyrie/docs.git ~/getvalkyrie/docs
    $ chromium ~/getvalkyrie/docs/_build/html/index.html

.. _Sphinx: http://sphinx-doc.org
.. _reStructuredText: http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#quick-syntax-overview


How to contribute to this documentation
---------------------------------------

First, you'll need to install Sphinx. Instructions are readily available for
Debian_ or MacOSX_, among others. Sphinx is required in order to compile the
reStructuredText files into HTML.

Next, you'll need to clone the repo (as described above). Sphinx extends
reST_ with its own markup_. Using these, add or update the docs as
appropriate. Then compile the HTML:

::

    $ make html

Assuming there are no errors, reload the docs in your browser. If you're happy
with the changes, commit and push them. Since this project is hosted on Github,
a `pull request`_ workflow is available.


.. _Debian: http://sphinx-doc.org/latest/install.html#debian-ubuntu-install-sphinx-using-packaging-system
.. _MacOSX: http://sphinx-doc.org/latest/install.html#mac-os-x-install-sphinx-using-macports
.. _reST: http://sphinx-doc.org/latest/rest.html#rst-primer
.. _markup: http://sphinx-doc.org/latest/markup/index.html#sphinxmarkup
.. _pull request: https://help.github.com/articles/using-pull-requests


