note
	description: "[
		Abstract notion of an {HTML_FACTORY}
		]"
	design: "[
		The intent is to provide a factory for {HTML_TAG} things.
		]"

class
	HTML_FACTORY

feature -- HTML Components

	new_youtube_video (a_src, a_frameborder: STRING a_height, a_width: INTEGER; a_is_allowfullscreen: BOOLEAN): HTML_IFRAME
		do
			Result := new_iframe
				last_new_iframe.set_src (a_src)
				last_new_iframe.set_frameborder (a_frameborder)
				last_new_iframe.set_height (a_height.out)
				last_new_iframe.set_width (a_width.out)
				if a_is_allowfullscreen then
					last_new_iframe.set_attribute_manual ("allowfullscreen", Void, False)
				end
		end

	new_google_map (a_height, a_width, a_frameborder, a_style, a_API_key, a_address: STRING): HTML_IFRAME
		note
			google: "[
				To use this {HTML_FACTORY} feature you will first need to do the following:
				
				(1) Access the Google API Manager (see EIS below)
				(2) Specifically, click the "Credentials" Link (see EIS below)
				(3) Ensure you have created an appropriate project (e.g. Spring Island)
				(4) Create an API Key for Google Maps (see EIS below)
				(5) Be sure the Google Maps Embed API is enabled (see EIS below)
				]"
			EIS: "name=Google_API_Manager",
					"src=https://console.developers.google.com/apis/dashboard?project=macro-approach-146612&duration=PT1H"
			EIS: "name=Google_API_Manager_Credentials",
					"src=https://console.developers.google.com/apis/credentials?project=macro-approach-146612"
			EIS: "name=Google_Maps_Embed_API_enabler",
					"src=https://console.developers.google.com/apis/api/maps_embed_backend/overview?project=macro-approach-146612&duration=PT1H"
		local
			l_address: STRING
		do
			Result := new_iframe
			Result.set_width (a_width)
			Result.set_height (a_height)
			Result.set_frameborder (a_frameborder)
			Result.set_style (a_style)
			l_address := a_address.twin
			l_address.replace_substring_all (" ", "+")
			Result.set_src ("https://www.google.com/maps/embed/v1/place?key=" + a_API_key + "&q=" + l_address)
		end

feature -- HTML Components: Parallax Section

	new_parallax_section (a_args: attached like last_new_parallax_section_cache): HTML_PARALLAX_SECTION
		do
			create Result.make (a_args.headline, a_args.image, a_args.optionals)
			last_new_parallax_section_cache := a_args
		end
	last_new_parallax_section_cache: detachable TUPLE [headline, image: STRING; optionals: TUPLE [subheadline, button_caption, button_href: detachable STRING]]
	last_new_parallax_section: like new_parallax_section
		attribute
			check
				attached last_new_parallax_section_cache as al_cache and then
				attached al_cache.headline as al_headline and then
				attached al_cache.image as al_image and then
				attached al_cache.optionals as al_optionals
			then
				Result := new_parallax_section (al_headline, al_image, al_optionals)
			end
		end

	new_parallax_section_with_subhead (a_args: attached like last_new_parallax_section_with_subhead_cache): HTML_PARALLAX_SECTION
		do
			create Result.make_with_subhead (a_args.headline, a_args.image, a_args.subhead)
			last_new_parallax_section_with_subhead_cache := a_args
		end
	last_new_parallax_section_with_subhead_cache: detachable TUPLE [headline, image, subhead: STRING]
	last_new_parallax_section_with_subhead: like new_parallax_section_with_subhead
		attribute
			check
				attached last_new_parallax_section_with_subhead_cache as al_cache and then
				attached al_cache.headline as al_headline and then
				attached al_cache.image as al_image and then
				attached al_cache.subhead as al_subhead
			then
				Result := new_parallax_section_with_subhead (al_headline, al_image, al_subhead)
			end
		end

	new_parallax_section_basic (a_args: attached like last_new_parallax_section_basic_cache): HTML_PARALLAX_SECTION
		do
			create Result.make_basic (a_args.headline, a_args.image)
			last_new_parallax_section_basic_cache := a_args
		end
	last_new_parallax_section_basic_cache: detachable TUPLE [headline, image: STRING]
	last_new_parallax_section_basic: like new_parallax_section_basic
		attribute
			check
				attached last_new_parallax_section_basic_cache as al_cache and then
				attached al_cache.headline as al_headline and then
				attached al_cache.image as al_image
			then
				Result := new_parallax_section_basic (al_headline, al_image)
			end
		end

feature -- CSS/JS Packages

	set_bootstrap_4_package (a_tag: HTML_TAG)
		note
			EIS: "src=https://v4-alpha.getbootstrap.com/"
		do
			set_package_contents (a_tag, <<bootstrap_4_0_0_alpha_6_min_css_cdn>>, to_head)
			set_package_contents (a_tag, <<
											jquery_core_1_12_4_min_js_cdn,
											cloudfare_ajax_tether_min_js_cdn,
											bootstrap_4_0_0_alpha_6_min_js_cnd
											>>, to_body)
		end

	set_datatables_zero_configuration_package (a_tag: HTML_TAG)
		note
			EIS: "src=https://datatables.net/examples/basic_init/zero_configuration.html"
		do
			set_package_contents (a_tag, <<jquery_core_1_12_4_min_js_cdn>>, to_head)
			set_package_contents (a_tag, <<
											datatables_1_10_15_js_jqueryui_min_js_cdn,
											datatables_1_10_15_css_datatables_min_css_cdn
											>>, to_body)
		end

	set_datatables_bootstrap_4_table_package (a_tag: HTML_TAG)
		note
			EIS: "src=https://datatables.net/examples/styling/bootstrap4.html"
		do
			set_package_contents (a_tag, <<jquery_core_1_12_4_min_js_cdn>>, to_head)
			set_package_contents (a_tag, <<
											datatables_1_10_15_js_datatables_min_js_cdn,
											datatables_1_10_15_js_bootstrap4_min_js_cdn
											>>, to_body)
		end

	set_datatables_bootstrap_4_editable_grid_package (a_tag: HTML_TAG)
			--
		note
			dependency: "[
				(1) Presumes have a subscription/access to the DataTables Editor CSS/JS package.
				(2) Presumes you have placed the DataTables Editor CSS/JS package files in your "files" folder.
				]"
			EIS: "src=https://editor.datatables.net/examples/styling/bootstrap4.html"
			EIS: "src=https://editor.datatables.net/manual/getting-started",
					"name=place_editor_datatables_files_in_assets"
		do
			set_datatables_bootstrap_4_table_package (a_tag)
			set_package_contents (a_tag, <<
											new_link.set_as_rel_type_href ("stylesheet", "text/css", "https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"),
											new_link.set_as_rel_type_href ("stylesheet", "text/css", "https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css"),
											new_link.set_as_rel_type_href ("stylesheet", "text/css", "editor.dataTables.min.css"),
											new_link.set_as_rel_type_href ("stylesheet", "text/css", "https://cdn.datatables.net/select/1.2.2/css/select.dataTables.min.css")
											>>, to_head)
			set_package_contents (a_tag, <<
											new_script.set_as_type_src ("text/javascript", "https://cdn.datatables.net/select/1.2.2/js/dataTables.select.min.js"),
											new_script.set_as_type_src ("text/javascript", "https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"),
											new_script.set_as_type_src ("text/javascript", "dataTables.editor.min.js")
											>>, to_body)

		end

feature {NONE} -- Package Builder

	to_head: BOOLEAN = True
	to_body: BOOLEAN = False

	set_package_contents (a_tag: HTML_TAG; a_list: ARRAY [HTML_TAG]; a_set_to_head: BOOLEAN)
		do
			if a_set_to_head then
				across
					a_list as ic
				loop
					if attached {HTML_LINK} ic.item as al_item then
						a_tag.add_link_head_item (al_item)
					elseif attached {HTML_SCRIPT} ic.item as al_item then
						a_tag.add_script_head_item (al_item)
					else
						check unknown_type: False end
					end
				end
			else
				across
					a_list as ic
				loop
					if attached {HTML_LINK} ic.item as al_item then
						a_tag.add_link_body_item (al_item)
					elseif attached {HTML_SCRIPT} ic.item as al_item then
						a_tag.add_script_body_item (al_item)
					else
						check unknown_type: False end
					end
				end
			end
		end

feature -- Cloudfare CDN: CSS



feature -- Cloudfare CDN: JS

	cloudfare_ajax_tether_min_js_cdn: HTML_SCRIPT
			--<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		attribute
			create Result
			Result.set_src ("https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js")
		end

feature -- Bootstrap 4 CDN: CSS

	bootstrap_4_0_0_alpha_6_min_css_cdn: HTML_LINK
			--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css")
		end

feature -- Bootstrap 4 CDN: JS

	bootstrap_4_0_0_alpha_6_min_js_cnd: HTML_SCRIPT
			--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		attribute
			create Result
			Result.set_src ("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js")
		end

feature -- JQeury CDN: CSS



feature -- JQuery CDN: JS

	jquery_core_3_2_1_slim_min_js_cdn: HTML_SCRIPT
			-- <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		attribute
			Result := javascript_script_template
			Result.set_src ("https://code.jquery.com/jquery-3.2.1.slim.min.js")
		end

	jquery_core_3_2_1_min_js_cdn: HTML_SCRIPT
			-- <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		attribute
			Result := javascript_script_template
--			Result.set_src ("https://code.jquery.com/jquery-3.2.1.min.js")
			Result.set_src ("https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js")
		end

	jquery_core_2_2_4_min_js_cdn: HTML_SCRIPT
			-- <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
		attribute
			Result := javascript_script_template
--			Result.set_src ("https://code.jquery.com/jquery-2.2.4.min.js")
			Result.set_src ("https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js")
		end

	jquery_core_1_12_4_min_js_cdn: HTML_SCRIPT
			-- <script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
		attribute
			Result := javascript_script_template
--			Result.set_src ("https://code.jquery.com/jquery-1.12.4.min.js")
			Result.set_src ("https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js")
		end

feature -- DataTable's CDN: CSS

	dataTables_1_10_15_css_bootstrap_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.css")
		end

	dataTables_1_10_15_css_bootstrap_min_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css")
		end

	dataTables_1_10_15_css_bootstrap_4_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap4.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap4.css")
		end

	dataTables_1_10_15_css_bootstrap_4_min_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap4.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.bootstrap4.min.css")
		end

	dataTables_1_10_15_css_foundation_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.foundation.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.foundation.css")
		end

	dataTables_1_10_15_css_foundation_min_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.foundation.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.foundation.min.css")
		end

	dataTables_1_10_15_css_jqueryui_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.jqueryui.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.jqueryui.css")
		end

	dataTables_1_10_15_css_jqueryui_min_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.jqueryui.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.jqueryui.min.css")
		end

	dataTables_1_10_15_css_material_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.material.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.material.css")
		end

	dataTables_1_10_15_css_material_min_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.material.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.material.min.css")
		end

	dataTables_1_10_15_css_semanticui_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.semanticui.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.semanticui.css")
		end

	dataTables_1_10_15_css_semanticui_min_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.semanticui.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.semanticui.min.css")
		end

	dataTables_1_10_15_css_uikit_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.uikit.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.uikit.css")
		end

	dataTables_1_10_15_css_uikit_min_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/dataTables.uikit.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/dataTables.uikit.min.css")
		end

	dataTables_1_10_15_css_dataTables_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css")
		end

	dataTables_1_10_15_css_dataTables_min_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css")
		end

	dataTables_1_10_15_css_dataTables_themeroller_css_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/css/jquery.dataTables_themeroller.css
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("stylesheet")
			Result.set_href ("http://cdn.datatables.net/1.10.15/css/jquery.dataTables_themeroller.css")
		end

feature -- DataTable's CDN: Images

	dataTables_1_10_15_images_sort_asc_png_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/images/sort_asc.png
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("image")
			Result.set_href ("http://cdn.datatables.net/1.10.15/images/sort_asc.png")
		end

	dataTables_1_10_15_images_sort_asc_disabled_png_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/images/sort_asc_disabled.png
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("image")
			Result.set_href ("http://cdn.datatables.net/1.10.15/images/sort_asc_disabled.png")
		end

	dataTables_1_10_15_images_sort_both_png_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/images/sort_both.png
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("image")
			Result.set_href ("http://cdn.datatables.net/1.10.15/images/sort_both.png")
		end

	dataTables_1_10_15_images_sort_desc_png_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/images/sort_desc.png
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("image")
			Result.set_href ("http://cdn.datatables.net/1.10.15/images/sort_desc.png")
		end

	dataTables_1_10_15_images_sort_desc_disabled_png_cdn: HTML_LINK
			--http://cdn.datatables.net/1.10.15/images/sort_desc_disabled.png
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result.set_rel ("image")
			Result.set_href ("http://cdn.datatables.net/1.10.15/images/sort_desc_disabled.png")
		end

feature -- DataTable's CDN: JS

	dataTables_1_10_15_js_bootstrap_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.js")
		end

	dataTables_1_10_15_js_bootstrap_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js")
		end

	dataTables_1_10_15_js_bootstrap4_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.js")
		end

	dataTables_1_10_15_js_bootstrap4_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.min.js")
		end

	dataTables_1_10_15_js_foundation_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.foundation.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.foundation.js")
		end

	dataTables_1_10_15_js_foundation_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.foundation.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.foundation.min.js")
		end

	dataTables_1_10_15_js_jqueryui_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.js")
		end

	dataTables_1_10_15_js_jqueryui_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.jqueryui.min.js")
		end

	dataTables_1_10_15_js_material_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.material.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.material.js")
		end

	dataTables_1_10_15_js_material_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.material.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.material.min.js")
		end

	dataTables_1_10_15_js_semanticui_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.semanticui.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.semanticui.js")
		end

	dataTables_1_10_15_js_semanticui_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.semanticui.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.semanticui.min.js")
		end

	dataTables_1_10_15_js_uikit_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.uikit.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.uikit.js")
		end

	dataTables_1_10_15_js_uikit_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/dataTables.uikit.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/dataTables.uikit.min.js")
		end

	dataTables_1_10_15_js_dataTables_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js")
		end

	dataTables_1_10_15_js_dataTables_min_js_cdn: HTML_SCRIPT
			--http://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js
		note
			EIS: "src=http://cdn.datatables.net/1.10.15/"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("http://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js")
		end


	dataTables_buttons_1_3_1_buttons_min_js_cdn: HTML_SCRIPT
			--https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js
		note
			EIS: "src=https://editor.datatables.net/examples/styling/bootstrap4.html"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js")
		end

	dataTables_buttons_1_3_1_bootstrap_4_min_js_cdn: HTML_SCRIPT
			--https://cdn.datatables.net/buttons/1.3.1/js/buttons.bootstrap4.min.js
		note
			EIS: "src=https://editor.datatables.net/examples/styling/bootstrap4.html"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("https://cdn.datatables.net/buttons/1.3.1/js/buttons.bootstrap4.min.js")
		end

	dataTables_select_1_2_2_js_select_min_js_cdn: HTML_SCRIPT
			--https://cdn.datatables.net/select/1.2.2/js/dataTables.select.min.js
		note
			EIS: "src=https://editor.datatables.net/examples/styling/bootstrap4.html"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("https://cdn.datatables.net/select/1.2.2/js/dataTables.select.min.js")
		end

	dataTables_extensions_editor_min_js_cdn: HTML_SCRIPT
			--https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js
		note
			EIS: "src=https://editor.datatables.net/examples/styling/bootstrap4.html"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js")
		end

	dataTables_extensions_editor_bootstrap_4_min_js_cdn: HTML_SCRIPT
			--https://editor.datatables.net/extensions/Editor/js/editor.bootstrap4.min.js
		note
			EIS: "src=https://editor.datatables.net/examples/styling/bootstrap4.html"
		attribute
			create Result
			Result := javascript_script_template
			Result.set_src ("https://editor.datatables.net/extensions/Editor/js/editor.bootstrap4.min.js")
		end

feature {NONE} -- JS <script> Template

	javascript_script_template: HTML_SCRIPT
			-- Just add `set_src' to complete it.
		do
			create Result
			Result.set_type ("text/javascript")
		end

feature -- Text Element Factory

	new_text_content: STRING do create Result.make_empty; last_new_text_content := Result end
	last_new_text_content: like new_text_content attribute Result := new_text_content end

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

	new_i: HTML_I do create Result; last_new_i := Result end
	last_new_i: like new_i attribute Result := new_i end

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

	new_page: HTML_PAGE_GENERIC do create Result; last_new_page := Result end
	last_new_page: like new_page attribute Result := new_page end

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

	new_comment: HTML_COMMENT do create Result; last_new_comment := Result end
	last_new_comment: like new_comment attribute Result := new_comment end

	new_image: HTML_IMG do create Result; Result.set_alt ("missing_alt"); last_new_image := Result end
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
