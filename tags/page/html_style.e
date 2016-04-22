note
	description: "[
		Representation of an {HTML_STYLE}.
		]"

class
	HTML_STYLE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_STYLE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "style"
			-- <Precursor>

;note
	design: "[
Tag    Description
<style>    Defines style information for a document
		]"
	EIS: "name=style", "src=http://www.w3schools.com/tags/tag_style.asp"

end
