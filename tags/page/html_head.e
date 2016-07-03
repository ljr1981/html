note
	description: "[
		Representation of an {HTML_HEAD}.
		]"

class
	HTML_HEAD

inherit
	HTML_TAG
		redefine
			html_out,
			pretty_out
		end

create
	default_create,
	make_with_content

feature -- Output

	html_out: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_HEAD}.
		do
			Result := start_tag.twin

				-- Tag attributes ...
			if attached attributes_out as al_attributes_out and then not al_attributes_out.is_empty then
				Result.replace_substring_all (tag_attributes_tag, " " + al_attributes_out)
			else
				Result.replace_substring_all (tag_attributes_tag, create {STRING}.make_empty)
			end

			if attached title_tag as al_title then Result.append_string (al_title.html_out) end
			if attached base_tag as al_base then Result.append_string (al_base.html_out) end
			if attached link_tag as al_link then Result.append_string (al_link.html_out) end
			if attached meta_tag as al_meta then Result.append_string (al_meta.html_out) end
			if attached script_tag as al_script then Result.append_string (al_script.html_out) end
			if attached style_tag as al_style then Result.append_string (al_style.html_out) end

			Result.append_string (end_tag)
		end

	pretty_out: STRING
			-- <Precursor>
			-- HTML output for Current {HTML_HEAD}.
		do
			Result := start_tag.twin
			Result.append_character ('%N'); Result.append_character ('%T')

				-- Tag attributes ...
			if attached attributes_out as al_attributes_out and then not al_attributes_out.is_empty then
				Result.replace_substring_all (tag_attributes_tag, " " + al_attributes_out)
			else
				Result.replace_substring_all (tag_attributes_tag, create {STRING}.make_empty)
			end

			if attached title_tag as al_title then Result.append_string (al_title.html_out) end
			Result.append_character ('%N'); Result.append_character ('%T')
			if attached base_tag as al_base then
				Result.append_string (al_base.html_out)
				Result.append_character ('%N'); Result.append_character ('%T')
			end
			if attached link_tag as al_link then
				Result.append_string (al_link.html_out)
				Result.append_character ('%N'); Result.append_character ('%T')
			end
			if attached meta_tag as al_meta then
				Result.append_string (al_meta.html_out)
				Result.append_character ('%N'); Result.append_character ('%T')
			end
			if attached script_tag as al_script then
				Result.append_string (al_script.html_out)
				Result.append_character ('%N'); Result.append_character ('%T')
			end
			if attached style_tag as al_style then
				Result.append_string (al_style.html_out)
				Result.append_character ('%N'); Result.append_character ('%T')
			end

			Result.append_string (end_tag)
			Result.append_character ('%N'); Result.append_character ('%T')
		end

	tag_name: STRING = "head"
			-- <Precursor>

feature -- Settings

	set_title_tag (a_title: like title_tag)
			-- `set_title_tag' with `a_title' into `title_tag'.
		do
			title_tag := a_title
		ensure
			set: title_tag ~ a_title
		end

	set_base_tag (a_base: like base_tag)
			-- `set_base_tag' with `a_base' into `base_tag'.
		do
			base_tag := a_base
		ensure
			set: base_tag ~ a_base
		end

	set_link_tag (a_link: like link_tag)
			-- `set_link_tag' with `a_link' into `link_tag'.
		do
			link_tag := a_link
		ensure
			set: link_tag ~ a_link
		end

	set_meta_tag (a_meta: like meta_tag)
			-- `set_meta_tag' with `a_meta' into `meta_tag'.
		do
			meta_tag := a_meta
		ensure
			set: meta_tag ~ a_meta
		end

	set_script_tag (a_script: like script_tag)
			-- `set_script_tag' with `a_script' into `script_tag'.
		do
			script_tag := a_script
		ensure
			set: script_tag ~ a_script
		end

	set_style_tag (a_style: like style_tag)
			-- `set_style_tag' with `a_style' into `style_tag'.
		do
			style_tag := a_style
		ensure
			set: style_tag ~ a_style
		end

feature {NONE} -- Implementation

	title_tag: detachable HTML_TITLE
			-- `title_tag' of Current {HTML_PAGE}.

	base_tag: detachable HTML_BASE
			-- `base_tag' of Current {HTML_PAGE}.

	link_tag: detachable HTML_LINK
			-- `link_tag' of Current {HTML_PAGE}.

	meta_tag: detachable HTML_META
			-- `meta_tag' of Current {HTML_PAGE}.

	script_tag: detachable HTML_SCRIPT
			-- `script_tag' of Current {HTML_PAGE}.

	style_tag: detachable HTML_STYLE
			-- `style_tag' of Current {HTML_PAGE}.

;note
	design: "[
Tag    Description
<head>    Defines information about the document
		]"
	EIS: "name=head", "src=http://www.w3schools.com/tags/tag_head.asp"

end
