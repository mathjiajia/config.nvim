;; extends
(math_environment
  (begin
   command: _ @text.environment
   name: (curly_group_text (text) @text.environment.name)))

(math_environment
  (end
   command: _ @text.environment
   name: (curly_group_text (text) @text.environment.name)))
