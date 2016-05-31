note
	description: "[
		Abstract notion of an {HTML_FACTORY}
		]"
	design: "[
		The intent is to provide a factory for {HTML_TAG} things.
		]"

class
	HTML_FACTORY

feature -- Factories

	new_form: HTML_FORM do create Result; last_new_form := Result end
	last_new_form: like new_form attribute Result := new_form end

	new_input: HTML_INPUT do create Result; last_new_input := Result end
	last_new_input: like new_input attribute Result := new_input end

	new_textarea: HTML_TEXTAREA do create Result; last_new_textarea := Result end
	last_new_textarea: like new_textarea attribute Result := new_textarea end

	new_label: HTML_LABEL do create Result; last_new_label := Result end
	last_new_label: like new_label attribute Result := new_label end

	new_button: HTML_BUTTON do create Result; last_new_button := Result end
	last_new_button: like new_button attribute Result := new_button end

	new_hx: HTML_HEADLINE_X do create Result; last_new_hx := Result end
	last_new_hx: like new_hx attribute Result := new_hx end

	new_div: HTML_DIV do create Result; last_new_div := Result end
	last_new_div: like new_div attribute Result := new_div end

	new_header: HTML_HEADER do create Result; last_new_header := Result end
	last_new_header: like new_header attribute Result := new_header end

	new_nav: HTML_NAV do create Result; last_new_nav := Result end
	last_new_nav: like new_nav attribute Result := new_nav end

	new_ul, new_unordered_list: HTML_UL do create Result; last_new_ul := Result end
	last_new_ul, last_new_unordered_list: like new_ul attribute Result := new_ul end

	new_li, new_line_item: HTML_LI do create Result; last_new_li := Result end
	last_new_li, last_new_line_item: like new_li attribute Result := new_li end

	new_article: HTML_ARTICLE do create Result; last_new_article := Result end
	last_new_article: like new_article attribute Result := new_article end

	new_footer: HTML_FOOTER do create Result; last_new_footer := Result end
	last_new_footer: like new_footer attribute Result := new_footer end

	new_video: HTML_VIDEO do create Result; last_new_video := Result end
	last_new_video: like new_video attribute Result := new_video end

	new_image: HTML_IMG do create Result; last_new_image := Result end
	last_new_image: like new_image attribute Result := new_image end

	new_span: HTML_SPAN do create Result; last_new_span := Result end
	last_new_span: like new_span attribute Result := new_span end

end
