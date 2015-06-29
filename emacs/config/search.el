;;
(use-package helm-config
  :ensure helm
  :config
  (helm-mode 1))

;; Fuzzy search
;; https://github.com/grizzl/grizzl
(use-package grizzl
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'grizzl)
  :config
  (projectile-global-mode 1))

(use-package helm-projectile
  :ensure t
  :config (evil-leader/set-key "s" 'helm-projectile))

