(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)

; Colorscheme

(set-terminal-parameter nil 'background-mode 'light)

(use-package color-theme)

(use-package color-theme-solarized
  :ensure color-theme-solarized
  :init (load-theme 'solarized t))

(set-face-attribute 'vertical-border
		    nil
		    :foreground "base3"
		    :background "base3")

; Appearance

(menu-bar-mode -1)

; Vim

(use-package evil
  :ensure evil
  :init (evil-mode 1))

(use-package evil-leader
  :ensure evil-leader
  :init (global-evil-leader-mode))

(use-package evil-terminal-cursor-changer
  :ensure evil-terminal-cursor-changer)

(use-package evil-surround
  :ensure evil-surround
  :init (global-evil-surround-mode 1))

(use-package evil-matchit
  :ensure evil-matchit
  :init (global-evil-matchit-mode 1))

; Navigation

(use-package ace-jump-mode
  :ensure ace-jump-mode)

(evil-leader/set-key "f" 'ace-jump-mode)

;

(use-package magit
  :ensure magit)

;

(use-package js2-mode
  :ensure js2-mode)

(use-package jsx-mode
  :ensure jsx-mode
  :init (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode)))

