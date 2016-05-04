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
	make_with_level

feature {NONE} -- Initialization

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

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_H1}.
		do
			create Result.make_empty
		end

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
