var itsm_2388_params="9|1|0|3|0".split("|");

var itsm_2388_s_width=250;
var itsm_2388_s_height=250;
var itsm_2388_linksrc ="http://www2.xinmin.cn/3067/3067_2388_1.htm";
var itsm_2388_pos=parseInt(itsm_2388_params[0]);
var itsm_2388_showclose=parseInt(itsm_2388_params[1]);
var itsm_2388_movingup=parseInt(itsm_2388_params[2]);
var itsm_2388_movinguptime=parseFloat(itsm_2388_params[3]);
var itsm_2388_displaytime=parseFloat(itsm_2388_params[4]);
var itsm_2388_o_code=99;

if(isNaN(itsm_2388_pos) || itsm_2388_pos<1 || itsm_2388_pos>9)
    itsm_2388_pos=9;

if(isNaN(itsm_2388_showclose) || itsm_2388_showclose<0 || itsm_2388_showclose>1)
    itsm_2388_showclose=1;

if(isNaN(itsm_2388_movingup) || itsm_2388_movingup<0 || itsm_2388_movingup>1)
    itsm_2388_movingup=0;

if(isNaN(itsm_2388_movinguptime) || itsm_2388_movinguptime<0 )
    itsm_2388_movinguptime=3;

if(isNaN(itsm_2388_displaytime) || itsm_2388_displaytime<0 )
    itsm_2388_displaytime=3;

itsm_2388_o_code=itsm_2388_pos*10+itsm_2388_pos;

var itsm_2388_movelen=parseInt(itsm_2388_s_height/(itsm_2388_movinguptime*10))

var itsm_2388_init_y=0;

if(itsm_2388_movingup)
	itsm_2388_init_y=itsm_2388_s_height;

function _itsm_2388_anyshape(l){window['_itsm_'+l.ad_id+'_'+l.pos_id]={};var j=window['_itsm_'+l.ad_id+'_'+l.pos_id];j.methods={insertAdjacentHTML:function(B,bn,ba){switch(ad.getBrowser().name){case "IE":B.insertAdjacentHTML(bn,ba);break;default:var bC=B.ownerDocument.createRange();bC.setStartBefore(B);var bc=bC.createContextualFragment(ba);var ab=bc;switch(bn){case 'beforeBegin':B.parentNode.insertBefore(ab,B);break;case 'afterBegin':B.insertBefore(ab,B.firstChild);break;case 'beforeEnd':B.appendChild(ab);break;case 'afterEnd':if(B.nextSibling)B.parentNode.insertBefore(ab,B.nextSibling);else B.parentNode.appendChild(ab);break;}}},getBrowser:function(){var de={};var di=navigator.userAgent.toLowerCase();var bq;(bq=di.match(/msie ([\d.]+)/))?de.dk=bq[1]:(bq=di.match(/firefox\/([\d.]+)/))?de.df=bq[1]:(bq=di.match(/chrome\/([\d.]+)/))?de.dh=bq[1]:(bq=di.match(/opera.([\d.]+)/))?de.dj=bq[1]:(bq=di.match(/version\/([\d.]+).*safari/))?de.dg=bq[1]:0;if(de.dk){(bq=di.match(/maxthon ([\d.]+)/))?de.G=bq[1]:0;if(de.G)return{'name':'IE','version':de.dk,'childName':'MT','childVersion':de.G};return{'name':'IE','version':de.dk};}if(de.df){return{'name':'FF','version':de.df}}if(de.dh){return{'name':'chrome','version':de.dh}}if(de.dj){return{'name':'opera','version':de.dj}}if(de.dg){return{'name':'safari','version':de.dg}}},isXHTML:function(k){if(!k)k=window;var bp,cn=k.document.compatMode,aE=k.document.doctype;bp=((cn&&cn.toLowerCase()=='css1compat')||(aE&&aE.publicId.indexOf(".dtd")!= -1));return bp;},getObjCoordinate:function(B,k){var ap=0,aD=0,bv=0,aS=ad.getBrowser().name,an=ad.getBrowser().version,by=ad.getCurrentStyle,aa=B,r=0,L=0;if(!B)B=k.document.body;if(B.tagName=='BODY'){return[ap,aD];}while(B!=null){switch(by(B,'position',k)){case 'relative':r=0;break;case 'absolute':r=1;}if(B.tagName=='BODY'&&aS=='IE'&&(!ad.isXHTML(k)||an>7))break;if(B.tagName=='BODY'&&(aS=='chrome'||aS=='safari'))break;ap+=B.offsetLeft;aD+=B.offsetTop;if((aS=='IE'||aS=='chrome'||aS=='safari'||(aS=='FF'&&B.tagName!="TABLE"))&&B!=aa){if(aS=='IE'&&an>7&&ad.isXHTML(k)){B=B.offsetParent;continue;}var R=by(B,'borderTopWidth',k)+"";if(R.indexOf('px')>0){aD=aD+parseInt(R);if(B.tagName=='BODY'&&aS=='FF'&& !r)aD=aD+parseInt(R);}else{if(B.offsetParent!=null){if(B.offsetParent.tagName=="TABLE"&&aS=='IE'){L=1;if((B.offsetParent.border+0)*1>0)aD++;}}}var M=by(B,'borderLeftWidth',k);if(M.indexOf('px')>0){ap=ap+parseInt(M);if(B.tagName=='BODY'&&aS=='FF'&& !r)ap=ap+parseInt(M);}else{if(B.offsetParent!=null){if(B.offsetParent.tagName=="TABLE"&&aS=='IE'){L=1;if((B.offsetParent.border+0)*1>0)ap++;}}}}B=B.offsetParent;}return[ap,aD];},getCurrentStyle:function(B,aN,k){if(!k)k=window;var as,aS=ad.getBrowser().name;switch(aS){case 'IE':as=B.currentStyle[aN];break;default:as=k.document.defaultView.getComputedStyle(B,null)[aN];}return as;},createHTML:function(D,g){if((!g['rf'])||(g['rf']==''))g['rf']='document.body';var Y='',bo='width:'+g['w']+'px;height:'+g['h']+'px;',aR=ad.getBrowser().name,bF=ad.getBrowser().version,T='_itsm_html_'+D+'_'+I['ad_id']+'_'+I['pos_id'],cg='_itsm_htmldiv_'+D+'_'+I['ad_id']+'_'+I['pos_id'];if(!g['w']|| !g['h']||g['w']==''||g['h']=='')bo='';var z='',cE='position:absolute;left:0px;top:0px;';if(g['z']!==''){z='z-index:'+g['z']+';';}cH[D]={partName:D,domID:T,divID:cg,params:g,location:{left:0,top:0,insideLeft:0,insideTop:0,width:g['w'],height:g['h'],isFloat:1},eventList:{},listenerList:{},loaded:1};var C=cH[D];ad.P(C);var J=ad.am(C);g['rt']=J['rt'];g['rf']=J['rf'];if(!g['t'])g['t']='';Y='<div id="'+T+'" style="'+cE+z+'" title="'+g['t']+'" border=0>'+g['html']+'</div>';Y='<div id="'+cg+'" style="text-align:left !important;margin-left:0px;padding:0px !important;border:0px none;overflow:hidden;width:0px;height:0px;visibility:hidden;'+J['p']+z+'">'+Y+'</div>';ad.aq(C,Y);var A=C.bN.document.getElementById(T);C.insidePart=A;C.part=C.bN.document.getElementById(cg);return C;},copyPart:function(D,aF,aU,aP){var ao={};for(var i in aF.params){ao[i]=aF.params[i];}for(var i in aP){ao[i]=aP[i];}return eval('ad.'+aU+'(D,ao)');},computeLocation:function(c,ay){var g=c.params;if(ay){try{var k=cH[g['rf']],ag=[k.location['left'],k.location['top']];}catch(e){var k=ad.getObject(g['rf'],c.bN);if(!k)return;var ag=ad.getObjCoordinate(k,c.bN);ay=0;}}else{var k=ad.getObject(g['rf'],c.bN);if(!k)return;var ag=ad.getObjCoordinate(k,c.bN);}var ar=ad.o(g['rz']),au=ad.o(g['rzp']),bd=ag[0],bk=ag[1],aH=ar[0],aJ=ar[1],aM=au[0],aL=au[1],ae=0,af=0,ah,ac;if(!ay){if(k.tagName=='BODY'){ah=ad.getClient('Width',c.bN);ac=ad.getClient('Height',c.bN);}else{ah=k.offsetWidth;ac=k.offsetHeight;}}else{ah=k.location['width'];ac=k.location['height'];}ae=bd+ah*aH;af=bk+ac*aJ;ae+=(-aM*c.location['width']);af+=(-aL*c.location['height']);ae+=g['x'];af+=g['y'];ae=Math.floor(ae);af=Math.floor(af);c.location['left']=ae;c.location['top']=af;ad.aV(c);ad.insideComputeLocation(c);},insideComputeLocation:function(c){var p='px',bO=c.location,t=c.insidePart,g=c.params,ar=ad.o(g['irz']?g['irz']:1),au=ad.o(g['irz']?g['irz']:1),bd=0,bk=0,aH=ar[0],aJ=ar[1],aM=au[0],aL=au[1],ae=0,af=0,ah=bO['width'],ac=bO['height'];if(ad.getBrowser().name=='chrome'&&c.base=='flash'){t.style.width=g['w']+p;t.style.height=g['h']+p;}ae=bd+ah*aH;af=bk+ac*aJ;ae+=(-aM*t.offsetWidth);af+=(-aL*t.offsetHeight);ae=Math.floor(ae);af=Math.floor(af);bO['insideLeft']=ae;bO['insideTop']=af;},setLocation:function(c){var p='px',bL=c.part.style,bO=c.location;c.insidePart.style.left=bO['insideLeft']+p;c.insidePart.style.top=bO['insideTop']+p;if(c.loaded){if(bL.position=='fixed'||bL.position=='relative'){bL.width=bO['width']+p;bL.height=bO['height']+p;}else{if(bO['left']+bO['width']>ad.getScroll('Width',c.bN)){var ai=(ad.getScroll('Width',c.bN)>=ad.getClient('Width',c.bN))?ad.getScroll('Width',c.bN)-bO['left']:ad.getClient('Width',c.bN)-bO['left'];if(ai>=0){bL.width=ai+p;}else{bO['left']=ad.getScroll('Width',c.bN)-1;bL.width='1px';}}else{bL.width=bO['width']+p;}if(bO['top']+bO['height']>ad.getScroll('Height',c.bN)){var O=(ad.getScroll('Height',c.bN)>=ad.getClient('Height',c.bN))?ad.getScroll('Height',c.bN)-bO['top']:ad.getClient('Height',c.bN)-bO['top'];if(O>=0){bL.height=O+p;}else{bO['top']=ad.getScroll('Height',c.bN)-1;bL.height='1px';}}else{bL.height=bO['height']+p;}}}if(bL.position=='relative'){bL.left=c.params['x']+p;bL.top=c.params['y']+p;}else{bL.left=bO['left']+p;bL.top=bO['top']+p;}},show:function(c){var p='px',bL=c.part.style;c.showing=1;function f(){ad.computeLocation(c);ad.setLocation(c);bL.visibility='visible';};if(!c.location['isFloat']){bL.visibility='visible';ad.insideComputeLocation(c);ad.setLocation(c);}else{f();ad.regListener(c,'locate',f,10);}},hide:function(c){var p='px',F=c.insidePart.style,bL=c.part.style;c.showing=0;if(c.location['isFloat'])ad.unRegListener(c,'locate');if(ad.getBrowser().name=='chrome'&&c.base=='flash'){F.width=0+p;F.height=0+p;}bL.width=0+p;bL.height=0+p;if(ad.getBrowser().name!='IE')bL.visibility='hidden';},getClient:function(aE,k){if(!k)k=window;var bi;eval('bi =ad.isXHTML(k) ? k.document.documentElement.client'+aE+' : k.document.body.client'+aE+';');return bi;},getScroll:function(aE,k){if(!k)k=window;var bh;if(aE=='Left'||aE=='Top'){eval('bh =k.document.body.scroll'+aE+' ? k.document.body.scroll'+aE+' : k.document.documentElement.scroll'+aE+';');return bh;}if(aE=='Height'||aE=='Width'){eval('bh =ad.isXHTML(k) ? k.document.documentElement.scroll'+aE+' : k.document.body.scroll'+aE+';');return bh;}},getObject:function(ax,k){if(ad.getMyObject(ax))return ad.getMyObject(ax);var B,bl;if(k==window)k='window';if(k==parent)k='parent';if(!k)k='window';var aZ=eval(k);if(!(B=aZ.document.getElementById(ax))){try{B=eval(k+'.'+ax);if(!B.nodeType){B=bl;}}catch(e){}}return B;},getMyObject:function(ax){if(cH[ax]){return cH[ax].part;}},attachDOMEvent:function(B,al,Z,at){switch(ad.getBrowser().name){case "IE":return B.attachEvent(al,Z);break;default:return B.addEventListener(al.substr(2),Z,at);}},detachDOMEvent:function(B,al,Z,at){switch(ad.getBrowser().name){case "IE":return B.detachEvent(al,Z);break;default:return B.removeEventListener(al.substr(2),Z,at);}},attachCustomEvent:function(c,H,aj,bs){if(!c.eventList[H]){c.eventList[H]=[aj];}else{if(bs){c.eventList[H]=[aj].concat(c.eventList[H]);}else{c.eventList[H][c.eventList[H].length]=aj;}}},detachCustomEvent:function(c,H,aj){var K=c.eventList[H];for(var V in K){if(K[V]==aj){delete K[V];break;}}},fireCustomEvent:function(c,H){var K=c.eventList[H];for(var V in K){if(!isNaN(Number(V)))K[V]();}},regListener:function(c,X,bD,bx){ad.unRegListener(c,X);c.listenerList[X]={};c.listenerList[X].av=bD;c.listenerList[X].aW=function(){if(c.listenerList[X]){window.clearTimeout(c.listenerList[X].aI);c.listenerList[X].av();if(c.listenerList[X])c.listenerList[X].aI=setTimeout(arguments.callee,bx);}};c.listenerList[X].aI=setTimeout(function(){if(c.listenerList[X]){window.clearTimeout(c.listenerList[X].aI);c.listenerList[X].aW();}},bx);},unRegListener:function(c,X){if(c.listenerList[X]){clearTimeout(c.listenerList[X].aI);delete c.listenerList[X];}},aV:function(c){switch(c.params['rt']*1){case bX.cp:ad.aB(c);break;case bX.cs:ad.cC(c);break;case bX.cl:ad.v(c);break;}},v:function(c){var bO=c.location,cD=ad.getScroll;if(typeof ca.startScrollLeft=='undefined')ca.startScrollLeft=cD('Left',c.bN);if(typeof ca.startScrollTop=='undefined')ca.startScrollTop=cD('Top',c.bN);bO['left']+=ca.startScrollLeft;bO['top']+=ca.startScrollTop;},aB:function(c){var bO=c.location,cD=ad.getScroll,ak=I['top_gap'];bO['left']+=cD('Left',c.bN);bO['top']+=cD('Top',c.bN);if(ak&&ak>0){if(bO['top']<ak){bO['top']=ak;}}},cC:function(c){var bO=c.location,ak=I['top_gap'];if(bO['top']+ad.getScroll('Top',c.bN)<ak){bO['top']=ak-ad.getScroll('Top',c.bN);}},getEnabled:function(){var e=window['itsm_Start_Enabled_'+I['pos_id']];return(e===true)||(typeof e=='undefined');},setEnabled:function(){window['itsm_Start_Enabled_'+I['pos_id']]=true;},am:function(c){var bO=c.location,g=c.params,aR=ad.getBrowser().name,bF=ad.getBrowser().version,bN=c.parent,aC=g['rt'],U={},Q='_itsm_'+l.ad_id+'_'+l.pos_id+'.iframePart';function d(){if((typeof g['rf']=='undefined')||(g['rf']==''))return 1;};U['rf']=g['rf'];switch(aC){case bX.n:bO.isFloat=0;case bX.cf:if(d())U['rf']=Q;break;case bX.cb:if(d())U['rf']='float';break;case bX.cr:bO.isFloat=0;if(d())U['rf']='';break;case bX.ci:bO.isFloat=0;case bX.bU:case bX.bS:case bX.bZ:case bX.bP:default:if(d())U['rf']='document.body';}var bE=ad.isXHTML(bN);U['rt']=aC;if(bO.isFloat){if(((aR=='IE'&&bE==true&&bF>=7&&ad.getBrowser().childName!='MT')||(aR=='FF'||aR=='chrome'||aR=='safari'||aR=='opera'))&&(aC==14||aC==15)){U['p']='position:&#102;ixed;left:0px;top:0px;';}else{U['p']='position:&#97;bsolute;left:0px;top:0px;';switch(aC){case 15:U['rt']=12;break;case 14:U['rt']=3;break;}}}else{if(!U['p'])U['p']='position:relative;padding:0px;border:0px;';}return U;},P:function(c){switch(c.params['rt']){case bX.cf:case bX.cb:case bX.bU:case bX.bS:case bX.bZ:case bX.n:case bX.bP:for(var i=0;i<parent.frames.length;i++){if(parent.frames[i]==window){c.iframePart=parent.document.getElementsByTagName("iframe")[i];c.bN=parent;parent['_itsm_'+l.ad_id+'_'+l.pos_id]={};parent['_itsm_'+l.ad_id+'_'+l.pos_id].iframePart=c.iframePart;break;}}break;default:c.bN=window;}},aq:function(c,Y){var ao=ad.getObject(c.params['rf'],c.bN);switch(c.params['rt']){case bX.ci:document.write(Y);break;case bX.cr:if(c.params['rf']==''&& !ao){ad.bV(c.bN,Y);}else{ad.insertAdjacentHTML(ao,'beforeBegin',Y);}break;case bX.n:ao||(ao=c.iframePart);ad.insertAdjacentHTML(ao,'beforeBegin',Y);break;default:ad.bV(c.bN,Y);}},bR:function(cu){try{window.eval(cu);}catch(e){}},bV:function(bN,Y){var bQ=bN.document.body.childNodes;for(var i=0;i<bQ.length;i++){if(bQ[i].nodeType==1){ad.insertAdjacentHTML(bQ[i],'beforeBegin',Y);break;}}},o:function(bA){bA--;var bg=3;var bu=(bA%bg)/2;var bt=(Math.floor(bA/bg))/2;return[bu,bt];}};j.parts={};j.props={params:l,trackingList:[],lastEventArg:'',stopped:0,bY:{cw:1,cv:2,cp:3,cl:4,ci:5,cq:6,cr:7,ct:8,cf:9,cb:10,ck:11,bU:12,bS:13,cs:14,bZ:15,bT:16,bP:17}};var I=j.props.params,ad=j.methods,cH=j.parts,ca=j.props,bX=ca.bY;var f=ad.show,cj=ad.hide,m=I.parts;for(var i=0;i<m.length;i++){ad.createHTML(m[i]["name"],{w:m[i]["w"],h:m[i]["h"],'rt':m[i]["rftype"],'rz':(m[i]["rfarea"]+'').substr(0,1),'rzp':(m[i]["rfarea"]+'').substr(1,1),'rf':m[i]["rfobj"],x:m[i]["x"],y:m[i]["y"],z:m[i]["zindex"],html:m[i]["html"]});}} 

_itsm_2388_anyshape({
ad_id:3067
,pos_id:2388
,parts:[
{
name:'shape'
,html:'<iframe frameborder="0" width="250" height="250" marginwidth="0" marginheight="0" scrolling="no" src="' + itsm_2388_linksrc + '"></iframe>'
,w:250
,h:250
,rftype:14
,rfarea:itsm_2388_o_code
,rfobj:''
,x:0
,y:itsm_2388_init_y
,zindex:100
}
,{
name:'shapeClose'
,html:'<img src="http://www2.xinmin.cn/close.gif" width="11" height="11" title="关闭" style="cursor:pointer;">'
,w:13
,h:13
,rftype:0
,rfarea:33
,rfobj:'shape'
,x:0
,y:0
,zindex:200
}
]
});
var itsm_2388_part=_itsm_3067_2388;

function itsm_2388_closeShape(){
	itsm_2388_part.methods.hide(itsm_2388_part.parts['shape']);
	itsm_2388_part.methods.hide(itsm_2388_part.parts['shapeClose']);
}

itsm_2388_part.methods.attachDOMEvent(itsm_2388_part.parts['shapeClose'].part,'onclick',itsm_2388_closeShape);

function itsm_2388_showPart(name){
	if(itsm_2388_part.methods.getCurrentStyle(itsm_2388_part.methods.getObject(itsm_2388_part.parts[name].params.rf),'position')=='fixed')
		itsm_2388_part.parts[name].part.style.position='fixed';
	itsm_2388_part.methods.show(itsm_2388_part.parts[name]);
}

itsm_2388_showPart('shape');
if(itsm_2388_showclose)
	itsm_2388_showPart('shapeClose');

if(itsm_2388_movingup)
	setTimeout("itsm_2388_moveup()",100);

if(itsm_2388_displaytime)
	setTimeout("itsm_2388_close()",itsm_2388_displaytime*1000);

function itsm_2388_moveup(){
	var y=itsm_2388_part.parts["shape"].params.y;
	y-=itsm_2388_movelen;
	itsm_2388_part.parts["shape"].params.y=y;
	if(y>0)
		setTimeout("itsm_2388_moveup()",100);
}

function itsm_2388_close(){
	itsm_2388_closeShape();
}

document.write("<scr" + "ipt type='text/javascript' src='http://www2.xinmin.cn:6900/pv/?id=3067&catalog=2388'></scr" + "ipt>");