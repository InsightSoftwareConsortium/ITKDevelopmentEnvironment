include:
  - build_tools

IPython_packages:
  pkg.installed:
    - names:
      - python-pip
      - python-qt4
      # For matplotlib build.
      - libpng-dev

numpy:
  pip.installed:
    - require:
      - pkg: build_packages

IPython_pip_packages:
  pip.installed:
    - names:
      - matplotlib
      - cython
      - tornado
    - require:
      - pkg: IPython_packages
      - pip: numpy

ipython:
  pip.installed:
    - install_options: zmq
    - require:
      - pip: IPython_pip_packages
