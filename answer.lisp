(defpackage #:aoc2023
  (:use :cl))

(in-package #:aoc2023)

(defvar *zero-char-code* (char-code #\0))
(defvar *nine-char-code* (char-code #\9))

(declaim (inline numericcharp))
(defun numericcharp (c)
  (let ((x (char-code c)))
    (and (>= x *zero-char-code*) (<= x *nine-char-code*))))

(defun read-number (data)
  (let ((as-list (coerce data 'list)))
    (parse-integer (coerce
                    (list
                     (find-if #'numericcharp as-list)
                     (find-if #'numericcharp as-list :from-end t))
                    'string))))

(defun sum-numbers-from-calibration-file (filename)
  (with-open-file (file filename)
    (loop :for line := (read-line file nil :eof)
          :while (not (equal line :eof))
          :for value = (read-number line)
          :summing value)))
