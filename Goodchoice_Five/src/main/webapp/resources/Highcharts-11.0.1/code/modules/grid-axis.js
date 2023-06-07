/*
 Highcharts Gantt JS v11.0.1 (2023-05-08)

 GridAxis

 (c) 2016-2021 Lars A. V. Cabrera

 License: www.highcharts.com/license
*/
'use strict';(function(g){"object"===typeof module&&module.exports?(g["default"]=g,module.exports=g):"function"===typeof define&&define.amd?define("highcharts/modules/grid-axis",["highcharts"],function(n){g(n);g.Highcharts=n;return g}):g("undefined"!==typeof Highcharts?Highcharts:void 0)})(function(g){function n(g,l,k,n){g.hasOwnProperty(l)||(g[l]=n.apply(null,k),"function"===typeof CustomEvent&&window.dispatchEvent(new CustomEvent("HighchartsModuleLoaded",{detail:{path:l,module:g[l]}})))}g=g?g._modules:
{};n(g,"Core/Axis/GridAxis.js",[g["Core/Axis/Axis.js"],g["Core/Globals.js"],g["Core/Utilities.js"]],function(g,l,k){function n(a,b){const c={width:0,height:0};b.forEach(function(b){b=a[b];let e,f;k.isObject(b,!0)&&(f=k.isObject(b.label,!0)?b.label:{},b=f.getBBox?f.getBBox().height:0,f.textStr&&!t(f.textPxLength)&&(f.textPxLength=f.getBBox().width),e=t(f.textPxLength)?Math.round(f.textPxLength):0,f.textStr&&(e=Math.round(f.getBBox().width)),c.height=Math.max(b,c.height),c.width=Math.max(e,c.width))});
"treegrid"===this.options.type&&this.treeGrid&&this.treeGrid.mapOfPosToGridNode&&(c.width+=this.options.labels.indentation*((this.treeGrid.mapOfPosToGridNode[-1].height||0)-1));return c}function B(){const {grid:a}=this;(a&&a.columns||[]).forEach(function(a){a.getOffset()})}function C(a){if(!0===(this.options.grid||{}).enabled){const {axisTitle:c,height:e,horiz:d,left:f,offset:m,opposite:q,options:p,top:g,width:h}=this;var b=this.tickSize();const D=c&&c.getBBox().width,y=p.title.x,n=p.title.y,l=w(p.title.margin,
d?5:10),k=c?this.chart.renderer.fontMetrics(c).f:0;b=(d?g+e:f)+(d?1:-1)*(q?-1:1)*(b?b[0]/2:0)+(this.side===u.bottom?k:0);a.titlePosition.x=d?f-(D||0)/2-l+y:b+(q?h:0)+m+y;a.titlePosition.y=d?b-(q?e:0)+(q?k:-k)/2+m+n:g-l+n}}function E(){const {chart:a,options:{grid:b={}},userOptions:c}=this;if(b.enabled){var e=this.options;e.labels.align=w(e.labels.align,"center");this.categories||(e.showLastLabel=!1);this.labelRotation=0;e.labels.rotation=0}if(b.columns){e=this.grid.columns=[];let f=this.grid.columnIndex=
0;for(;++f<b.columns.length;){var d=v(c,b.columns[b.columns.length-f-1],{linkedTo:0,type:"category",scrollbar:{enabled:!1}});delete d.grid.columns;d=new g(this.chart,d);d.grid.isColumn=!0;d.grid.columnIndex=f;z(a.axes,d);z(a[this.coll],d);e.push(d)}}}function F(){var a=this.grid,b=this.options;if(!0===(b.grid||{}).enabled){var c=this.min||0;const q=this.max||0;this.maxLabelDimensions=this.getMaxLabelDimensions(this.ticks,this.tickPositions);this.rightWall&&this.rightWall.destroy();if(this.grid&&this.grid.isOuterAxis()&&
this.axisLine){var e=b.lineWidth;if(e){e=this.getLinePath(e);var d=e[0],f=e[1],m=((this.tickSize("tick")||[1])[0]-1)*(this.side===u.top||this.side===u.left?-1:1);"M"===d[0]&&"L"===f[0]&&(this.horiz?(d[2]+=m,f[2]+=m):(d[1]+=m,f[1]+=m));!this.horiz&&this.chart.marginRight&&(d=[d,["L",this.left,d[2]||0]],m=["L",this.chart.chartWidth-this.chart.marginRight,this.toPixels(q+this.tickmarkOffset)],f=[["M",f[1]||0,this.toPixels(q+this.tickmarkOffset)],m],this.grid.upperBorder||0===c%1||(this.grid.upperBorder=
this.grid.renderBorder(d)),this.grid.upperBorder&&(this.grid.upperBorder.attr({stroke:b.lineColor,"stroke-width":b.lineWidth}),this.grid.upperBorder.animate({d})),this.grid.lowerBorder||0===q%1||(this.grid.lowerBorder=this.grid.renderBorder(f)),this.grid.lowerBorder&&(this.grid.lowerBorder.attr({stroke:b.lineColor,"stroke-width":b.lineWidth}),this.grid.lowerBorder.animate({d:f})));this.grid.axisLineExtra?(this.grid.axisLineExtra.attr({stroke:b.lineColor,"stroke-width":b.lineWidth}),this.grid.axisLineExtra.animate({d:e})):
this.grid.axisLineExtra=this.grid.renderBorder(e);this.axisLine[this.showAxis?"show":"hide"]()}}(a&&a.columns||[]).forEach(a=>a.render());if(!this.horiz&&this.chart.hasRendered&&(this.scrollbar||this.linkedParent&&this.linkedParent.scrollbar)){a=this.tickmarkOffset;b=this.tickPositions[this.tickPositions.length-1];e=this.tickPositions[0];let d,f;for(;(d=this.hiddenLabels.pop())&&d.element;)d.show();for(;(f=this.hiddenMarks.pop())&&f.element;)f.show();(d=this.ticks[e].label)&&(c-e>a?this.hiddenLabels.push(d.hide()):
d.show());(d=this.ticks[b].label)&&(b-q>a?this.hiddenLabels.push(d.hide()):d.show());(c=this.ticks[b].mark)&&b-q<a&&0<b-q&&this.ticks[b].isLast&&this.hiddenMarks.push(c.hide())}}}function G(){const a=this.tickPositions&&this.tickPositions.info,b=this.options,c=this.userOptions.labels||{};(b.grid||{}).enabled&&(this.horiz?(this.series.forEach(a=>{a.options.pointRange=0}),a&&b.dateTimeLabelFormats&&b.labels&&!r(c.align)&&(!1===b.dateTimeLabelFormats[a.unitName].range||1<a.count)&&(b.labels.align="left",
r(c.x)||(b.labels.x=3))):"treegrid"!==this.options.type&&this.grid&&this.grid.columns&&(this.minPointOffset=this.tickInterval))}function H(a){const b=this.options;a=a.userOptions;const c=b&&k.isObject(b.grid,!0)?b.grid:{};let e;!0===c.enabled&&(e=v(!0,{className:"highcharts-grid-axis "+(a.className||""),dateTimeLabelFormats:{hour:{list:["%H:%M","%H"]},day:{list:["%A, %e. %B","%a, %e. %b","%E"]},week:{list:["Week %W","W%W"]},month:{list:["%B","%b","%o"]}},grid:{borderWidth:1},labels:{padding:2,style:{fontSize:"0.9em"}},
margin:0,title:{text:null,reserveSpace:!1,rotation:0},units:[["millisecond",[1,10,100]],["second",[1,10]],["minute",[1,5,15]],["hour",[1,6]],["day",[1]],["week",[1]],["month",[1]],["year",null]]},a),"xAxis"===this.coll&&(r(a.linkedTo)&&!r(a.tickPixelInterval)&&(e.tickPixelInterval=350),r(a.tickPixelInterval)||!r(a.linkedTo)||r(a.tickPositioner)||r(a.tickInterval)||(e.tickPositioner=function(a,b){var c=this.linkedParent&&this.linkedParent.tickPositions&&this.linkedParent.tickPositions.info;if(c){var d=
e.units||[];let g;var f=1;let m="year";for(let a=0;a<d.length;a++){const b=d[a];if(b&&b[0]===c.unitName){g=a;break}}(d=t(g)&&d[g+1])?(m=d[0]||"year",f=(f=d[1])&&f[0]||1):"year"===c.unitName&&(f=10*c.count);c=I[m];this.tickInterval=c*f;return this.chart.time.getTimeTicks({unitRange:c,count:f,unitName:m},a,b,this.options.startOfWeek)}})),v(!0,this.options,e),this.horiz&&(b.minPadding=w(a.minPadding,0),b.maxPadding=w(a.maxPadding,0)),t(b.grid.borderWidth)&&(b.tickWidth=b.lineWidth=c.borderWidth))}function J(a){a=
(a=a.userOptions)&&a.grid||{};const b=a.columns;a.enabled&&b&&v(!0,this.options,b[b.length-1])}function K(){(this.grid.columns||[]).forEach(a=>a.setScale())}function L(a){const {horiz:b,maxLabelDimensions:c,options:{grid:e={}}}=this;if(e.enabled&&c){var d=2*this.options.labels.distance;d=b?e.cellHeight||d+c.height:d+c.width;M(a.tickSize)?a.tickSize[0]=d:a.tickSize=[d,0]}}function N(){this.axes.forEach(a=>{(a.grid&&a.grid.columns||[]).forEach(a=>{a.setAxisSize();a.setAxisTranslation()})})}function O(a){const {grid:b}=
this;(b.columns||[]).forEach(b=>b.destroy(a.keepEvents));b.columns=void 0}function P(a){a=a.userOptions||{};const b=a.grid||{};b.enabled&&r(b.borderColor)&&(a.tickColor=a.lineColor=b.borderColor);this.grid||(this.grid=new Q(this));this.hiddenLabels=[];this.hiddenMarks=[]}function R(a){var b=this.label;const c=this.axis;var e=c.reversed,d=c.chart,f=c.options.grid||{};const g=c.options.labels,q=g.align;var p=u[c.side],h=a.tickmarkOffset,k=c.tickPositions;const n=this.pos-h;k=t(k[a.index+1])?k[a.index+
1]-h:(c.max||0)+h;var l=c.tickSize("tick");h=l?l[0]:0;l=l?l[1]/2:0;if(!0===f.enabled){let m;"top"===p?(f=c.top+c.offset,m=f-h):"bottom"===p?(m=d.chartHeight-c.bottom+c.offset,f=m+h):(f=c.top+c.len-(c.translate(e?k:n)||0),m=c.top+c.len-(c.translate(e?n:k)||0));"right"===p?(p=d.chartWidth-c.right+c.offset,e=p+h):"left"===p?(e=c.left+c.offset,p=e-h):(p=Math.round(c.left+(c.translate(e?k:n)||0))-l,e=Math.min(Math.round(c.left+(c.translate(e?n:k)||0))-l,c.left+c.len));this.slotWidth=e-p;a.pos.x="left"===
q?p:"right"===q?e:p+(e-p)/2;a.pos.y=m+(f-m)/2;b&&(d=d.renderer.fontMetrics(b),b=b.getBBox().height,a.pos.y=g.useHTML?a.pos.y+(d.b+-(b/2)):a.pos.y+((d.b-(d.h-d.f))/2+-((Math.round(b/d.h)-1)*d.h/2)));a.pos.x+=c.horiz&&g.x||0}}function S(a){const {axis:b,value:c}=a;if(b.options.grid&&b.options.grid.enabled){var e=b.tickPositions;const d=(b.linkedParent||b).series[0],f=c===e[0];e=c===e[e.length-1];const g=d&&T(d.options.data,function(a){return a[b.isXAxis?"x":"y"]===c});let h;g&&d.is("gantt")&&(h=v(g),
l.seriesTypes.gantt.prototype.pointClass.setGanttPointAliases(h));a.isFirst=f;a.isLast=e;a.point=h}}function U(){const a=this.options,b=this.categories,c=this.tickPositions,e=c[0],d=c[c.length-1],f=this.linkedParent&&this.linkedParent.min||this.min,g=this.linkedParent&&this.linkedParent.max||this.max,h=this.tickInterval;!0!==(a.grid||{}).enabled||b||!this.horiz&&!this.isLinked||(e<f&&e+h>f&&!a.startOnTick&&(c[0]=f),d>g&&d-h<g&&!a.endOnTick&&(c[c.length-1]=g))}function V(a){const {options:{grid:b=
{}}}=this;return!0===b.enabled&&this.categories?this.tickInterval:a.apply(this,Array.prototype.slice.call(arguments,1))}const {dateFormats:A}=l,{addEvent:h,defined:r,erase:z,find:T,isArray:M,isNumber:t,merge:v,pick:w,timeUnits:I,wrap:W}=k;var u;(function(a){a[a.top=0]="top";a[a.right=1]="right";a[a.bottom=2]="bottom";a[a.left=3]="left"})(u||(u={}));const x=[];class Q{constructor(a){this.axis=a}isOuterAxis(){const a=this.axis,b=a.grid.columnIndex,c=a.linkedParent&&a.linkedParent.grid.columns||a.grid.columns,
e=b?a.linkedParent:a;let d=-1,f=0;(a.chart[a.coll]||[]).forEach((b,c)=>{b.side!==a.side||b.options.isInternal||(f=c,b===e&&(d=c))});return f===d&&(t(b)?c.length===b:!0)}renderBorder(a){const b=this.axis,c=b.chart.renderer,e=b.options;a=c.path(a).addClass("highcharts-axis-line").add(b.axisBorder);c.styledMode||a.attr({stroke:e.lineColor,"stroke-width":e.lineWidth,zIndex:7});return a}}A.E=function(a){return this.dateFormat("%a",a,!0).charAt(0)};A.W=function(a){const b=this,c=new this.Date(a);["Hours",
"Milliseconds","Minutes","Seconds"].forEach(function(a){b.set(a,c,0)});var e=(this.get("Day",c)+6)%7;a=new this.Date(c.valueOf());this.set("Date",a,this.get("Date",c)-e+3);e=new this.Date(this.get("FullYear",a),0,1);4!==this.get("Day",e)&&(this.set("Month",c,0),this.set("Date",c,1+(11-this.get("Day",e))%7));return(1+Math.floor((a.valueOf()-e.valueOf())/6048E5)).toString()};"";return{compose:function(a,b,c){k.pushUnique(x,a)&&(a.keepProps.push("grid"),a.prototype.getMaxLabelDimensions=n,W(a.prototype,
"unsquish",V),h(a,"init",P),h(a,"afterGetOffset",B),h(a,"afterGetTitlePosition",C),h(a,"afterInit",E),h(a,"afterRender",F),h(a,"afterSetAxisTranslation",G),h(a,"afterSetOptions",H),h(a,"afterSetOptions",J),h(a,"afterSetScale",K),h(a,"afterTickSize",L),h(a,"trimTicks",U),h(a,"destroy",O));k.pushUnique(x,b)&&h(b,"afterSetChartSize",N);k.pushUnique(x,c)&&(h(c,"afterGetLabelPosition",R),h(c,"labelFormat",S));return a}}});n(g,"masters/modules/grid-axis.src.js",[g["Core/Globals.js"],g["Core/Axis/GridAxis.js"]],
function(g,l){l.compose(g.Axis,g.Chart,g.Tick)})});
//# sourceMappingURL=grid-axis.js.map