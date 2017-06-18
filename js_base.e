note
	EIS: "name=wc3schools_tutorial",					"src=https://www.w3schools.com/Js/"

class
	JS_BASE

feature -- Table: Delete Row

	delete_row_js_min: STRING = "[
function deleteRow(e){var t=e.parentNode.parentNode.rowIndex;document.getElementById("<<TABLE_NAME>>").deleteRow(t)}
]"

	delete_row_js: STRING = "[
function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("<<TABLE_NAME>>").deleteRow(i);
}
]"

feature -- Table: Sort Rows

	sortable_js_min: STRING = "[
function sortTable(e){var a,n,t,r,o,s,T,i,L=0;for(a=document.getElementById("<<TABLE_NAME>>"),t=!0,i="asc";t;){for(t=!1,n=a.getElementsByTagName("TR"),r=1;r<n.length-1;r++)if(T=!1,o=n[r].getElementsByTagName("TD")[e],s=n[r+1].getElementsByTagName("TD")[e],"asc"==i){if(o.innerHTML.toLowerCase()>s.innerHTML.toLowerCase()){T=!0;break}}else if("desc"==i&&o.innerHTML.toLowerCase()<s.innerHTML.toLowerCase()){T=!0;break}T?(n[r].parentNode.insertBefore(n[r+1],n[r]),t=!0,L++):0==L&&"asc"==i&&(i="desc",t=!0)}}
]"

	sorttable_js: STRING = "[
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("<<TABLE_NAME>>");
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
]"

feature -- Input: Masking

	input_masking_js_min: STRING = "[
var InputMask=function(t){t&&t.masked&&(t.masked=typeof t.masked===string?document.querySelectorAll(t.masked):t.masked),t?this.opts={masked:t.masked||document.querySelectorAll(this.d.masked),mNum:t.mNum||this.d.mNum,mChar:t.mChar||this.d.mChar,error:t.onError||this.d.onError}:(this.opts=this.d,this.opts.masked=document.querySelectorAll(this.opts.masked)),this.refresh(!0)},inputMask={d:{masked:".masked",mNum:"XdDmMyY9",mChar:"_",onError:function(){}},refresh:function(t){var e,a;for(t||(this.opts.masked=document.querySelectorAll(this.opts.masked)),i=0;i<this.opts.masked.length;i++)e=this.opts.masked[i],a=e.parentNode.getAttribute("class"),(!a||a&&-1===a.indexOf("shell"))&&(this.createShell(e),this.activateMasking(e))},createShell:function(t){var e=document.createElement("span"),a=document.createElement("span"),r=document.createElement("i"),s=t.getAttribute("class"),n=t.getAttribute("placeholder"),i=document.createTextNode(n);t.setAttribute("maxlength",i.length),t.setAttribute("data-placeholder",n),t.removeAttribute("placeholder"),(!s||s&&-1===s.indexOf("masked"))&&t.setAttribute("class",s+" masked"),a.setAttribute("aria-hidden","true"),a.setAttribute("id",t.getAttribute("id")+"Mask"),a.appendChild(r),a.appendChild(i),e.setAttribute("class","shell"),e.appendChild(a),t.parentNode.insertBefore(e,t),e.appendChild(t)},setValueOfMask:function(t){var e=t.target.value,a=t.target.getAttribute("data-placeholder");return"<i>"+e+"</i>"+a.substr(e.length)},activateMasking:function(t){var e=this;t.addEventListener?t.addEventListener("keyup",function(t){e.handleValueChange.call(e,t)},!1):t.attachEvent&&t.attachEvent("onkeyup",function(t){t.target=t.srcElement,e.handleValueChange.call(e,t)})},handleValueChange:function(t){var e=t.target.getAttribute("id");t.target.value!=document.querySelector("#"+e+"Mask i").innerHTML&&(document.getElementById(e).value=this.handleCurrentValue(t),document.getElementById(e+"Mask").innerHTML=this.setValueOfMask(t))},handleCurrentValue:function(t){var e,a,r,s,n,i=t.target.getAttribute("data-charset"),u=i||t.target.getAttribute("data-placeholder"),d=t.target.value,l=u.length,o="";for(n=i?d.replace(/\W/g,""):d.replace(/\D/g,""),e=0,a=0;l>e;e++){if(r=!isNaN(parseInt(n[a])),s=n[a]?n[a].match(/[A-Z]/i):!1,matchesNumber=this.opts.mNum.indexOf(u[e])>=0,matchesLetter=this.opts.mChar.indexOf(u[e])>=0,matchesNumber&&r||i&&matchesLetter&&s)o+=n[a++];else{if(!i&&!r&&matchesNumber||i&&(matchesLetter&&!s||matchesNumber&&!r))return o;o+=u[e]}if(void 0==n[a])break}return t.target.getAttribute("data-valid-example")?this.validateProgress(t,o):o},validateProgress:function(t,e){var a=t.target.getAttribute("data-valid-example"),r=new RegExp(t.target.getAttribute("pattern")),s=t.target.getAttribute("data-placeholder"),n=e.length,u="";if(1==n&&"MM"==s.toUpperCase().substr(0,2))return e>1&&10>e&&(e="0"+e),e;for(i=n;i>=0;i--){if(u=e+a.substr(e.length),r.test(u))return e;e=e.substr(0,e.length-1)}return e}};for(var property in inputMask)inputMask.hasOwnProperty(property)&&(InputMask.prototype[property]=inputMask[property]);!function(){var t=document.getElementsByTagName("script"),e=t[t.length-1];e.getAttribute("data-autoinit")&&new InputMask}();
]"

	input_masking_js: STRING = "[
var InputMask = function ( opts ) {
  if ( opts && opts.masked ) {
    // Make it easy to wrap this plugin and pass elements instead of a selector
    opts.masked = typeof opts.masked === string ? document.querySelectorAll( opts.masked ) : opts.masked;
  }

  if ( opts ) {
    this.opts = {
      masked: opts.masked || document.querySelectorAll( this.d.masked ),
      mNum: opts.mNum || this.d.mNum,
      mChar: opts.mChar || this.d.mChar,
      error: opts.onError || this.d.onError
    }
  } else {
    this.opts = this.d;
    this.opts.masked = document.querySelectorAll( this.opts.masked );
  }

  this.refresh( true );
};

var inputMask = {

  // Default Values
  d: {
    masked : '.masked',
    mNum : 'XdDmMyY9',
    mChar : '_',
    onError: function(){}
  },

  refresh: function(init) {
    var t, parentClass;

    if ( !init ) {
      this.opts.masked = document.querySelectorAll( this.opts.masked );
    }

    for(i = 0; i < this.opts.masked.length; i++) {
      t = this.opts.masked[i]
      parentClass = t.parentNode.getAttribute('class');

      if ( !parentClass || ( parentClass && parentClass.indexOf('shell') === -1 ) ) {
        this.createShell(t);
        this.activateMasking(t);
      }
    }
  },

  // replaces each masked t with a shall containing the t and it's mask.
  createShell : function (t) {
    var wrap = document.createElement('span'),
        mask = document.createElement('span'),
        emphasis = document.createElement('i'),
        tClass = t.getAttribute('class'),
        pTxt = t.getAttribute('placeholder'),
        placeholder = document.createTextNode(pTxt);

    t.setAttribute('maxlength', placeholder.length);
    t.setAttribute('data-placeholder', pTxt);
    t.removeAttribute('placeholder');


    if ( !tClass || ( tClass && tClass.indexOf('masked') === -1 ) ) {
      t.setAttribute( 'class', tClass + ' masked');
    }

    mask.setAttribute('aria-hidden', 'true');
    mask.setAttribute('id', t.getAttribute('id') + 'Mask');
    mask.appendChild(emphasis);
    mask.appendChild(placeholder);

    wrap.setAttribute('class', 'shell');
    wrap.appendChild(mask);
    t.parentNode.insertBefore( wrap, t );
    wrap.appendChild(t);
  },

  setValueOfMask : function (e) {
    var value = e.target.value,
        placeholder = e.target.getAttribute('data-placeholder');

    return "<i>" + value + "</i>" + placeholder.substr(value.length);
  },

  // add event listeners
  activateMasking : function (t) {
    var that = this;
    if (t.addEventListener) { // remove "if" after death of IE 8
      t.addEventListener('keyup', function(e) {
        that.handleValueChange.call(that,e);
      }, false);
    } else if (t.attachEvent) { // For IE 8
        t.attachEvent('onkeyup', function(e) {
        e.target = e.srcElement;
        that.handleValueChange.call(that, e);
      });
    }
  },

  handleValueChange : function (e) {
    var id = e.target.getAttribute('id');

    if(e.target.value == document.querySelector('#' + id + 'Mask i').innerHTML) {
      return; // Continue only if value hasn't changed
    }

    document.getElementById(id).value = this.handleCurrentValue(e);
    document.getElementById(id + 'Mask').innerHTML = this.setValueOfMask(e);

  },

  handleCurrentValue : function (e) {
    var isCharsetPresent = e.target.getAttribute('data-charset'),
        placeholder = isCharsetPresent || e.target.getAttribute('data-placeholder'),
        value = e.target.value, l = placeholder.length, newValue = '',
        i, j, isInt, isLetter, strippedValue;

    // strip special characters
    strippedValue = isCharsetPresent ? value.replace(/\W/g, "") : value.replace(/\D/g, "");

    for (i = 0, j = 0; i < l; i++) {
        isInt = !isNaN(parseInt(strippedValue[j]));
        isLetter = strippedValue[j] ? strippedValue[j].match(/[A-Z]/i) : false;
        matchesNumber = this.opts.mNum.indexOf(placeholder[i]) >= 0;
        matchesLetter = this.opts.mChar.indexOf(placeholder[i]) >= 0;
        if ((matchesNumber && isInt) || (isCharsetPresent && matchesLetter && isLetter)) {
                newValue += strippedValue[j++];
          } else if ((!isCharsetPresent && !isInt && matchesNumber) || (isCharsetPresent && ((matchesLetter && !isLetter) || (matchesNumber && !isInt)))) {
                //this.opts.onError( e ); // write your own error handling function
                return newValue;
        } else {
            newValue += placeholder[i];
        }
        // break if no characters left and the pattern is non-special character
        if (strippedValue[j] == undefined) {
          break;
        }
    }
    if (e.target.getAttribute('data-valid-example')) {
      return this.validateProgress(e, newValue);
    }
    return newValue;
  },

  validateProgress : function (e, value) {
    var validExample = e.target.getAttribute('data-valid-example'),
        pattern = new RegExp(e.target.getAttribute('pattern')),
        placeholder = e.target.getAttribute('data-placeholder'),
        l = value.length, testValue = '';

    //convert to months
    if (l == 1 && placeholder.toUpperCase().substr(0,2) == 'MM') {
      if(value > 1 && value < 10) {
        value = '0' + value;
      }
      return value;
    }
    // test the value, removing the last character, until what you have is a submatch
    for ( i = l; i >= 0; i--) {
      testValue = value + validExample.substr(value.length);
      if (pattern.test(testValue)) {
        return value;
      } else {
        value = value.substr(0, value.length-1);
      }
    }

    return value;
  }
};

for ( var property in inputMask ) {
  if (inputMask.hasOwnProperty(property)) {
    InputMask.prototype[ property ] = inputMask[ property ];
  }
}

//  Declaritive initalization
(function(){
  var scripts = document.getElementsByTagName('script'),
      script = scripts[ scripts.length - 1 ];
  if ( script.getAttribute('data-autoinit') ) {
    new InputMask();
  }
})();
]"

end
