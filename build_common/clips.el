;; $Id$

(query-replace-regexp "meta\\['TT_\\([A-Z]*\\)'\\]" "meta['TT']['\\1']" nil nil nil)

(query-replace-regexp "[ \t]*\\\\\n" "\n" nil nil nil)

(query-replace ";" " << THROWIT;" nil nil nil)

(query-replace "ls(FLTAG)" "TS()" nil nil nil)

(tags-query-replace "\n\n\\*/" "\n*/" )

(tags-query-replace "[ \t]*\n[ \t]*\n[ \t]*\n\\([ \t]*\n\\)*" "\n\n")

(tags-query-replace "::logit" "::logger::get_logger()")

buffer upgrade
(query-replace-regexp "\\([A-Za-z0-9][_A-Za-z0-9]*\\)->size_" "jnu::buffer_size(*\\1)" nil nil nil)
;;-      char* buf = static_cast<char*>(iobuf_->ptr_);
;;+      char* buf = jnu::buffer_cast<char*>(*iobuf_);
(query-replace-regexp "static_cast<char\\*>(\\([A-Za-z0-9][_A-Za-z0-9]*\\)->ptr_)" "jnu::buffer_cast<char*>(*\\1)" nil nil nil)
(query-replace-regexp "(char\\*)\\([A-Za-z0-9][_A-Za-z0-9]*\\)->ptr_" "jnu::buffer_cast<char*>(*\\1)" nil nil nil)
