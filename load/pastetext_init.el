;; insert the date, the time, and the date and time at point. Insert
;; the date 31 days hence at point, eventually...
(defvar insert-time-format "%T"
  "*Format for \\[insert-time] (c.f. 'format-time-string' for how to format).")

(defvar insert-date-format "%Y%m%d"
  "*Format for \\[insert-date] (c.f. 'format-time-string' for how to
 format).")

(defun insert-time ()
  "Insert the current time according to the variable \"insert-time-format\"."
  (interactive "*")
  (insert (format-time-string insert-time-format
                              (current-time))))
(defun insert-date ()
  "Insert the current date according to the variable \"insert-date-format\"."
  (interactive "*")
  (insert (format-time-string insert-date-format
                              (current-time))))

(defun insert-time-and-date ()
  "Insert the current date according to the variable
 \"insert-date-format\", then a space, then the current time according
 to the variable \"insert-time-format\"."
  (interactive "*")
  (progn
    (insert " [ ezo ")
    (insert-date)
    (insert " ")
    (insert-time)
    (insert " ]")
    ))

;; (global-set-key [f5] 'insert-date)
;; (global-set-key [f6] 'insert-time)
(global-set-key [f12] 'insert-time-and-date)

(defun insert-name-and-email()
  (interactive)
  "Insert my signature at point."
  (insert (concat user-full-name " <" user-mail-address ">")))

;; (global-set-key [f8] 'insert-name-and-email)
