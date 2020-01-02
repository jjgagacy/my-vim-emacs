;;;
;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(cursor-type (quote bar))
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("96bfc952ae7c93984085406c44d9ec3b98784a9de445d35958588ac9e303af1d" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "cf284fac2a56d242ace50b6d2c438fcc6b4090137f1631e32bedf19495124600" "64ca5a1381fa96cb86fd6c6b4d75b66dc9c4e0fc1288ee7d914ab8d2638e23a9" "c616e584f7268aa3b63d08045a912b50863a34e7ea83e35fcab8537b75741956" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "0effdff4be43fd2a90f6bea0ea9abd67f105f15df11045bb5ecd253207d0c9cc" "f8cf128fa0ef7e61b5546d12bb8ea1584c80ac313db38867b6e774d1d38c73db" default)))
 '(package-selected-packages
   (quote
    (srcery-theme magit flycheck phps-mode neotree company-php company ac-php))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

; 开启全局 Company 补全
(global-company-mode 1)

(setq make-backup-files nil)

;; 刷新标签
(global-set-key (kbd "<f5>") 'ac-php-remake-tags)
;; 查找错误
(global-set-key (kbd "<f6>") 'flycheck-previous-error)
(global-set-key (kbd "<f7>") 'flycheck-next-error)
(global-set-key (kbd "<f8>") 'neotree-toggle)


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(delete-selection-mode 1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'srcery t)
;;(load-theme 'taming-mr-arneson t)
;; (load-theme 'manoj-dark t)

(add-hook 'after-init-hook #'global-flycheck-mode)
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-j") 'backward-to-word)
(global-set-key (kbd "C-l") 'forward-to-word)
(global-set-key (kbd "C-;") 'set-mark-command)
(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)
(global-set-key (kbd "C-'") 'recenter)


(set-default-font "Terminus (TTF)-12")
(setq-default line-spacing 0.2)

(setq neo-window-fixed-size nil)
(setq neo-window-width 50)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

