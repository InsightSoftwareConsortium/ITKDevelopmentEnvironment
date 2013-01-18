### Packages
user_packages:
  pkg.installed:
    - names:
      - console-keymaps
      - emacs
      - lxde
      - tmux
      - vim-gtk

### Users
vagrant:
  user.absent:
    - force: True

# password is "itk"
root:
  user.present:
    - password: $6$bM8wW6dF$MHQwHyIakSEQ0UEvkGEauRHYY/l37zEwcfP8MDycrw5IBGs6Ux7GUL6PmnzvLMnphYO7KB0Yp7TafZ1vjtO6Y/
    - enfore_password: True

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
      - admin
      - powerdev
