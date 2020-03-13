;; Enables basic packaging support
(require 'package)

;; Initializes the package infrastructure
(package-initialize)


;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Cleansup menus and loads theme
(menu-bar-mode -1)
(load-theme 'tsdh-dark t)
(setq inhibit-startup-message t)

;; Line numbers
(global-linum-mode t) 
(setq linum-format "%d ")

;; Enable elpy
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; Enables iPython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; Enable autopep8
(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=120"))
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Highlights brackets
(show-paren-mode 1)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setenv "PYTHONPATH" "/data/data/com.termux/files/home/code/Backtesting/main/python/")


;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rtags find-file-in-project magit py-autopep8 flycheck elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
