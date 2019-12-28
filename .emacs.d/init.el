
;; Enables basic packaging support
(require 'package)

;; Initializes the package infrastructure
(package-initialize)


;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Cleansup menus
(menu-bar-mode -1)
(setq inhibit-startup-message t)

;; Line numbers
(global-linum-mode t) 
(setq linum-format "%d ")

;; Enable elpy
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Show brackets
(add-hook 'after-init-hook'show-paran-mode)

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
