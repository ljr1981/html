note
	description: "[
		Representation of an {HTML_HEADLINE_X}.
		]"

class
	HTML_HEADLINE_X

inherit
	HTML_TAG

create
	default_create,
	make_with_level,
	make_h1, make_xxlarge_headline,
	make_h2, make_xlarge_headline,
	make_h3, make_large_headline,
	make_h4, make_medium_headline,
	make_h5, make_small_headline,
	make_h6, make_xsmall_headline

feature {NONE} -- Initialization

	make_h1,
	make_xxlarge_headline (a_text: STRING)
			-- `make_h1' (i.e. <h1>)
		do
			make_with_level (1, a_text)
		end

	make_h2,
	make_xlarge_headline (a_text: STRING)
			-- `make_h2' (i.e. <h2>)
		do
			make_with_level (2, a_text)
		end

	make_h3,
	make_large_headline (a_text: STRING)
			-- `make_h3' (i.e. <h3>)
		do
			make_with_level (3, a_text)
		end

	make_h4,
	make_medium_headline (a_text: STRING)
			-- `make_h4' (i.e. <h4>)
		do
			make_with_level (4, a_text)
		end

	make_h5,
	make_small_headline (a_text: STRING)
			-- `make_h5' (i.e. <h5>)
		do
			make_with_level (5, a_text)
		end

	make_h6,
	make_xsmall_headline (a_text: STRING)
			-- `make_h6' (i.e. <h6>)
		do
			make_with_level (6, a_text)
		end

	make_with_level (a_level: like level; a_text: STRING)
		require
			valid_level: a_level >= 1 and a_level <= 6
		do
			level := a_level
			set_text_content (a_text)
		ensure
			level_set: level = a_level
			text_set: text_content.same_string (a_text)
		end

feature {NONE} -- Implementation: Access

	level: INTEGER
			-- `level' of Current
		attribute
			Result := 1
		end

feature -- Output

	tag_name: STRING
			-- <Precursor>
		once ("object")
			Result := "h"
			Result.append_string (level.out)
		end

;note
	design: "[
Tag    Description
<h1>    used to define HTML heading
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_hn.asp"

end
