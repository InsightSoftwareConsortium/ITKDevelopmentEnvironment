include:
  - build_tools
  - users

CMake_build:
  git.latest:
    - name: http://cmake.org/cmake.git
    - target: /home/itk/src/CMake
    - rev: v2.8.10.2
    - runas: itk
    - require:
      - pkg: build_packages
      - file: src_and_bin_dirs

  file.directory:
    - name: /home/itk/bin/CMake
    - user: itk
    - group: itk
    - require:
      - file: src_and_bin_dirs

  cmd.wait_script:
    - name: /home/itk/bin/cmake_build.sh
    - source: salt://cmake_build.sh
    - cwd: /home/itk/bin/CMake
    - user: itk
    - group: itk
    - watch:
      - git: http://cmake.org/cmake.git
    - require:
      - file: /home/itk/bin/CMake

CMake_install:
  cmd.wait:
    - name: make install > /dev/null
    - cwd: /home/itk/bin/CMake
    - user: root
    - watch:
      - cmd: CMake_build
