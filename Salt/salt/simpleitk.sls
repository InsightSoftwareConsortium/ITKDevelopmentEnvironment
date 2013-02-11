include:
  - build_tools
  - users
  - itk

SimpleITK_packages:
  pkg.installed:
    - names:
      - python-dev
      - libpcre3-dev
      - swig2.0

SimpleITK_build:
  git.latest:
    - name: http://itk.org/SimpleITK.git
    - target: /home/itk/src/SimpleITK
    - submodule: True
    - rev: v0.6rc2
    - runas: itk
    - require:
      - pkg: build_packages
      - file: src_and_bin_dirs

  file.directory:
    - name: /home/itk/bin/SimpleITK
    - user: itk
    - group: itk
    - require:
      - file: src_and_bin_dirs

  cmd.wait_script:
    - name: simpleitk_build.sh
    - source: salt://simpleitk_build.sh
    - cwd: /home/itk/bin/SimpleITK
    - user: itk
    - group: itk
    - watch:
      - git: http://itk.org/SimpleITK.git
    - require:
      - file: /home/itk/bin/SimpleITK
      - pkg: SimpleITK_packages
      - cmd: ITK_install

SimpleITK_install:
  cmd.wait_script:
    - name: simpleitk_install.sh
    - source: salt://simpleitk_install.sh
    - cwd: /home/itk/bin/SimpleITK
    - user: root
    - watch:
      - cmd: SimpleITK_build
