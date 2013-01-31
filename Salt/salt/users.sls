### Users
# password is "itk"
root:
  user.present:
    - password: $6$bM8wW6dF$MHQwHyIakSEQ0UEvkGEauRHYY/l37zEwcfP8MDycrw5IBGs6Ux7GUL6PmnzvLMnphYO7KB0Yp7TafZ1vjtO6Y/
    - enfore_password: True

powerdev_group:
  group.present:
    - name: powerdev

itk:
  user.present:
    - name: itk
    - shell: /bin/bash
    - password: $6$bM8wW6dF$MHQwHyIakSEQ0UEvkGEauRHYY/l37zEwcfP8MDycrw5IBGs6Ux7GUL6PmnzvLMnphYO7KB0Yp7TafZ1vjtO6Y/
    - home: /home/itk
    - gid_from_name: True
    - groups:
      - cdrom
      - floppy
      - audio
      - dip
      - video
      - plugdev
    # Required for the user to be able to shutdown from the GUI.  Only used with
    # older hal.
    - optional_groups:
      - powerdev
    - require:
      - group: powerdev_group

### Directory layout
src_and_bin_dirs:
  file.directory:
    - names:
      - /home/itk/src
      - /home/itk/bin
    - user: itk
    - group: itk
    - require:
      - user: itk
