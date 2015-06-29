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
  :ensure t
  :init (load-theme 'solarized t))

(set-face-attribute 'vertical-border
		    nil
		    :foreground "white"
		    :background "white")

; Vim

(use-package evil
  :ensure t
  :config (evil-mode 1))

(use-package evil-leader
  :ensure t
  :config (global-evil-leader-mode))

(use-package evil-terminal-cursor-changer
  :ensure t)

(use-package evil-surround
  :ensure t
  :config (global-evil-surround-mode 1))

(use-package evil-matchit
  :ensure t
  :config (global-evil-matchit-mode 1))

;;

(load "~/.emacs.d/config/ui.el")
(load "~/.emacs.d/config/search.el")

; Navigation

(use-package ace-jump-mode
  :ensure t
  :config (evil-leader/set-key "f" 'ace-jump-mode))

;

(use-package magit
  :ensure magit
  :init (setq magit-last-seen-setup-instructions "1.4.0"))

;

(use-package js2-mode
  :ensure js2-mode)

(use-package jsx-mode
  :ensure jsx-mode
  :init (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode)))

