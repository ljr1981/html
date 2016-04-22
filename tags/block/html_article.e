note
	description: "[
		Representation of an {HTML_ARTICLE}.
		]"

class
	HTML_ARTICLE

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_ARTICLE}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "article"
			-- <Precursor>

;note
	design: "[
		The <article> tag specifies independent, self-contained content.

		An article should make sense on its own and it should be possible
		to distribute it independently from the rest of the site.

		Potential sources for the <article> element:

		Forum post
		Blog post
		News story
		Comment
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_article.asp"
	EIS: "name=chart", "src=http://html5doctor.com/downloads/h5d-sectioning-flowchart.png"

end
