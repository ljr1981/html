note
	description: "[
		Representation of an effected {HTML_DIV_FACTORY}.
		]"

class
	HTML_DIV_FACTORY

inherit
	HTML_DIV

feature -- Factories

	new_div: HTML_DIV do create Result; current_div := Result end
	current_div: like new_div attribute Result := new_div end

	new_header: HTML_HEADER do create Result; current_header := Result end
	current_header: like new_header attribute Result := new_header end

	new_nav: HTML_NAV do create Result; current_nav := Result end
	current_nav: like new_nav attribute Result := new_nav end

	new_ul, new_unordered_list: HTML_UL do create Result; current_ul := Result end
	current_ul, current_unordered_list: like new_ul attribute Result := new_ul end

	new_li, new_line_item: HTML_LI do create Result; current_li := Result end
	current_li, current_line_item: like new_li attribute Result := new_li end

	new_article: HTML_ARTICLE do create Result; current_article := Result end
	current_article: like new_article attribute Result := new_article end

	new_footer: HTML_FOOTER do create Result; current_footer := Result end
	current_footer: like new_footer attribute Result := new_footer end

	new_video: HTML_VIDEO do create Result; current_video := Result end
	current_video: like new_video attribute Result := new_video end

note
	design_intent: "[
		This object factory is intended to be used as a based
		for web components, where one wants to easily add other
		enclosed or contained components.
		]"

end
