note
	description: "[
		Representation of an {HTML_MAIN}.
		]"

class
	HTML_MAIN

inherit
	HTML_TAG
		export {ANY}
			-- nothing yet
		end

create
	default_create,
	make_with_content,
	make_with_raw_text

feature -- Output

	tag_name: STRING = "main"
			-- <Precursor>

;note
	design: "[
Definition and Usage
The <main> tag specifies the main content of a document.

The content inside the <main> element should be unique to the document. It should not contain any content that is repeated across documents such as sidebars, navigation links, copyright information, site logos, and search forms.

Note: There must not be more than one <main> element in a document. The <main> element must NOT be a descendant of an <article>, <aside>, <footer>, <header>, or <nav> element.
]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_div.asp"

end
