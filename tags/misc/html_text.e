note
	description: "[
		Representation of an {HTML_TEXT}.
		]"

class
	HTML_TEXT

inherit
	HTML_TAG

create
	default_create,
	make_with_content,
	make_with_text,
	make_with_buffered_text

feature {NONE} -- Initialization

	make_with_text (a_text: like text_content)
			-- `make_with_text' using `a_text'.
		do
			text_content := a_text
		ensure
			set: text_content.same_string (a_text)
		end

	make_with_buffered_text (a_text: like text_content)
			-- `make_with_buffered_text' using `a_text', prepended with a single space character.
		do
			make_with_text (a_text)
			text_content.prepend_character (' ')
		end

feature -- Output

	tag_name: STRING = ""
			-- <Precursor>

;note
	design: "[
		At some level, HTML is about the delivery of text (along with other media).
		As its acronym suggests, it is hyper-TEXT-markup-language. This class
		represents an emphasis on the TEXT part of the HTML mechanism.
		]"

end
