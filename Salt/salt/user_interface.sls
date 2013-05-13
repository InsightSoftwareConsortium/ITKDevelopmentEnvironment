include:
  - users

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

### Nice desktop background
/home/itk/Pictures/DesktopDisplay_ITK.jpg:
  file.managed:
    - source: salt://DesktopDisplay_ITK_small.jpg
    - user: itk
    - group: itk
    - mode: 644
    - makedirs: True
    - require:
      - user: itk

# Make sure the ownership is correct
/home/itk/Pictures:
  file.directory:
    - user: itk
    - group: itk
    - mode: 755
    - require:
      - user: itk

/home/itk/.config/pcmanfm/LXDE.conf:
  file.managed:
    - source: salt://LXDE.conf
    - user: itk
    - group: itk
    - mode: 644
    - makedirs: True
    - require:
      - user: itk

# Make sure the ownership is correct
/home/itk/.config:
  file.directory:
    - user: itk
    - group: itk
    - mode: 755
    - require:
      - user: itk
    - recurse:
      - user
      - group
