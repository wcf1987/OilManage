"use strict";function Text(g,e,d,f,b,a,c){this.str=g;this.font=f;this.size=b;this.lineSpacing=1/4*b;this.align=c||Text.ALIGN_CENTER;this.vector=[new Point(e,d),new Point(e,d-20)];this.style=new Style();if(!a){this.bounds=this.getNormalBounds()}this.oType="Text"}Text.load=function(b){var a=new Text(b.str,b.x,b.y,b.font,b.size,false,b.align);a.vector=Point.loadArray(b.vector);a.style=Style.load(b.style);return a};Text.ALIGN_LEFT="left";Text.ALIGN_CENTER="center";Text.ALIGN_RIGHT="right";Text.ALIGNMENTS=[{Value:Text.ALIGN_LEFT,Text:"Left"},{Value:Text.ALIGN_CENTER,Text:"Center"},{Value:Text.ALIGN_RIGHT,Text:"Right"}];Text.FONTS=[{Value:"arial",Text:"Arial"},{Value:"arial narrow",Text:"Arial Narrow"},{Value:"courier new",Text:"Courier New"},{Value:"tahoma",Text:"Tahoma"}];Text.SPACE_BETWEEN_CHARACTERS=2;Text.DEFAULT_SIZE=10;Text.prototype={constructor:Text,getTextSize:function(){return this.size},setTextSize:function(c){var d=this.getNormalBounds().getBounds();var a=this.size;this.size=c;var b=this.getNormalBounds().getBounds()},getTextStr:function(){return this.str},setTextStr:function(a){var b=this.getNormalBounds().getBounds();this.str=a;var c=this.getNormalBounds().getBounds()},_getContext:function(){return document.getElementById("a").getContext("2d")},transform:function(a){this.vector[0].transform(a);this.vector[1].transform(a)},getAngle:function(){return Util.getAngle(this.vector[0],this.vector[1])},getNormalWidth:function(){var d=this.str.split("\n");var b=[];var c=0;this._getContext().save();this._getContext().font=this.size+"px "+this.font;for(var e in d){var a=this._getContext().measureText(d[e]);b[e]=a.width}this._getContext().restore();for(e=0;e<b.length;e++){if(c<b[e]){c=b[e]}}return c},getNormalHeight:function(){var b=this.str.split("\n");var a=b.length;var c=0;if(a>0){c=a*this.size+(a-1)*this.lineSpacing}return c},paint:function(h){h.save();var f=this.str.split("\n");var g=0;var b=this.size;this.lineSpacing=1/4*this.size;var c=this.lineSpacing;var a=b+c;var m=0;if(this.align==Text.ALIGN_LEFT){m=-this.getNormalWidth()/2}else{if(this.align==Text.ALIGN_RIGHT){m=this.getNormalWidth()/2}}var l=0.5*this.size;var j=Util.getAngle(this.vector[0],this.vector[1]);if(DIAGRAMO.debug){h.beginPath();h.moveTo(this.vector[0].x,this.vector[0].y);h.lineTo(this.vector[1].x,this.vector[1].y);h.closePath();h.stroke();var e=this.getNormalBounds();e.transform(Matrix.translationMatrix(-this.vector[0].x,-this.vector[0].y));e.transform(Matrix.rotationMatrix(j));e.transform(Matrix.translationMatrix(this.vector[0].x,this.vector[0].y));e.style.strokeStyle="rgb(250, 34, 35)";e.paint(h);h.save();h.strokeStyle="rgb(30, 204, 35)";var d=e.getBounds();h.beginPath();h.moveTo(d[0],d[1]);h.lineTo(d[2],d[1]);h.lineTo(d[2],d[3]);h.lineTo(d[0],d[3]);h.closePath();h.stroke();h.restore()}h.translate(this.vector[0].x,this.vector[0].y);h.rotate(j);h.translate(-this.vector[0].x,-this.vector[0].y);h.fillStyle=this.style.fillStyle;h.font=this.size+"px "+this.font;h.textAlign=this.align;h.textBaseline="middle";for(var k=0;k<f.length;k++){h.fillText(f[k],this.vector[0].x+m,(this.vector[0].y-this.getNormalHeight()/2+k*this.size+k*this.lineSpacing)+l);g=g+1}h.restore()},getBounds:function(){var b=Util.getAngle(this.vector[0],this.vector[1]);var a=this.getNormalBounds();a.transform(Matrix.translationMatrix(-this.vector[0].x,-this.vector[0].y));a.transform(Matrix.rotationMatrix(b));a.transform(Matrix.translationMatrix(this.vector[0].x,this.vector[0].y));return a.getBounds()},getNormalBounds:function(){var a=this.str.split("\n");var b=new Polygon();b.addPoint(new Point(this.vector[0].x-this.getNormalWidth()/2,this.vector[0].y-this.getNormalHeight()/2));b.addPoint(new Point(this.vector[0].x+this.getNormalWidth()/2,this.vector[0].y-this.getNormalHeight()/2));b.addPoint(new Point(this.vector[0].x+this.getNormalWidth()/2,this.vector[0].y+this.getNormalHeight()/2));b.addPoint(new Point(this.vector[0].x-this.getNormalWidth()/2,this.vector[0].y+this.getNormalHeight()/2));return b},getPoints:function(){return[]},contains:function(c,b){var a=Util.getAngle(this.vector[0],this.vector[1]);var d=this.getNormalBounds();d.transform(Matrix.translationMatrix(-this.vector[0].x,-this.vector[0].y));d.transform(Matrix.rotationMatrix(a));d.transform(Matrix.translationMatrix(this.vector[0].x,this.vector[0].y));return d.contains(c,b,true)},near:function(e,c,d){var b=Util.getAngle(this.vector[0],this.vector[1]);var a=this.getNormalBounds();a.transform(Matrix.translationMatrix(-this.vector[0].x,-this.vector[0].y));a.transform(Matrix.rotationMatrix(b));a.transform(Matrix.translationMatrix(this.vector[0].x,this.vector[0].y));return a.near(e,c,d)},equals:function(a){if(!a instanceof Text){return false}if(this.str!=a.str||this.font!=a.font||this.size!=a.size||this.lineSpacing!=a.lineSpacing||this.size!=a.size){return false}for(var b=0;b<this.vector.length;b++){if(!this.vector[b].equals(a.vector[b])){return false}}if(!this.style.equals(a.style)){return false}return true},clone:function(){var a=new Text(this.str,this.x,this.y,this.font,this.size,this.outsideCanvas);a.align=this.align;a.vector=Point.cloneArray(this.vector);a.style=this.style.clone();if(!a.outsideCanvas){a.bounds=this.bounds.clone()}return a},toString:function(){return"Text: "+this.str+" x:"+this.vector[0].x+" y:"+this.vector[0].y},escapeString:function(a){var c=new String(a);var b=[];b.push(["<","&lt;"]);for(var d=0;d<b.length;d++){c=c.replace(b[d][0],b[d][1])}return c},toSVG:function(){var b=this.getAngle()*180/Math.PI;var f=this.getNormalHeight();var e=0;var c="middle";if(this.align==Text.ALIGN_LEFT){e=-this.getNormalWidth()/2;c="start"}else{if(this.align==Text.ALIGN_RIGHT){e=this.getNormalWidth()/2;c="end"}}var d="\n"+repeat("\t",INDENTATION)+'<text y="'+(this.vector[0].y-f/2)+'" ';d+=' transform="rotate('+b+" "+this.vector[0].x+" ,"+this.vector[0].y+')" ';d+=' font-family="'+this.font+'" ';d+=' font-size="'+this.size+'" ';if(this.style.fillStyle!=null){d+=' fill=" '+this.style.fillStyle+'" '}d+=' text-anchor="'+c+'" ';d+=">";INDENTATION++;var h=this.str.split("\n");for(var a=0;a<h.length;a++){var g=parseFloat(this.size);if(a>0){g+=parseFloat(this.lineSpacing)}d+="\n"+repeat("\t",INDENTATION)+'<tspan x="'+(this.vector[0].x+e)+'" dy="'+g+'">'+this.escapeString(h[a])+"</tspan>"}INDENTATION--;d+="\n"+repeat("\t",INDENTATION)+"</text>";if(this.debug){d+="\n"+repeat("\t",INDENTATION)+'<circle cx="'+this.vector[0].x+'" cy="'+this.vector[0].y+'" r="3" style="stroke: #FF0000; fill: yellow;"  transform="rotate('+b+" "+this.vector[0].x+" ,"+this.vector[0].y+')" />';d+="\n"+repeat("\t",INDENTATION)+'<circle cx="'+this.vector[0].x+'" cy="'+(this.vector[0].y-f/2)+'" r="3" style="stroke: #FF0000; fill: green;"  transform="rotate('+b+" "+this.vector[0].x+" ,"+this.vector[0].y+')"  />'}return d}};