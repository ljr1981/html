note
	description: "[
		Representation of an {HTML_PAGE}.
		]"
	design: "[
		See class notes at the end of the class.
		]"

deferred class
	HTML_PAGE

inherit
	HTML_TAG
		export {NONE}
			contents,
			status, set_status,
			lang, set_lang,
			xml_lang, set_xml_lang,
			xmlns, set_xmlns
		redefine
			default_create,
			html_out,
			pretty_out
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			extend (head)
			extend (body)
		end

	make_standard (a_title, a_language_code: STRING; a_widget: HTML_DIV)
			-- `make_standard' with `a_title' and `a_language_code' using `a_widget'.
			-- The `a_widget' will be the first subordinate <tag> beneath <body>.
		note
			design: "[
				Page Building Steps
				===================
				(1) <html> ... attributes
					(1a) xmlns
					(1b) language
					(1c) xml-language
				(2) <head>
					(a) <title> (this element is required in an HTML document)
					(b) <style>
					(c) <base>
					(d) <link>
					(e) <meta>
					(f) <script>
					(g) <noscript>
				(3) <title>
				(4) <body>
				]"
			EIS: "name=cache_control_max_age",
					"src=https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/http-caching#cache-control"
		do
			set_xmlns ("http://www.w3.org/1999/xhtml")
			set_lang (a_language_code)
			set_xml_lang (a_language_code)

				-- Extendings
			extend (head)
			extend (body)

				-- Head
			head.extend (new_title)
				last_new_title.extend (new_text)
				last_new_text.set_text_content (a_title)

				-- Viewport
			head.extend (new_meta)
				last_new_meta.set_name ("viewport")
				last_new_meta.set_content ("width=device-width, initial-scale=1")

				-- Body content
			initialize_widget (a_widget)
			body.extend (a_widget)

				-- CSS and JavaScript elements at the end of the <body> tag.

				-- Other <script> and <style> tags
		end

	make_standard_with_raw_text (a_title, a_language_code, a_raw_text: STRING)
			-- `make_standard' with `a_title', `a_language_code', and `a_raw_text'.
			-- See `make_standard' for more feature comments.
		local
			l_div: HTML_DIV
		do
			create l_div
			l_div.extend (create {HTML_TEXT}.make_with_text (a_raw_text))
			make_standard (a_title, a_language_code, l_div)
		end

	initialize_widget (a_widget: HTML_DIV)
			-- `initialize_widget' `a_widget'.
		deferred
		end

feature -- Access

	head: like new_head
		attribute
			Result := new_head
		end

	body: like new_body
		attribute
			Result := new_body
		end

feature {NONE} -- Initialization Support

	manually_specified_css_files: ARRAY [STRING]
			-- A list of `manually_specified_css_files'
		deferred
		end

	manually_specified_javascript_files: ARRAY [STRING]
			-- A list of `manually_specified_javascript_files'
		deferred
		end

	build_head (a_widget: HTML_TAG; a_head: HTML_HEAD)
			-- Build the <head> ... </head> content.
		require
			not_built: not is_head_built
		local
--			l_javascript_files: HASH_TABLE [HTML_SCRIPT, INTEGER]
--			l_css_files: HASH_TABLE [HTML_LINK, INTEGER]
--			l_scripts: HASH_TABLE [HTML_SCRIPT, INTEGER]
		do
--			create l_javascript_files.make (50)
--			create l_css_files.make (50)
--			create l_scripts.make (50)

--				-- Handle all JS file references in <head>
--			a_widget.add_head_items (l_javascript_files, l_css_files, l_scripts)

--			across
--				l_javascript_files as ic_js
--			loop
--				a_head.add_content (ic_js.item)
--			end

--				-- Handle all CSS files references in <head>
--			across
--				l_css_files as ic_css
--			loop
--				a_head.add_content (ic_css.item)
--			end

--				-- Handle all "document ready" scripts in <head>
--			across
--				l_scripts as ic_scripts
--			loop
--				a_head.add_content (ic_scripts.item)
--			end
			is_head_built := True
		end

	is_head_built: BOOLEAN

feature -- Output

	html_out: STRING
			-- <Precursor>
			-- Add notion of `doctype' and other "<head>" items.
		do
			Result := doctype.twin
			Result.append_string_general (Precursor)
		end

	pretty_out: STRING
			-- <Precursor>
			-- Add notion of `doctype' and other "<head>" items.
		do
			Result := doctype.twin
			Result.append_string_general (Precursor)
		end

	tag_name: STRING = "html"
			-- <Precursor>

feature -- Adders

	add_css_link (a_href: STRING)
		local
			l_link: HTML_LINK
		do
			create l_link.make_as_css_file_link (a_href)
			head.extend (l_link)
		end

	add_javascript_script (a_src: STRING)
		local
			l_script: HTML_SCRIPT
		do
			create l_script.make_with_javascript_file_name (a_src)
			head.extend (l_script)
		end

feature {NONE} -- Implementation

	doctype: STRING = "<!DOCTYPE html>" -- "<!DOCTYPE html PUBLIC %"-//W3C//DTD XHTML 1.0 Strict//EN%" %"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd%">"
			-- `doctype' for HTML-5 (not 4.x or XML or other).
			-- This may (later on) need to be a class.

end
