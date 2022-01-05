;;; npm-publish.el --- Run your npm workflows -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Shane Kennedy

;; Author: Shane Kennedy, Manas Jayanth
;; Homepage: https://github.com/shaneikennedy/npm.el
;; Keywords: tools
;; Version: 0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;; Functions for publishing project an NPM registry

;;; Code:
(require 'npm-common)

(define-transient-command npm-publish-menu ()
  "Open npm publish transient menu pop up."
    ["Arguments"
     ("-r" "set npm registry where the package must be published"        "--registry=")
    ]
    [["Command"
      ("p" "Publish"       npm-publish)]]
  (interactive)
  (transient-setup 'npm-publish-menu))

(defconst npm-publish--prefix-command "npm publish")
(defconst npm-publish--temp-buffer ".npmpulish")


(defun npm-publish-menu-arguments nil
  "Arguments function for transient."
  (transient-args 'npm-publish-menu))

;;;###autoload
(defun npm-publish (&optional args)
  "Publish a project directory as an NPM package to a registry"
   (interactive (list (npm-publish-menu-arguments)))
   (let* ((arguments (string-join args " "))
          (npm-command npm-publish--prefix-command))
     (npm-common--compile npm-command arguments)))

(provide 'npm-publish)
;;; npm-publish.el ends here
