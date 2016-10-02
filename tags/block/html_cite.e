class
	HTML_CITE

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

	tag_name: STRING = "cite"
			-- <Precursor>

end
