include:
  - build_tools
  - itk
  - users

ImageViewer_build:
  git.latest:
    - name: https://github.com/TubeTK/ImageViewer.git
    - target: /home/itk/src/ImageViewer
    - runas: itk
    - rev: master
    - require:
      - pkg: build_packages
      - file: src_and_bin_dirs

  file.directory:
    - name: /home/itk/bin/ImageViewer
    - user: itk
    - group: itk
    - require:
      - file: src_and_bin_dirs

  cmd.wait_script:
    - name: imageviewer_build.sh
    - source: salt://imageviewer_build.sh
    - cwd: /home/itk/bin/ImageViewer
    - user: itk
    - group: itk
    - watch:
      - git: https://github.com/TubeTK/ImageViewer.git
    - require:
      - file: /home/itk/bin/ImageViewer
      - cmd: ITK_install

ImageViewer_install:
  cmd.wait:
    - name: make install
    - cwd: /home/itk/bin/ImageViewer/ImageViewer-build
    - user: root
    - watch:
      - cmd: ImageViewer_build
