note
	description: "[
		Representation of an effected {HTML_DIV_FACTORY}.
		]"

class
	HTML_DIV_FACTORY

inherit
	HTML_DIV

feature -- Factories

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

note
	design_intent: "[
		This object factory is intended to be used as a based
		for web components, where one wants to easily add other
		enclosed or contained components.
		]"

end
