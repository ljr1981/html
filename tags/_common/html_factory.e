note
	description: "[
		Abstract notion of an {HTML_FACTORY}
		]"
	design: "[
		The intent is to provide a factory for {HTML_TAG} things.
		]"

class
	HTML_FACTORY

feature -- Text Element Factory

	new_text: HTML_TEXT do create Result; last_new_text := Result end
	last_new_text: like new_text attribute Result := new_text end

feature -- Block Element Factories

	new_article: HTML_ARTICLE do create Result; last_new_article := Result end
	last_new_article: like new_article attribute Result := new_article end

	new_aside: HTML_ASIDE do create Result; last_new_aside := Result end
	last_new_aside: like new_aside attribute Result := new_aside end

	new_blockquote: HTML_BLOCKQUOTE do create Result; last_new_blockquote := Result end
	last_new_blockquote: like new_blockquote attribute Result := new_blockquote end

	new_cite: HTML_CITE do create Result; last_new_cite := Result end
	last_new_cite: like new_cite attribute Result := new_cite end

	new_code: HTML_CODE do create Result; last_new_code := Result end
	last_new_code: like new_code attribute Result := new_code end

	new_div: HTML_DIV do create Result; last_new_div := Result end
	last_new_div: like new_div attribute Result := new_div end

	new_figure: HTML_FIGURE do create Result; last_new_figure := Result end
	last_new_figure: like new_figure attribute Result := new_figure end

	new_footer: HTML_FOOTER do create Result; last_new_footer := Result end
	last_new_footer: like new_footer attribute Result := new_footer end

	new_iframe: HTML_IFRAME do create Result; last_new_iframe := Result end
	last_new_iframe: like new_iframe attribute Result := new_iframe end

	new_main: HTML_MAIN do create Result; last_new_main := Result end
	last_new_main: like new_main attribute Result := new_main end

	new_mark: HTML_MARK do create Result; last_new_mark := Result end
	last_new_mark: like new_mark attribute Result := new_mark end

	new_nav: HTML_NAV do create Result; last_new_nav := Result end
	last_new_nav: like new_nav attribute Result := new_nav end

	new_p: HTML_P do create Result; last_new_p := Result end
	last_new_p: like new_p attribute Result := new_p end

	new_section: HTML_SECTION do create Result; last_new_section := Result end
	last_new_section: like new_section attribute Result := new_section end

	new_small: HTML_SMALL do create Result; last_new_small := Result end
	last_new_small: like new_small attribute Result := new_small end

	new_span: HTML_SPAN do create Result; last_new_span := Result end
	last_new_span: like new_span attribute Result := new_span end

feature -- Form Element Factories

	new_button: HTML_BUTTON do create Result; last_new_button := Result end
	last_new_button: like new_button attribute Result := new_button end

	new_checkbox_group: HTML_CHECKBOX_GROUP do create Result; last_new_checkbox_group := Result end
	last_new_checkbox_group: like new_checkbox_group attribute Result := new_checkbox_group end

	new_fieldset: HTML_FIELDSET do create Result; last_new_fieldset := Result end
	last_new_fieldset: like new_fieldset attribute Result := new_fieldset end

	new_form: HTML_FORM do create Result; last_new_form := Result end
	last_new_form: like new_form attribute Result := new_form end

	new_form_component: HTML_FORM_COMPONENT do create Result; last_new_form_component := Result end
	last_new_form_component: like new_form_component attribute Result := new_form_component end

	new_input: HTML_INPUT do create Result; last_new_input := Result end
	last_new_input: like new_input attribute Result := new_input end

	new_label: HTML_LABEL do create Result; last_new_label := Result end
	last_new_label: like new_label attribute Result := new_label end

	new_legend: HTML_LEGEND do create Result; last_new_legend := Result end
	last_new_legend: like new_legend attribute Result := new_legend end

	new_optgroup: HTML_OPTGROUP do create Result; last_new_optgroup := Result end
	last_new_optgroup: like new_optgroup attribute Result := new_optgroup end

	new_option: HTML_OPTION do create Result; last_new_option := Result end
	last_new_option: like new_option attribute Result := new_option end

	new_radio_input_field: HTML_RADIO_INPUT_FIELD do create Result; last_new_radio_input_field := Result end
	last_new_radio_input_field: like new_radio_input_field attribute Result := new_radio_input_field end

	new_radio_input_field_group: HTML_RADIO_INPUT_FIELD_GROUP do create Result; last_new_radio_input_field_group := Result end
	last_new_radio_input_field_group: like new_radio_input_field_group attribute Result := new_radio_input_field_group end

	new_select: HTML_SELECT do create Result; last_new_select := Result end
	last_new_select: like new_select attribute Result := new_select end

	new_textarea: HTML_TEXTAREA do create Result; last_new_textarea := Result end
	last_new_textarea: like new_textarea attribute Result := new_textarea end

	new_text_input_field: HTML_TEXT_INPUT_FIELD do create Result; last_new_text_input_field := Result end
	last_new_text_input_field: like new_text_input_field attribute Result := new_text_input_field end

	new_text_input_field_group: HTML_TEXT_INPUT_FIELD_GROUP do create Result; last_new_text_input_field_group := Result end
	last_new_text_input_field_group: like new_text_input_field_group attribute Result := new_text_input_field_group end

feature -- Heading Element Factories

	new_h1: HTML_H1 do create Result; last_new_h1 := Result end
	last_new_h1: like new_h1 attribute Result := new_h1 end

	new_h2: HTML_H2 do create Result; last_new_h2 := Result end
	last_new_h2: like new_h2 attribute Result := new_h2 end

	new_h3: HTML_H3 do create Result; last_new_h3 := Result end
	last_new_h3: like new_h3 attribute Result := new_h3 end

	new_h4: HTML_H4 do create Result; last_new_h4 := Result end
	last_new_h4: like new_h4 attribute Result := new_h4 end

	new_h5: HTML_H5 do create Result; last_new_h5 := Result end
	last_new_h5: like new_h5 attribute Result := new_h5 end

	new_h6: HTML_H6 do create Result; last_new_h6 := Result end
	last_new_h6: like new_h6 attribute Result := new_h6 end

	new_header: HTML_HEADER do create Result; last_new_header := Result end
	last_new_header: like new_header attribute Result := new_header end

	new_hx: HTML_HEADLINE_X do create Result; last_new_hx := Result end
	last_new_hx: like new_hx attribute Result := new_hx end

feature -- Inline Element Factories

	new_a: HTML_A do create Result; last_new_a := Result end
	last_new_a: like new_a attribute Result := new_a end

	new_image: HTML_IMG do create Result; last_new_image := Result end
	last_new_image: like new_image attribute Result := new_image end

feature -- List Element Factories

	new_dd: HTML_DD do create Result; last_new_dd := Result end
	last_new_dd: like new_dd attribute Result := new_dd end

	new_dl: HTML_DL do create Result; last_new_dl := Result end
	last_new_dl: like new_dl attribute Result := new_dl end

	new_dt: HTML_DT do create Result; last_new_dt := Result end
	last_new_dt: like new_dt attribute Result := new_dt end

	new_menu: HTML_MENU do create Result; last_new_menu := Result end
	last_new_menu: like new_menu attribute Result := new_menu end

	new_ol, new_ordered_list: HTML_OL do create Result; last_new_ol := Result end
	last_new_ol, last_new_ordered_list: like new_ol attribute Result := new_ol end

	new_ul, new_unordered_list: HTML_UL do create Result; last_new_ul := Result end
	last_new_ul, last_new_unordered_list: like new_ul attribute Result := new_ul end

	new_li, new_line_item: HTML_LI do create Result; last_new_li := Result end
	last_new_li, last_new_line_item: like new_li attribute Result := new_li end

feature -- Media Element Factories

	new_source: HTML_SOURCE do create Result; last_new_source := Result end
	last_new_source: like new_source attribute Result := new_source end

	new_video: HTML_VIDEO do create Result; last_new_video := Result end
	last_new_video: like new_video attribute Result := new_video end

feature -- Misc Element Factories

	new_br: HTML_BR do create Result; last_new_br := Result end
	last_new_br: like new_br attribute Result := new_br end

	new_hr: HTML_HR do create Result; last_new_hr := Result end
	last_new_hr: like new_hr attribute Result := new_hr end

	new_strong: HTML_STRONG do create Result; last_new_strong := Result end
	last_new_strong: like new_strong attribute Result := new_strong end

feature -- Page Element Factories

	new_base: HTML_BASE do create Result; last_new_base := Result end
	last_new_base: like new_base attribute Result := new_base end

	new_body: HTML_BODY do create Result; last_new_body := Result end
	last_new_body: like new_body attribute Result := new_body end

	new_head: HTML_HEAD do create Result; last_new_head := Result end
	last_new_head: like new_head attribute Result := new_head end

	new_link: HTML_LINK do create Result; last_new_link := Result end
	last_new_link: like new_link attribute Result := new_link end

	new_meta: HTML_META do create Result; last_new_meta := Result end
	last_new_meta: like new_meta attribute Result := new_meta end

	new_page: HTML_PAGE do create Result; last_new_page := Result end
	last_new_page: like new_page attribute Result := new_page end

	new_script: HTML_SCRIPT do create Result; last_new_script := Result end
	last_new_script: like new_script attribute Result := new_script end

	new_style: HTML_STYLE do create Result; last_new_style := Result end
	last_new_style: like new_style attribute Result := new_style end

	new_title: HTML_TITLE do create Result; last_new_title := Result end
	last_new_title: like new_title attribute Result := new_title end

feature -- Table Element Factories

	new_caption: HTML_CAPTION do create Result; last_new_caption := Result end
	last_new_caption: like new_caption attribute Result := new_caption end

	new_col: HTML_COL do create Result; last_new_col := Result end
	last_new_col: like new_col attribute Result := new_col end

	new_colgroup: HTML_COLGROUP do create Result; last_new_colgroup := Result end
	last_new_colgroup: like new_colgroup attribute Result := new_colgroup end

	new_table: HTML_TABLE do create Result; last_new_table := Result end
	last_new_table: like new_table attribute Result := new_table end

	new_tbody: HTML_TBODY do create Result; last_new_tbody := Result end
	last_new_tbody: like new_tbody attribute Result := new_tbody end

	new_td: HTML_TD do create Result; last_new_td := Result end
	last_new_td: like new_td attribute Result := new_td end

	new_tfoot: HTML_TFOOT do create Result; last_new_tfoot := Result end
	last_new_tfoot: like new_tfoot attribute Result := new_tfoot end

	new_th: HTML_TH do create Result; last_new_th := Result end
	last_new_th: like new_th attribute Result := new_th end

	new_thead: HTML_THEAD do create Result; last_new_thead := Result end
	last_new_thead: like new_thead attribute Result := new_thead end

	new_tr: HTML_TR do create Result; last_new_tr := Result end
	last_new_tr: like new_tr attribute Result := new_tr end

end
