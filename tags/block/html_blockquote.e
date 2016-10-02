class
	HTML_BLOCKQUOTE

inherit
	HTML_TAG
		export {ANY}
			align, set_align
		end

create
	default_create,
	make_with_content,
	make_with_raw_text

feature -- Output

	tag_name: STRING = "blockquote"
			-- <Precursor>

end
