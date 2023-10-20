(
	"\\(" @opening
	@interpolated_expression
	")" @closing) @container

(value_arguments
	"(" @opening
	")" @closing) @container

(tuple_expression
	"(" @opening
	")" @closing) @container

(call_expression
	"(" @opening
	")" @closing) @container

; (call_suffix
; 	"(" @opening
; 	")" @closing) @container

(
	"(" @opening
	@parameter
	")" @closing) @container

(value_arguments
	"[" @opening
	"]" @closing) @container

(array_type
	"[" @opening
	"]" @closing) @container

(array_literal
	"[" @opening
	"]" @closing) @container

(dictionary_type
	"[" @opening
	"]" @closing) @container

(dictionary_literal
	"[" @opening
	"]" @closing) @container

(for_statement
	"{" @opening
	"}" @closing) @container

(guard_statement
	"{" @opening
	"}" @closing) @container

(if_statement
	"{" @opening
	"}" @closing) @container

(switch_statement
	"{" @opening
	"}" @closing) @container

(do_statement
	"{" @opening
	"}" @closing) @container

(while_statement
	"{" @opening
	"}" @closing) @container

(catch_block
	"{" @opening
	"}" @closing) @container

(function_body
	"{" @opening
	"}" @closing) @container

(class_body
	"{" @opening
	"}" @closing) @container

(enum_class_body
	"{" @opening
	"}" @closing) @container

(protocol_body
	"{" @opening
	"}" @closing) @container

(protocol_property_requirements
	"{" @opening
	"}" @closing) @container

(computed_property
	"{" @opening
	"}" @closing) @container

(lambda_literal
	"{" @opening
	"}" @closing) @container

(
	"{" @opening
	@statements
	"}" @closing) @container
