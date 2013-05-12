include:
  - build_tools

Documentation_packages:
  pkg.installed:
    - names:
      - evince
      - chromium-browser

Documentation_packages_removed:
  pkg.removed:
    - names:
      # chromium is the default for ipython notebooks
      - iceweasel

SimpleITK_Notebooks:
  git.latest:
    - name: https://github.com/InsightSoftwareConsortium/SimpleITK-Notebooks.git
    - target: /home/itk/src/SimpleITK-Notebooks
    - rev: master
    - runas: itk
    - require:
      - pkg: build_packages
