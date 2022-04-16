;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("GNUelpa" . "http://elpa.gnu.org/packages/") t)


;; Initializes the package infrastructure
(package-initialize)

;; Nord theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme nord)

;; popwin
(require 'popwin)
(popwin-mode 1)
(global-set-key (kbd "M-z") popwin:keymap)

;; Smooth scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; Direx
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(push '(direx:direx-mode :position left :width 50 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; linum
(global-linum-mode t)
(setq linum-format "%d  ")

;; Company for autocomplete
(add-hook 'after-init-hook 'global-company-mode)

;; Highlight brackets
(show-paren-mode 1)

;; Removes menu bar
(menu-bar-mode -1)
(setq inhibit-startup-message t)

;; Helm
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

;; lsp-mode
(which-key-mode)
(add-hook 'rust-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(setq lsp-eldoc-render-all t)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" default)))
 '(package-selected-packages
   (quote
    (rustic avy company dap-mode flycheck helm-lsp helm-xref hydra lsp-treemacs projectile smooth-scrolling which-key yasnippet lsp-mode nord-theme)))
 '(rustic-cargo-bin "/home/harvir/.cargo/bin/cargo"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
