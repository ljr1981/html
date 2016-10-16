class
	HTML_IFRAME

inherit
	HTML_TAG
		export {ANY}
			frameborder, set_frameborder,
			height, set_height,
			src, set_src,
			style, set_style,
			width, set_width
		end

create
	default_create,
	make_with_content

feature -- Output

	tag_name: STRING = "iframe"
			-- <Precursor>

end
