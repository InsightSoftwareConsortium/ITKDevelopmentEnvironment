include:
  - users

Fiji_install:
  pkg.installed:
    - names:
      - openjdk-6-jre

  cmd.script:
    - name: fiji_install.sh
    - source: salt://fiji_install.sh
    - user: root
    - cwd: /opt
    - shell: /bin/bash
    - stateful: True

  file.managed:
   - name: /home/itk/.bashrc
   - source: salt://.bashrc
   - user: itk
   - group: itk
   - require:
     - user: itk

