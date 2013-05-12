include:
  - build_tools
  - users
  - cmake

VTK_packages:
  pkg.installed:
    - names:
      - libgl-dev
      - libglu-dev
      - libosmesa6-dev
      - libx11-dev
      - libxt-dev
      - x11proto-core-dev
      - libfreetype6-dev

VTK_build:
  git.latest:
    - name: http://vtk.org/VTK.git
    - target: /home/itk/src/VTK
    - rev: v5.10.1
    - runas: itk
    - require:
      - pkg: build_packages
      - file: src_and_bin_dirs

  file.directory:
    - name: /home/itk/bin/VTK
    - user: itk
    - group: itk
    - require:
      - file: src_and_bin_dirs

  cmd.wait_script:
    - name: vtk_build.sh
    - source: salt://vtk_build.sh
    - cwd: /home/itk/bin/VTK
    - user: itk
    - group: itk
    - watch:
      - git: http://vtk.org/VTK.git
    - require:
      - file: /home/itk/bin/VTK
      - pkg: VTK_packages
      - cmd: CMake_install

VTK_install:
  cmd.wait:
    - name: make install > /dev/null
    - cwd: /home/itk/bin/VTK
    - user: root
    - watch:
      - cmd: VTK_build

  file.managed:
    - name: /etc/ld.so.conf.d/99vtk.conf
    - source: salt://99vtk.conf
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

  cmd.wait:
    - name: /sbin/ldconfig
    - user: root
    - require:
      - file: /etc/ld.so.conf.d/99vtk.conf
