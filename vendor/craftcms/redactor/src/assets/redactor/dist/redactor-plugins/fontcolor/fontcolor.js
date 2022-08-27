!function(t){t.add("plugin","fontcolor",{translations:{en:{fontcolor:"Text Color",text:"Text",highlight:"Highlight"}},init:function(t){this.app=t,this.opts=t.opts,this.lang=t.lang,this.inline=t.inline,this.toolbar=t.toolbar,this.selection=t.selection,this.colors=this.opts.fontcolors?this.opts.fontcolors:["#ffffff","#000000","#eeece1","#1f497d","#4f81bd","#c0504d","#9bbb59","#8064a2","#4bacc6","#f79646","#ffff00","#f2f2f2","#7f7f7f","#ddd9c3","#c6d9f0","#dbe5f1","#f2dcdb","#ebf1dd","#e5e0ec","#dbeef3","#fdeada","#fff2ca","#d8d8d8","#595959","#c4bd97","#8db3e2","#b8cce4","#e5b9b7","#d7e3bc","#ccc1d9","#b7dde8","#fbd5b5","#ffe694","#bfbfbf","#3f3f3f","#938953","#548dd4","#95b3d7","#d99694","#c3d69b","#b2a2c7","#b7dde8","#fac08f","#f2c314","#a5a5a5","#262626","#494429","#17365d","#366092","#953734","#76923c","#5f497a","#92cddc","#e36c09","#c09100","#7f7f7f","#0c0c0c","#1d1b10","#0f243e","#244061","#632423","#4f6128","#3f3151","#31859b","#974806","#7f6000"]},onfontcolor:{set:function(t,e){this._set(t,e)},remove:function(t){this._remove(t)}},start:function(){var t={title:this.lang.get("fontcolor")},e=this._buildDropdown();this.$button=this.toolbar.addButton("fontcolor",t),this.$button.setIcon('<i class="re-icon-fontcolor"></i>'),this.$button.setDropdown(e)},_buildDropdown:function(){var e=t.dom('<div class="redactor-dropdown-cells">');return this.$selector=this._buildSelector(),this.$selectorText=this._buildSelectorItem("text",this.lang.get("text")),this.$selectorText.addClass("active"),this.$selectorBack=this._buildSelectorItem("back",this.lang.get("highlight")),this.$selector.append(this.$selectorText),this.$selector.append(this.$selectorBack),this.$pickerText=this._buildPicker("textcolor"),this.$pickerBack=this._buildPicker("backcolor"),e.append(this.$selector),e.append(this.$pickerText),e.append(this.$pickerBack),this._buildSelectorEvents(),e.width(242),e},_buildSelector:function(){var e=t.dom("<div>");return e.addClass("redactor-dropdown-selector"),e},_buildSelectorItem:function(e,o){var i=t.dom("<span>");return i.attr("rel",e).html(o),i.addClass("redactor-dropdown-not-close"),i},_buildSelectorEvents:function(){this.$selectorText.on("mousedown",function(t){t.preventDefault(),this.$selector.find("span").removeClass("active"),this.$pickerBack.hide(),this.$pickerText.show(),this.$selectorText.addClass("active")}.bind(this)),this.$selectorBack.on("mousedown",function(t){t.preventDefault(),this.$selector.find("span").removeClass("active"),this.$pickerText.hide(),this.$pickerBack.show(),this.$selectorBack.addClass("active")}.bind(this))},_buildPicker:function(e){for(var o=t.dom('<div class="re-dropdown-box-'+e+'">'),i="backcolor"==e?"background-color":"color",s=this.colors.length,c=this,r=function(e){e.preventDefault();var o=t.dom(e.target);c._set(o.data("rule"),o.attr("rel"))},n=0;n<s;n++){var d=this.colors[n],a=t.dom("<span>");a.attr({rel:d,"data-rule":i}),a.css({"background-color":d,"font-size":0,border:"2px solid #fff",width:"22px",height:"22px"}),a.on("mousedown",r),o.append(a)}var l=t.dom("<a>");return l.attr({href:"#"}),l.css({display:"block",clear:"both",padding:"8px 5px","font-size":"12px","line-height":1}),l.html(this.lang.get("none")),l.on("click",(function(t){t.preventDefault(),c._remove(i)})),o.append(l),"backcolor"==e&&o.hide(),o},_set:function(t,e){var o={};o[t]=e;var i={tag:"span",style:o,type:"toggle"};this.inline.format(i)},_remove:function(t){this.inline.remove({style:t}),this.app.broadcast("hardsync")}})}(Redactor);