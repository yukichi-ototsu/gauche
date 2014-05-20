(use srfi-60)

(define (bin-format b)
	(format #f "~,,' ,4:b" b))

(define (oct-format o)
	(format #f "~,,' ,4:o" o))

(define (hex-format x)
	(format #f "~,,' ,4:X" x))

(define *bit-in*
	(begin
		(display "input bit >> ")
		(flush)
		(eval (read-from-string (string-append "#b" (read-line))) interaction-environment)))

(let* ((in (begin (display "input string >> ") (flush) (read-line)))
			 (bit *bit-in*)
			 (bit-len (* (integer-length *bit-in*) 2))
			 (in-list (string->list in))
			 (in-list-int (map (lambda (x) (char->integer x)) in-list))
			 (map-list-int (map (lambda (x) (logxor x bit)) in-list-int))
			 (map-list-char (map (lambda (x) (integer->char x)) map-list-int)))
	(begin (display in-list)(newline))
	(begin (display in-list-int)(newline))
	(for-each (lambda (x) (begin (display (bin-format (bit-field x 0 bit-len)))(newline))) in-list-int)
	(begin (display map-list-char)(newline))
	(begin (display map-list-int)(newline))
	(for-each (lambda (x) (begin (display (bin-format (bit-field x 0 bit-len)))(newline))) map-list-int)

	(begin (display "input string  : ") (display in)(newline))
	(begin (display "input bit     : ") (display (bin-format bit))(newline))
	(begin (display "output string : ") (display (list->string map-list-char))(newline)))
