(add-to-list 'load-path "@SITELISP@")
(autoload 'actionscript-mode "actionscript-mode"
  "Major mode for editing Actionscript files." t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))
;; we cannot use require because the file doesn't provide the feature
(with-eval-after-load 'actionscript-mode (load "actionscript-config"))
