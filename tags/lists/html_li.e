note
	description: "[
		Representation of an {HTML_LI}.
		]"

class
	HTML_LI

inherit
	HTML_TAG

create
	default_create,
	make_with_content,
	make_with_raw_text,
	make_with_link_and_text

feature {NONE} -- Initialization

	make_with_link_and_text (a_link, a_text: STRING)
			-- `make_with_link_and_text' in `a_link' and `a_text'.
			-- Example: <li><a href="moonshot.html">What is a Moonshot?</a></li>
		local
			l_a: HTML_A
		do
			create l_a.make_with_link_and_text (a_link, a_text)
			extend (l_a)
			default_create
		end

feature -- Basic Operations

	set_link_and_text (a_link, a_text: STRING)
			-- `set_link_and_text' with `a_link' and `a_text'.
			-- Example: <li><a href="moonshot.html">What is a Moonshot?</a></li>
		local
			l_a: HTML_A
		do
			create l_a.make_with_link_and_text (a_link, a_text)
			extend (l_a)
			default_create
		end

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_LI}.
		do
			create Result.make_empty
		end

	tag_name: STRING = "li"
			-- <Precursor>

;note
	design: "[
		The <li> tag defines a list item.

		The <li> tag is used in ordered lists(<ol>), unordered
		lists (<ul>), and in menu lists (<menu>).
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_li.asp"

end
