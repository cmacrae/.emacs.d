;;; init.el --- Where all the magic begins
;;
;;; Commentary:
;; This file loads Org-mode and then loads the rest of the Emacs initialization from Emacs Lisp
;; embedded in the literate Org-mode file: readme.org
;;
;;; Code:
(require 'package)
(setq package-enable-at-startup nil)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "melpa-stable" package-archives)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq emacs-dir (file-name-directory (or (buffer-file-name) load-file-name)))

;; load up Org-mode and Org-babel
(require 'org-install)
(require 'ob-tangle)

;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files emacs-dir t "\\.org$"))

;;; init.el ends here
