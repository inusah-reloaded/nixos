{config, lib, pkgs, ...}:
{
  
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.python-mode
      epkgs.denote
      epkgs.zenburn-theme
      epkgs.magit
      epkgs.go-mode
      epkgs.yasnippet
      epkgs.elpy
      epkgs.jedi
      epkgs.flycheck
      epkgs.auto-complete
      epkgs.avy
      epkgs.ivy
      epkgs.swiper
      epkgs.counsel
      epkgs.ace-window
      epkgs.which-key
      epkgs.org-bullets
      epkgs.try
    ];
    extraConfig = ''
      (setq inhibit-startup-message t)
      (tool-bar-mode -1)
      (fset 'yes-or-no-p 'y-or-n-p)
      (global-set-key (kbd "<f5>") 'revert-buffer)
      (display-line-numbers-mode 1)
      (global-display-line-numbers-mode t)

      (use-package zenburn-theme
       :ensure t
       :config (load-theme 'zenburn t))

       (use-package try
         :ensure t)

       (use-package which-key
         :ensure t
         :config (which-key-mode))

       ;; org-mode stuff
       (use-package org-bullets
         :ensure t
         :config
         (add-hook 'org-mode-hook 'org-bullets-mode))

       (use-package ace-window
         :ensure t
         :init
         (progn
           (global-set-key [remap other-window] 'ace-window)
           (custom-set-faces
            '(aw-leading-char-face
          ((t (:inherit ace-jump-face-foreground :height 3.0)))))
         ))

         (use-package counsel
           :ensure t
         )

         (use-package ivy
           :ensure t
           :diminish (ivy-mode)
           :bind (("C-x b" . ivy-switch-buffer))
           :config
           (ivy-mode 1)
           (setq ivy-use-virtual-buffers t)
           (setq ivy-display-style 'fancy))

         (use-package swiper
           :ensure t
           :bind (("C-s" . swiper)
              ("C-r" . swiper)
              ("C-c C-r" . ivy-resume)
              ("M-x" . counsel-M-x)
              ("C-x C-f" . counsel-find-file)) 
           :config
           (progn 
             (ivy-mode 1)
             (setq ivy-use-virtual-buffers t)
             (setq ivy-display-style 'fancy)
             (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
           ))

           (use-package avy
             :ensure t
             :bind ("M-s" . avy-goto-word-1))

           (use-package auto-complete
             :ensure t
             :init
             (progn
               (ac-config-default)
               (global-auto-complete-mode t)
             ))

           (use-package flycheck
             :ensure t
             :init
             (global-flycheck-mode t))

           (use-package jedi
             :ensure t
             :init
             (add-hook 'python-mode-hook 'jedi:setup)
             (add-hook 'python-mode-hook 'jedi:ac-setup))

           (use-package elpy
             :ensure t
             :config
             (elpy-enable))

           (use-package yasnippet
             :ensure t
             :init
             (yas-global-mode 1)
             :config
             (setq yas-snippet-dirs
               '("~/.emacs.d/snippets"
                 "~/.emacs.d/go-snippets"))
           )

           (use-package go-mode
             :ensure t
             :config
             (autoload 'go-mode "go-mode" nil t))

            (use-package magit
              :ensure t)

    '';
  };
}
