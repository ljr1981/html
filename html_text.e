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
	make_with_text

feature {NONE} -- Initialization

	make_with_text (a_text: like text_content)
			-- `make_with_text' using `a_text'.
		do
			text_content := a_text
		ensure
			set: text_content.same_string (a_text)
		end

feature -- Access

	is_buffered: BOOLEAN
			-- `is_buffered'

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_TEXT}.
		do
			if is_buffered then
				Result := " "
			else
				create Result.make_empty
			end
		end

	tag_name: STRING = ""
			-- <Precursor>

feature -- Settings

	set_buffering_on
			-- `set_buffering_on' for `is_buffered'.
		do
			is_buffered := True
		ensure
			on: is_buffered
		end

	set_buffering_off
			-- `set_buffering_off' for `is_buffered'.
		do
			is_buffered := False
		ensure
			off: not is_buffered
		end

;note
	design: "[
		At some level, HTML is about the delivery of text (along with other media).
		As its acronym suggests, it is hyper-TEXT-markup-language. This class
		represents an emphasis on the TEXT part of the HTML mechanism.
		]"

end
