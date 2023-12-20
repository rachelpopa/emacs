;;General Global stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(electric-pair-mode +1)
(display-time-mode 1)
(global-hl-line-mode 1)
(global-visual-line-mode 1)
(show-paren-mode 1)


;;Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;Go-mode
(use-package lsp-mode
  :commands lsp
   :hook ((lsp-mode . my/setup-lsp-mode))
  :bind (:map lsp-mode-map
         ("C-c f" . hydra-lsp/body)))

(add-hook 'go-mode-hook #'lsp)

(use-package treemacs
  :ensure t
  :bind ("<f5>" . treemacs)
  :custom (treemacs-is-never-other-window t)
  :hook (treemacs-mode . treemacs-project-follow-mode))

(use-package solaire-mode
  :ensure t
  :hook (after-init . solaire-global-mode)
  :config
  (push '(treemacs-window-background-face . solaire-default-face) solaire-mode-remap-alist)
  (push '(treemacs-hl-line-face . solaire-hl-line-face) solaire-mode-remap-alist))
  
(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom (golden-ratio-exclude-mode '(occur-mode)))  
  
(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  (setq vertico-cycle t)
  )

(use-package vertico-multiform
  :ensure nil
  :hook (after-init . vertico-multiform-mode)
  :init
  (setq vertico-multiform-commands
        '((consult-line (:not posframe))
          (gopar/consult-line (:not posframe))
          (consult-ag (:not posframe))
          (consult-grep (:not posframe))
          (xref-find-definitions (:not posframe))
          (t posframe))))

(use-package vertico-posframe
  :ensure t
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe . 8))))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config (column-number-mode 1)
  :custom
  (doom-modeline-height 30)
  (doom-modeline-window-width-limit nil)
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-minor-modes nil)
  (doom-modeline-enable-word-count t)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-env-python-executable "python")
  (doom-modeline-time t)
  (doom-modeline-vcs-max-length 50))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-org-config)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages '(treemacs))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
