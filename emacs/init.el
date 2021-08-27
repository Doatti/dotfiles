
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'cp2k-mode nil 'noerror)
(add-to-list 'auto-mode-alist '("\\.inp\\'" . cp2k-mode))

;; Disable tool bar, menu bar, scroll bar.

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Better defaults

(setq-default
 ;; Use colors that fit a dark background.
 frame-background-mode 'dark

 ;; Don't use the compiled code if its the older package.
 load-prefer-newer t

 ;; Do not show the startup message.
 inhibit-startup-message t

 ;; Do not put 'customize' config in init.el; give it another file.
 custom-file "~/.emacs.d/custom-file.el"

 ;; 72 is too less for the fontsize that I use.
 fill-column 90

 ;; Use your name in the frame title. :)
 frame-title-format (format "%s's Emacs" (capitalize user-login-name))

 ;; Do not create lockfiles.
 ;create-lockfiles nil

 ;; Don't use hard tabs
 indent-tabs-mode nil

 ;; Emacs can automatically create backup files. This tells Emacs to put all backups in
 ;; ~/.emacs.d/backups. More info:
 ;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
 backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))

 ;; Do not autosave.
 auto-save-default nil

 ;; Allow commands to be run on minibuffers.
 enable-recursive-minibuffers t)

;; Load customization file
(load custom-file)

;; Set colors
(set-background-color "black")
(set-foreground-color "wheat")

;; QE modes: BEGIN
(add-to-list 'load-path (expand-file-name "~/.emacs.d/qe-modes/"))
(require 'qe-modes)

;; automatic filename recognition
;; (BEWARE: more general patterns must be specified first)

;; automatically open the *.in files with generic QE mode
(add-to-list 'auto-mode-alist '("\\.in\\'" . qe-mode))

;;  automatically open the the pw*.in, scf*.in, nscf*in, relax*in,
;;  vc-relax*.in, md*.in, vc-md*.in files by pw.x mode
(add-to-list 'auto-mode-alist
	     '("\\(pw\\|n?scf\\|\\(?:vc-\\)?\\(?:md\\|relax\\)\\).*\\.in\\'" . pw-mode))

;; automatically open the neb*.in files with neb.x mode
(add-to-list 'auto-mode-alist '("neb.*\\.in\\'" . neb-mode))

;; automatically open the cp*.in files with cp.x mode
(add-to-list 'auto-mode-alist '("cp.*\\.in\\'" . ph-mode))

;; automatically open the ph*.in files with ph.x mode
(add-to-list 'auto-mode-alist '("ph.*\\.in\\'" . ph-mode))

;; automatically open the ld1*.in files with ld1 mode
(add-to-list 'auto-mode-alist '("ld1.*\\.in\\'" . ld1-mode))

;; automatically open the pp*.in files with pp.x mode
(add-to-list 'auto-mode-alist '("pp.*\\.in\\'" . pp-mode))


;;; default indentation offset is 3; uncomment below line and set the
;;; value accordingly if you prefer other value
;
;(setq qe-indent 4)


;;; uncomment below lines to disable the auto-indentation ...
;;; ( are you really sure you want to do this ? )
;
;;(dolist (hook '(qe-mode-hook
;;                pw-mode-hook
;;                cp-mode-hook
;;                ph-mode-hook
;;                ld1-mode-hook
;;		  pp-mode-hook))
;;  (add-hook hook (lambda () (setq indent-line-function 'indent-relative))))


;; QE modes: END
;;
