note
	description: "[
		Representation of an effected {HTML_REST}.
		]"

class
	HTML_REST

feature -- Queries

	add_POST_JSON_data_script (a_html_tag: HTML_TAG; a_DOM_references, a_data_endpoint_URI, a_redirection_URI: STRING)
			--
		local
			l_script_text: STRING
			l_redirection_script_text: STRING
		do
			l_script_text := DOM_data_POST_as_JSON_script.twin
			l_script_text.replace_substring_all (DOM_references_tag, a_DOM_references)

			l_redirection_script_text := Redirect_to_URI_script.twin
			if a_redirection_URI.is_empty then
				l_redirection_script_text.replace_substring_all (Redirection_script_tag, "")
			else
				l_redirection_script_text.replace_substring_all (Redirection_script_URI_tag, a_redirection_URI)
			end
			l_script_text.replace_substring_all (Redirection_script_tag, a_redirection_URI)

			l_script_text.replace_substring_all (Data_endpoint_URI_tag, a_data_endpoint_URI)
			a_html_tag.css_script_snippets.force (create {HTML_SCRIPT}.make_with_src (l_script_text))
		end

feature -- Constants

			DOM_serializeObject_script: STRING = "[
$.fn.serializeObject = function() {
  var o = {};
  var a = this.serializeArray();
  $.each(a, function() {
    if (o[this.name] !== undefined) {
      if (!o[this.name].push) {
        o[this.name] = [o[this.name]];
      }
      o[this.name].push(this.value || '');
    } else {
      o[this.name] = this.value || '';
    }
  });
  return o;
};
]"

			DOM_data_POST_as_JSON_script: STRING = "[
$(function() {
  $('<<REFERENCES>>').submit(function() {
    var jsonData = JSON.stringify($('<<REFERENCES>>').serializeObject())
    $.ajax({
		url: '<<REST_URI>>',
		type: 'POST',
		contentType: 'application/json',
		data: (jsonData)
	});
	<<REDIRECTION_SCRIPT>>
    return false;
  });
});
]"

	Redirect_to_URI_script: STRING = "window.location.assign(%"<<REDIRECTION_URI>>%")"
			-- `Redirect_to_URI_script' to replace `Redirection_script_tag' in `DOM_data_POST_as_JSON_script'.

feature {NONE}

	Data_endpoint_URI_tag: STRING = "<<REST_URI>>"
	DOM_references_tag: STRING = "<<REFERENCES>>"
	Redirection_script_tag: STRING = "<<REDIRECTION_SCRIPT>>"
	Redirection_script_URI_tag: STRING = "<<REDIRECTION_URI>>"

note
	design_intent: "[
		Your_text_goes_here
		]"

end
