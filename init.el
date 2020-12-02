
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; 包设置
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
						 ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;; use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)

;; encoding and envs
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

;; feature mode
(display-time-mode 1)
(column-number-mode 1)
(blink-cursor-mode 1)
(global-hl-line-mode 1)
(show-paren-mode t)
(display-battery-mode 1)
(tool-bar-mode -1)
(menu-bar-mode t)
(toggle-scroll-bar -1)

;; setting vars
(setq
 tab-width 4
 inhibit-startup-screen t
 inhibit-splash-screen t
 make-backup-files nil
 backup-by-copying t
 create-lockfiles nil
 auto-save-default nil
 show-paren-style 'parenthesis
 )
(when (version<= "26.0.60" emacs-version)
  (global-display-line-numbers-mode))

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'tango)

;; mode line
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'light)
  (sml/setup))

;; recentf
(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 200
		  recentf-max-menu-items 15)
	(global-set-key (kbd "C-c 1") 'recentf-open-files)
    (recentf-mode)))

;; company
(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

;; js2-mode
(use-package js2-mode
  :config
  (progn
    (add-hook 'js-mode-hook 'ac-js2-mode)))

;; ivy
(use-package ivy
  :config
  (progn
    (setq ivy-use-virtual-buffers t
		  enable-recursive-minibuffers t)))

;; neotree
(use-package neotree
  :custom
  (neo-theme 'nerd2)
  :config
  (progn
	(setq neo-smart-open t)
	(setq neo-theme (if (display-graphic-p) 'icons 'nerd))
	(setq neo-window-fixed-size nil)
	(global-set-key (kbd "C-c t") 'neotree-toggle)
	(global-set-key (kbd "C-c ;") 'neotree-change-root)
	(global-set-key [f1] 'neotree-toggle)
	(global-set-key [f2] 'neotree-dir)))

;; keybind
(global-set-key (kbd "C-\\") 'comment-line)
(global-set-key (kbd "C-c f") 'grep-find)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "M-0") 'next-multiframe-window)
(global-set-key (kbd "M-9") 'previous-multiframe-window)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(company-backends
   (quote
    (company-bbdb company-semantic company-cmake company-capf company-clang company-files
		  (company-dabbrev-code company-gtags company-etags company-keywords)
		  company-oddmuse company-dabbrev)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "3d4df186126c347e002c8366d32016948068d2e9198c496093a96775cc3b3eaa" default)))
 '(package-selected-packages
   (quote
    (smart-mode-line gruvbox-theme ivy-mode use-package helm ivy-explorer ivy-posframe ivy xah-css-mode emmet-mode xref auto-complete company ac-js2 spacemacs-theme web-mode flymake-jslint auto-compile abyss-theme neotree phps-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
