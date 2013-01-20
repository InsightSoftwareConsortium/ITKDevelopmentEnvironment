### Packages
user_packages:
  pkg.installed:
    - names:
      - console-keymaps
      - cgdb
      - emacs
      - gitk
      - htop
      - lxde
      - tig
      - tmux
      - vim-gtk

  user.present:
    - name: itk
    # Required for the user to be able to shutdown from the GUI.  Only used with
    # older hal.
    - optional_groups:
      - powerdev

### Nice desktop background
/home/itk/Pictures/DesktopDisplay_ITK.jpg:
  file.managed:
    - source: salt://DesktopDisplay_ITK_small.jpg
    - user: itk
    - group: itk
    - mode: 644
    - makedirs: True
    - require:
      - user: user_packages

/home/itk/.config/pcmanfm/LXDE.conf:
  file.managed:
    - source: salt://LXDE.conf
    - user: itk
    - group: itk
    - mode: 644
    - makedirs: True
    - require:
      - user: user_packages

