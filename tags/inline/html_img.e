note
	description: "[
		Representation of an {HTML_IMG}.
		]"

class
	HTML_IMG

inherit
	HTML_TAG
		export {ANY}
			src
		end

create
	default_create,
	make_with_content,
	make_with_src

feature -- Queries

	with_id_and_src (a_id, a_source: STRING): like Current
			-- `with_id_and_src' of `a_id' and `a_source'
			-- Example: ...
		do
			set_id (a_id)
			set_source (a_source)
			Result := Current
		end

feature -- Output

	tag_name: STRING = "img"
			-- <Precursor>

;note
	design: "[
Tag    Description
<img>    Defines an image in an HTML page
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_img.asp"

end
