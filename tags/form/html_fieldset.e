note
	description: "[
		Representation of an {HTML_FIELDSET}.
		]"

class
	HTML_FIELDSET

inherit
	HTML_TAG

	HTML_FORM_COMPONENT
		undefine
			default_create,
			out
		end

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_FIELDSET}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "fieldset"
			-- <Precursor>

;note
	design: "[
		The <fieldset> tag is used to group related elements in a form.

		The <fieldset> tag draws a box around the related elements.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_fieldset.asp"

end
