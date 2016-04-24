note
	description: "[
		Abstract notion of an {HTML_TAG}.
		]"

deferred class
	HTML_TAG

inherit
	HTML_ANY
		undefine
			out
		end

	HTML_ATTRIBUTES

feature {NONE} -- Initialization

	make_with_content (a_content: ARRAY [attached like content_anchor])
			-- `make_with_content' using `a_content' into `html_content_items'
		do
			across
				a_content as ic_content
			loop
				html_content_items.force (ic_content.item)
			end
		end

feature -- Style

	style_rule: CSS_RULE
			-- `style_rule'.
		attribute
			create Result
		end

	style_out: STRING
			-- `style_out' string representation of `style_rule'.
		do
			Result := style_rule.out
			across
				html_content_items as ic_items
			loop
				Result.append_string_general (ic_items.item.style_out)
			end
		end

	html_content_items: ARRAYED_LIST [attached like content_anchor]
			-- `html_content_items' for Current {HTML_TAG}
		attribute
			create Result.make (Default_capacity)
		end

	text_content: STRING
			-- `text_content' of Current {HTML_TAG}.
		attribute
			create Result.make_empty
		end

feature -- Settings

	add_content (a_item: attached like content_anchor)
			-- `add_content' `a_item' to `html_content_items'
		do
			html_content_items.force (a_item)
		end

	set_text_content (a_text: like text_content)
			-- `set_text_content' with `a_text'.
		do
			text_content := a_text
		ensure
			set: text_content.same_string (a_text)
		end

feature -- Output

	html_out: STRING
			-- `html_out' of Current {HTML_TAG}.
		note
			design_question: "[

				]"
		do
			create Result.make_empty
			Result.append_string (start_tag)
			if attached attributes_out as al_attributes_out and then not al_attributes_out.is_empty then
				Result.replace_substring_all (tag_attributes_tag, " " + al_attributes_out)
			else
				Result.replace_substring_all (tag_attributes_tag, create {STRING}.make_empty)
			end
			across
				html_content_items as ic_content_list
			loop
				Result.append_string (ic_content_list.item.html_out)
			end
			Result.append_string (html_content)
			Result.append_string (text_content)
			Result.append_string (end_tag)
		end

	tag_name: STRING
			-- `tag_name' for `html_out' of Current {HTML_TAG}.
		deferred
		end

feature {NONE} -- Implementation

	html_content: like html_out
			-- `html_content' that goes into `html_out' between `start_tag' and `end_tag'.
		deferred
		end

feature {NONE} -- Implementation: Constants

	content_anchor: detachable HTML_TAG
			-- `content_anchor' for Current {HTML_TAG}.

	start_tag: STRING
		once ("object")
			if not tag_name.is_empty then
				Result := "<" + tag_name + tag_attributes_tag + ">"
			else
				Result := ""
			end
		end

	end_tag: STRING
		once ("object")
			if not tag_name.is_empty then
				Result := "</" + tag_name + ">"
			else
				Result := ""
			end
		end

	tag_attributes_tag: STRING = "<<TAG_ATTRIBUTES>>"

end
