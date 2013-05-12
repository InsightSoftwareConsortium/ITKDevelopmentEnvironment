include:
  - build_tools
  - users
  - cmake
  - vtk

ITK_build:
  git.latest:
    - name: http://itk.org/ITK.git
    - target: /home/itk/src/ITK
    - rev: v4.3.2
    - runas: itk
    - require:
      - pkg: build_packages
      - file: src_and_bin_dirs

  file.directory:
    - name: /home/itk/bin/ITK
    - user: itk
    - group: itk
    - require:
      - file: src_and_bin_dirs

  cmd.wait_script:
    - name: itk_build.sh
    - source: salt://itk_build.sh
    - cwd: /home/itk/bin/ITK
    - user: itk
    - group: itk
    - watch:
      - git: http://itk.org/ITK.git
    - require:
      - file: /home/itk/bin/ITK
      - cmd: CMake_install
      - cmd: VTK_install

ITK_install:
  cmd.wait:
    - name: make install > /dev/null
    - cwd: /home/itk/bin/ITK
    - user: root
    - watch:
      - cmd: ITK_build
