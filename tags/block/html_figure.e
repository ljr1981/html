note
	description: "[
		Representation of an {HTML_FIGURE}.
		]"

class
	HTML_FIGURE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "figure"
			-- <Precursor>

;note
	design: "[
		The <figure> tag specifies self-contained content, like 
		illustrations, diagrams, photos, code listings, etc.

		While the content of the <figure> element is related to the
		main flow, its position is independent of the main flow, and
		if removed it should not affect the flow of the document.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_figure.asp"
	EIS: "name=chart", "src=http://html5doctor.com/downloads/h5d-sectioning-flowchart.png"

end
