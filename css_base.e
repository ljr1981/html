class
	CSS_BASE

feature -- Input: Masking

	masking_input_css_min: STRING = "[
li{line-height:2}:invalid{outline:red solid 1px}.shell{position:relative;line-height:1}.shell span{position:absolute;left:3px;top:1px;color:#ccc;pointer-events:none;z-index:-1}.shell span i{font-style:normal;color:transparent;opacity:0;visibility:hidden}.shell span,input.masked{font-size:16px;font-family:monospace;padding-right:10px;background-color:transparent;text-transform:uppercase}
]"

	masking_input_css: STRING = "[
/* optional */
li {
  line-height: 2; }

:invalid {
  outline: 1px solid red; }

.shell {
  position: relative;
  line-height: 1; }
  .shell span {
    position: absolute;
    left: 3px;
    top: 1px;
    color: #ccc;
    pointer-events: none;
    z-index: -1; }
    .shell span i {
      font-style: normal;
      /* any of these 3 will work */
      color: transparent;
      opacity: 0;
      visibility: hidden; }

input.masked,
.shell span {
  font-size: 16px;
  font-family: monospace;
  padding-right: 10px;
  background-color: transparent;
  text-transform: uppercase; }

/*# sourceMappingURL=masking-input.css.map */
]"

end
