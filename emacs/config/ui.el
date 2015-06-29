;; Everything related to UI

;; Hide menu
(menu-bar-mode -1)

(add-hook 'focus-out-hook (lambda () (print "OLOLO")))

; Customize mode-line
(setq-default
 mode-line-format
 (list
  ; Show asterisk when buffer is modified
  '(:eval (when (buffer-modified-p) (propertize "*")))
  ; Buffer name
  '(:eval (propertize "%b"))
  " · "
  ; Main mode
  '(:eval (propertize "%m"))))

(set-face-background 'mode-line-inactive "black")
(set-face-foreground 'mode-line-inactive "white")

; 
(defun evil-mode-mode-line-update (default-color)
  "changes the modeline color when the evil mode changes"
  (let ((color (cond ((evil-insert-state-p) '("base3" . "yellow"))
		     ((evil-replace-state-p) '("base3" . "magenta"))
		     ((evil-visual-state-p) '("base3" . "green"))
		     ;((evil-emacs-state-p) '("base3" . "cyan"))
		     ((evil-normal-state-p) default-color)
		     (t '("base3" . "cyan")))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))
(lexical-let ((default-color (cons (face-background 'mode-line)
				   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook (lambda () (evil-mode-mode-line-update default-color))))

;; Line Numbers

(use-package linum-relative
  :ensure t
  :init (setq linum-relative-current-symbol "")
  :config (global-linum-mode 1))

(global-hl-line-mode 1)
