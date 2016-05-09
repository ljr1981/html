note
	description: "[
		Respresentataion of {HTML_UNORDERED_LIST}
		]"

class
	HTML_UNORDERED_LIST

inherit
	HTML_ANY
		undefine
			out,
			default_create
		end

	HTML_DIV

create
	default_create,
	make_with_html_list_items,
	make_with_text_list_items

feature {NONE} -- Initialization

	make_with_html_list_items (a_list_items: ARRAY [HTML_LI])
			-- `make_with_html_list_items' in `a_list_items' into `item' content.
		do
			item.do_nothing
			across
				a_list_items as ic_list_items
			loop
				item.html_content_items.force (ic_list_items.item)
			end
			default_create
		ensure
			set: across a_list_items as ic all item.html_content_items.has (ic.item) end
		end

	make_with_text_list_items (a_text_list_items: ARRAY [STRING])
			--`make_with_text_list_items' in `a_list_items' into `item' content.
		do
			item.do_nothing
			across
				a_text_list_items as ic_text_list_items
			loop
				item.html_content_items.force (create {HTML_LI}.make_with_raw_text (ic_text_list_items.item))
			end
			default_create
		ensure
			set: across a_text_list_items as ic all
						across item.html_content_items as ic_html some
							ic_html.item.text_content.same_string (ic.item)
						end
				end
		end

feature -- Access

	item: HTML_UL
			-- `item' content for {HTML_UNORDERED_LIST}.
		attribute
			create Result
			html_content_items.force (Result)
		ensure
			set: html_content_items.has (Result)
		end

end
