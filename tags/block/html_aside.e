note
	description: "[
		Representation of an {HTML_ASIDE}.
		]"

class
	HTML_ASIDE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "aside"
			-- <Precursor>

;note
	design: "[
		The <aside> tag defines some content aside from the content it is placed in.

		The aside content should be related to the surrounding content.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_aside.asp"
	EIS: "name=chart", "src=http://html5doctor.com/downloads/h5d-sectioning-flowchart.png"

end
