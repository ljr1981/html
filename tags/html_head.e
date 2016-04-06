note
	description: "[
		Representation of an {HTML_HEAD}.
		]"

class
	HTML_HEAD

inherit
	HTML_TAG

feature -- Output

	html_content: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_HEAD}.
		do
			create Result.make_empty
			if attached title as al_title then Result.append_string (al_title.html_out) end
			if attached base as al_base then Result.append_string (al_base.html_out) end
			if attached link as al_link then Result.append_string (al_link.html_out) end
			if attached meta as al_meta then Result.append_string (al_meta.html_out) end
			if attached script as al_script then Result.append_string (al_script.html_out) end
			if attached style as al_style then Result.append_string (al_style.html_out) end
		end

	tag_name: STRING = "head"
			-- <Precursor>

feature -- Settings

	set_title (a_title: like title)
			-- `set_title' with `a_title' into `title'.
		do
			title := a_title
		ensure
			set: title ~ a_title
		end

	set_base (a_base: like base)
			-- `set_base' with `a_base' into `base'.
		do
			base := a_base
		ensure
			set: base ~ a_base
		end

	set_link (a_link: like link)
			-- `set_link' with `a_link' into `link'.
		do
			link := a_link
		ensure
			set: link ~ a_link
		end

	set_meta (a_meta: like meta)
			-- `set_meta' with `a_meta' into `meta'.
		do
			meta := a_meta
		ensure
			set: meta ~ a_meta
		end

	set_script (a_script: like script)
			-- `set_script' with `a_script' into `script'.
		do
			script := a_script
		ensure
			set: script ~ a_script
		end

	set_style (a_style: like style)
			-- `set_style' with `a_style' into `style'.
		do
			style := a_style
		ensure
			set: style ~ a_style
		end

feature {NONE} -- Implementation

	title: detachable HTML_TITLE
			-- `title' of Current {HTML_PAGE}.

	base: detachable HTML_BASE
			-- `base' of Current {HTML_PAGE}.

	link: detachable HTML_LINK
			-- `link' of Current {HTML_PAGE}.

	meta: detachable HTML_META
			-- `meta' of Current {HTML_PAGE}.

	script: detachable HTML_SCRIPT
			-- `script' of Current {HTML_PAGE}.

	style: detachable HTML_STYLE
			-- `style' of Current {HTML_PAGE}.

;note
	design: "[
Tag    Description
<head>    Defines information about the document
		]"
	EIS: "name=head", "src=http://www.w3schools.com/tags/tag_head.asp"

end
