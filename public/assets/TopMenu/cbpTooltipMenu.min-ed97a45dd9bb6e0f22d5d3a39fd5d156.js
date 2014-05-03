/**
 * cbpTooltipMenu.min.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */

(function(d){var c=d.document,b=c.documentElement;function h(j,i){for(var k in i){if(i.hasOwnProperty(k)){j[k]=i[k]}}return j}function a(){var i=b.clientHeight,j=d.innerHeight;if(i<j){return j}else{return i}}function f(i){return i.getBoundingClientRect()}function e(k,j){if(k.type!="mouseout"&&k.type!="mouseover"){return false}var i=k.relatedTarget?k.relatedTarget:k.type=="mouseout"?k.toElement:k.fromElement;while(i&&i!=j){i=i.parentNode}return(i!=j)}function g(j,i){this.el=j;this.options=h(this.defaults,i);this._init()}g.prototype={defaults:{delayMenu:100},_init:function(){this.touch=Modernizr.touch;this.menuItems=c.querySelectorAll("#"+this.el.id+" > li");this._initEvents()},_initEvents:function(){var i=this;Array.prototype.slice.call(this.menuItems).forEach(function(l,k){var j=l.querySelector("a");if(i.touch){j.addEventListener("click",function(m){i._handleClick(this,m)})}else{j.addEventListener("click",function(m){if(this.parentNode.querySelector("ul.cbp-tm-submenu")){m.preventDefault()}});l.addEventListener("mouseover",function(m){if(e(m,this)){i._openMenu(this)}});l.addEventListener("mouseout",function(m){if(e(m,this)){i._closeMenu(this)}})}})},_openMenu:function(j){var i=this;clearTimeout(this.omtimeout);this.omtimeout=setTimeout(function(){var k=j.querySelector("ul.cbp-tm-submenu");if(k){j.className="cbp-tm-show";if(i._positionMenu(j)==="top"){j.className+=" cbp-tm-show-above"}else{j.className+=" cbp-tm-show-below"}}},this.touch?0:this.options.delayMenu)},_closeMenu:function(j){clearTimeout(this.omtimeout);var i=j.querySelector("ul.cbp-tm-submenu");if(i){j.className=j.className.replace(new RegExp("(^|\\s+)cbp-tm-show(\\s+|$)")," ");j.className=j.className.replace(new RegExp("(^|\\s+)cbp-tm-show-below(\\s+|$)")," ");j.className=j.className.replace(new RegExp("(^|\\s+)cbp-tm-show-above(\\s+|$)")," ")}},_handleClick:function(l,n){var m=l.parentNode,i=Array.prototype.slice.call(this.menuItems),k=m.querySelector("ul.cbp-tm-submenu");if(typeof this.current!=="undefined"&&i.indexOf(m)!==this.current){this._closeMenu(this.el.children[this.current]);this.el.children[this.current].querySelector("ul.cbp-tm-submenu").setAttribute("data-open","false")}if(k){n.preventDefault();var j=k.getAttribute("data-open");if(j==="true"){this._closeMenu(m);k.setAttribute("data-open","false")}else{this._openMenu(m);this.current=i.indexOf(m);k.setAttribute("data-open","true")}}},_positionMenu:function(j){var m=a(),k=f(j),i=k.top,l=m-i-j.offsetHeight;return(l<=i?"top":"bottom")}};d.cbpTooltipMenu=g})(window);
