;;; Initial phase
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
           (file-exists-p custom-file))
  (load custom-file nil :nomessage))

(load "~/crafted-emacs/modules/crafted-init-config")

;; install all pkgs from straight
(require 'crafted-completion-packages)
(require 'crafted-evil-packages)
(require 'crafted-ide-packages)
(require 'crafted-lisp-packages)
(require 'crafted-org-packages)
(require 'crafted-screencast-packages)
(require 'crafted-ui-packages)
(require 'crafted-workspaces-packages)
(require 'crafted-completion-packages)
(package-install-selected-packages :noconfirm)


;; non-crafted 
(add-to-list 'package-selected-packages 'use-package)


;; Load all config modules 
(require 'crafted-completion-config)
(require 'crafted-defaults-config)
(require 'crafted-evil-config)
(require 'crafted-ide-config)
(require 'crafted-lisp-config)
(require 'crafted-org-config)
(require 'crafted-ide-config)
(require 'crafted-startup-config)
(require 'crafted-ui-config)
(require 'crafted-updates-config)
(require 'crafted-workspaces-config)
(require 'crafted-writing-config)

