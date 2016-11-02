note
	description: "[
		Representation of an {HTML_IMG}.
		]"

class
	HTML_IMG

inherit
	HTML_TAG
		export {ANY}
			alt, set_alt,
			data_holder_rendered, set_data_holder_rendered,
			data_src, set_data_src,
			height, set_height,
			width, set_width,
			src, set_src, set_source
		redefine
			default_create
		end

create
	default_create,
	make_with_content,
	make_with_src

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			exclude_end_tag := True
			Precursor
		end

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
