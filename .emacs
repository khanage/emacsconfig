(toggle-debug-on-error)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/ghc-mod")

(add-to-list 'exec-path "~/.cabal/bin")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

(el-get 'sync)

(require 'color-theme)
(color-theme-deep-blue)

;; Autocomplete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;;; >>= Haskell
(autoload 'ghc-init "ghc" nil t)

(require 'hs-lint)
(require 'haskell-mode)
(require 'inf-haskell)

(add-hook 'haskell-mode-hook (lambda() (ghc-init) (flymake-mode)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer)
;;(custom-set-variables '(haskell-tags-on-save t))

;; (add-hook 'haskell-mode-hook
;;           (lambda ()
;;             (mapc (lambda (x) (add-to-list 'ac-sources x))
;;                   (ac-source-ghc-symbol
;;                    ac-source-ghc-pragmas
;;                    ac-source-ghc-langexts))))
