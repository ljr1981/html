note
	description: "[
		Representation of an {HTML_HEADER}.
		]"

class
	HTML_HEADER

inherit
	HTML_TAG
		export {ANY}
			href, set_href,
			itemscope, set_itemscope,
			itemtype, set_itemtype
		end

create
	default_create,
	make_with_content

feature -- Settings

	add_image (a_image: HTML_IMG)
			-- `add_image' `a_image' to Current.
		note
			TODO: "Move this up in inheritance (see HTML_FOOTER as well)"
		do
			extend (a_image)
		end

	add_images (a_images: ARRAY [TUPLE [id, src: STRING]])
			-- `add_images' `a_images' as {ARRAY} of `id' and `src'.
		note
			TODO: "Move this up in inheritance (see HTML_FOOTER as well)"
		local
			l_img: HTML_IMG
		do
			across
				a_images as ic_images
			loop
				create l_img.make_with_src (ic_images.item.src)
				l_img.set_id (ic_images.item.id)
				extend (l_img)
			end
		end

	set_id_and_href (a_id, a_href: STRING)
			-- `set_id_and_href' with `a_id' and `a_href'.
			-- Example: <header id="#" href="blah"> ... </header>
		local
			l_a: HTML_A
		do
			create l_a.make_with_id_and_href (a_id, a_href)
			extend (l_a)
		end

feature -- Output

	tag_name: STRING = "header"
			-- <Precursor>

;note
	design: "[
		The <header> element represents a container for introductory content or a set of navigational links.
		]"
	EIS: "name=base", "src=http://www.w3schools.com/tags/tag_header.asp"


end
