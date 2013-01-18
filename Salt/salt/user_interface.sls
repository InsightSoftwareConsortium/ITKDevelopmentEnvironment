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

