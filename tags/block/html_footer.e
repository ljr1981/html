note
	description: "[
		Representation of an {HTML_FOOTER}.
		]"

class
	HTML_FOOTER

inherit
	HTML_TAG

create
	default_create,
	make_with_content

feature -- Settings

	add_images (a_images: ARRAY [TUPLE [id, src: STRING]])
		local
			l_img: HTML_IMG
		do
			across
				a_images as ic_images
			loop
				create l_img.make_with_src (ic_images.item.src)
				l_img.set_id (ic_images.item.id)
				add_content (l_img)
			end
		end

feature -- Output

	tag_name: STRING = "footer"
			-- <Precursor>

;note
	design: "[
Tag    Description
<footer>    Defines a footer for a document or section
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_footer.asp"

end
