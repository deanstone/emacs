;;; packages.el --- dean layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: dean xu <dean@deans-iMac.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `dean-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `dean/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `dean/pre-init-PACKAGE' and/or
;;   `dean/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq dean-packages
      '(
        paredit
        ivy-erlang-complete
        company-erlang
        ))


;; enhance erlang-mode
(defun dean/init-ivy-erlang-complete()
  "Setup for erlang."
  (use-package ivy-erlang-complete
    :defer t
    :ensure t
    :config
    (progn
      (add-hook 'erlang-mode-hook #'company-erlang-init)
      (add-hook 'erlang-mode-hook #'ivy-erlang-complete-init)
      ;; automatic update completion data after save
      (add-hook 'after-save-hook #'ivy-erlang-complete-reparse)
      (add-to-list 'auto-mode-alist '("rebar\.config$" . erlang-mode))
      (add-to-list 'auto-mode-alist '("relx\.config$" . erlang-mode))
      (add-to-list 'auto-mode-alist '("system\.config$" . erlang-mode))
      (add-to-list 'auto-mode-alist '("\.app\.src$" . erlang-mode))
      ;; (dolist (prefix '(
      ;;                   ("e" . "erlang-ide")
      ;;                   ))
        ;; (spacemacs/declare-prefix-for-mode
        ;;   'erlang-mode (car prefix) (cdr prefix)))

      (spacemacs/set-leader-keys-for-major-mode 'erlang-mode
        "d" 'ivy-erlang-complete-find-definition
        "s" 'ivy-erlang-complete-find-spec
        "r" 'ivy-erlang-complete-find-references
        "f" 'ivy-erlang-complete-find-file
        "h" 'ivy-erlang-complete-show-doc-at-point
        "p" 'ivy-erlang-complete-set-project-root
        "a" 'ivy-erlang-complete-autosetup-project-root
        ))

    :custom
    (ivy-erlang-complete-erlang-root "/usr/local/Cellar/erlang/22.3.3/lib/erlang")
    )
  )

(defun dean/init-company-erlang()
  (add-hook 'erlang-mode-hook #'company-erlang-init)
  )
