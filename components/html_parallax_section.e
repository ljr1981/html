class
	HTML_PARALLAX_SECTION

inherit
	HTML_SECTION

create
	make,
	make_basic,
	make_with_subhead

feature {NONE} -- Initialization

	make_basic (a_headline, a_image: STRING)
			-- `make_basic' with `a_headline' and `a_image'.
		local
			l_section_overlay_layer, l_container, l_row: HTML_DIV
		do
				-- Section (Current)
			set_class_names ("call-to-action")
			append_class_name ("ribbon-wrap")
			set_id ("ribbon")
			set_style ("background-image:url(" + a_image + ")")
			set_aria_label ("Ribbon")

				-- Section Overlay Layer
			l_section_overlay_layer := new_div
			l_section_overlay_layer.set_class_names ("section-overlay-layer")
			extend (l_section_overlay_layer)

				-- Container
			l_container := new_div
			l_container.set_class_names ("container")
			l_section_overlay_layer.extend (l_container)

				-- Row
			l_row := new_div
			l_row.set_class_names ("row")
			l_container.extend (l_row)

				-- Column
			l_row.extend (column)

				-- Headline(s)
			new_h2.set_class_names ("white-text")
			last_new_h2.append_class_name ("strong")
			last_new_h2.set_text_content (a_headline)
			column.extend (last_new_h2)
		end

	make_with_subhead (a_headline, a_image, a_subheadline: STRING)
			-- `make_with_subhead' using `a_headline', `a_subheadline' and `a_image' underlay.
		do
			make (a_headline, a_image, a_subheadline, Void, Void)
		end

	make (a_headline, a_image: STRING; a_optionals: TUPLE [subheadline, button_caption, button_href: detachable STRING])
			-- `make' with `a_headline' and `a_image', optional `a_subheadline',
			--		optional button of `a_button_caption' with `a_button_href'.
		do
			make_basic (a_headline, a_image)

			if attached a_optionals.subheadline as al_subheadline then
				add_subhead (al_subheadline)
			end

				-- Optional button
			if
				attached a_optionals.button_caption as al_button_caption and then
				attached a_optionals.button_href as al_button_href
			then
				add_button (al_button_caption, al_button_href)
			end
		end

feature {NONE} -- Basic Ops

	add_subhead (a_subheadline: STRING)
		do
			new_h5.set_class_names ("white-text")
			last_new_h5.append_class_name ("strong")
			last_new_h5.set_text_content (a_subheadline)
			column.extend (last_new_h5)
		end

	add_button (a_caption, a_href: STRING)
		do
			new_button.set_class_names ("btn")
			last_new_button.append_class_name ("btn-primary")
			last_new_button.append_class_name ("standard-button")
			last_new_button.set_type ("button")

			last_new_button.extend (new_a)
			last_new_a.set_href (a_href)
			last_new_a.set_text_content (a_caption)

			column.extend (last_new_button)
			new_span.set_class_names ("screen-read-text")
			column.extend (last_new_span)
		end

feature {NONE} -- Elements

	column: like new_div
		once ("object")
			Result := new_div
			Result.set_class_names ("col-md-8")
			Result.append_class_name ("col-md-offset-2")
		end

end
