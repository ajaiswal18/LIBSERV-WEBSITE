!function(){function e(e,t,n){t.is&&t.getCustomData("block_processed")||(t.is&&CKEDITOR.dom.element.setMarker(n,t,"block_processed",!0),e.push(t))}function t(t,n){function i(){this.foreach(function(e){/^(?!vbox|hbox)/.test(e.type)&&(e.setup||(e.setup=function(t){e.setValue(t.getAttribute(e.id)||"",1)}),!e.commit)&&(e.commit=function(t){var n=this.getValue();"dir"==e.id&&t.getComputedStyle("direction")==n||(n?t.setAttribute(e.id,n):t.removeAttribute(e.id))})})}var o=function(){var e=CKEDITOR.tools.extend({},CKEDITOR.dtd.$blockLimit);return t.config.div_wrapTable&&(delete e.td,delete e.th),e}(),a=CKEDITOR.dtd.div,r={},s=[];return{title:t.lang.div.title,minWidth:400,minHeight:165,contents:[{id:"info",label:t.lang.common.generalTab,title:t.lang.common.generalTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"elementStyle",type:"select",style:"width: 100%;",label:t.lang.div.styleSelectLabel,"default":"",items:[[t.lang.common.notSet,""]],onChange:function(){var e=["info:elementStyle","info:class","advanced:dir","advanced:style"],n=this.getDialog(),i=n._element&&n._element.clone()||new CKEDITOR.dom.element("div",t.document);this.commit(i,!0);for(var o,e=[].concat(e),a=e.length,r=0;a>r;r++)(o=n.getContentElement.apply(n,e[r].split(":")))&&o.setup&&o.setup(i,!0)},setup:function(e){for(var n in r)r[n].checkElementRemovable(e,!0,t)&&this.setValue(n,1)},commit:function(e){var n;(n=this.getValue())?r[n].applyToObject(e,t):e.removeAttribute("style")}},{id:"class",type:"text",requiredContent:"div(cke-xyz)",label:t.lang.common.cssClass,"default":""}]}]},{id:"advanced",label:t.lang.common.advancedTab,title:t.lang.common.advancedTab,elements:[{type:"vbox",padding:1,children:[{type:"hbox",widths:["50%","50%"],children:[{type:"text",id:"id",requiredContent:"div[id]",label:t.lang.common.id,"default":""},{type:"text",id:"lang",requiredContent:"div[lang]",label:t.lang.common.langCode,"default":""}]},{type:"hbox",children:[{type:"text",id:"style",requiredContent:"div{cke-xyz}",style:"width: 100%;",label:t.lang.common.cssStyle,"default":"",commit:function(e){e.setAttribute("style",this.getValue())}}]},{type:"hbox",children:[{type:"text",id:"title",requiredContent:"div[title]",style:"width: 100%;",label:t.lang.common.advisoryTitle,"default":""}]},{type:"select",id:"dir",requiredContent:"div[dir]",style:"width: 100%;",label:t.lang.common.langDir,"default":"",items:[[t.lang.common.notSet,""],[t.lang.common.langDirLtr,"ltr"],[t.lang.common.langDirRtl,"rtl"]]}]}]}],onLoad:function(){i.call(this);var e=this,n=this.getContentElement("info","elementStyle");t.getStylesSet(function(i){var o,a;if(i)for(var s=0;s<i.length;s++)a=i[s],a.element&&"div"==a.element&&(o=a.name,r[o]=a=new CKEDITOR.style(a),t.filter.check(a)&&(n.items.push([o,o]),n.add(o,o)));n[1<n.items.length?"enable":"disable"](),setTimeout(function(){e._element&&n.setup(e._element)},0)})},onShow:function(){"editdiv"==n&&this.setupContent(this._element=CKEDITOR.plugins.div.getSurroundDiv(t))},onOk:function(){if("editdiv"==n)s=[this._element];else{var i,r,l,c=[],d={},u=[],h=t.getSelection(),m=h.getRanges(),g=h.createBookmarks();for(r=0;r<m.length;r++)for(l=m[r].createIterator();i=l.getNextParagraph();)if(i.getName()in o&&!i.isReadOnly()){var f=i.getChildren();for(i=0;i<f.count();i++)e(u,f.getItem(i),d)}else{for(;!a[i.getName()]&&!i.equals(m[r].root);)i=i.getParent();e(u,i,d)}for(CKEDITOR.dom.element.clearAllMarkers(d),m=[],r=null,l=0;l<u.length;l++)i=u[l],f=t.elementPath(i).blockLimit,f.isReadOnly()&&(f=f.getParent()),t.config.div_wrapTable&&f.is(["td","th"])&&(f=t.elementPath(f.getParent()).blockLimit),f.equals(r)||(r=f,m.push([])),m[m.length-1].push(i);for(r=0;r<m.length;r++){for(f=m[r][0],u=f.getParent(),i=1;i<m[r].length;i++)u=u.getCommonAncestor(m[r][i]);for(l=new CKEDITOR.dom.element("div",t.document),i=0;i<m[r].length;i++){for(f=m[r][i];!f.getParent().equals(u);)f=f.getParent();m[r][i]=f}for(i=0;i<m[r].length;i++)f=m[r][i],f.getCustomData&&f.getCustomData("block_processed")||(f.is&&CKEDITOR.dom.element.setMarker(d,f,"block_processed",!0),i||l.insertBefore(f),l.append(f));CKEDITOR.dom.element.clearAllMarkers(d),c.push(l)}h.selectBookmarks(g),s=c}for(c=s.length,d=0;c>d;d++)this.commitContent(s[d]),!s[d].getAttribute("style")&&s[d].removeAttribute("style");this.hide()},onHide:function(){"editdiv"==n&&this._element.removeCustomData("elementStyle"),delete this._element}}}CKEDITOR.dialog.add("creatediv",function(e){return t(e,"creatediv")}),CKEDITOR.dialog.add("editdiv",function(e){return t(e,"editdiv")})}();