note
	description: "[
		Respresentataion of {HTML_UNORDERED_LIST}
		]"

class
	HTML_UNORDERED_LIST

inherit
	HTML_ANY
		undefine
			out
		end

	HTML_DIV

create
	default_create,
	make_with_html_list_items

feature {NONE} -- Initialization

	make_with_html_list_items (a_list_items: ARRAY [HTML_LI])
			-- `make_with_html_list_item' in `a_list_items' into `item' content.

		do
			item.do_nothing
			across
				a_list_items as ic_list_items
			loop
				item.html_content_items.force (ic_list_items.item)
			end
		ensure
			set: across a_list_items as ic all item.html_content_items.has (ic.item) end
		end

feature -- Access

	item: HTML_UL
			-- `item' content for {HTML_UNORDERED_LIST}
		attribute
			create Result
			html_content_items.force (Result)
		ensure
			set: html_content_items.has (Result)
		end

end
