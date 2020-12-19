on("sheet:opened", function() {
  validateAttrMods();
});

on("change:str change:int change:agi change:per change:sta change:luck change:luckstarting", function(e) {
  var attr = e.sourceAttribute;
  calculateMod([attr]);
});

calculateMod = function(attributes) {
  attributes.map(function(attr) {
    getAttrs([attr], function(v) {
      var attrModName = attr + 'Mod';
      var updatedVal  = {};

      if (v[attr] >= 24) {
        updatedVal[attrModName] = 6;
      } else if (v[attr] >= 22 && v[attr] <= 23) {
        updatedVal[attrModName] = 5;
      } else if (v[attr] >= 20 && v[attr] <= 21) {
        updatedVal[attrModName] = 4;
      } else if (v[attr] >= 18 && v[attr] <= 19) {
        updatedVal[attrModName] = 3;
      } else if (v[attr] >= 16 && v[attr] <= 17) {
        updatedVal[attrModName] = 2;
      } else if (v[attr] >= 13 && v[attr] <= 15) {
        updatedVal[attrModName] = 1;
      } else if (v[attr] >= 6 && v[attr] <= 8) {
        updatedVal[attrModName] = -1;
      } else if (v[attr] >= 4 && v[attr] <= 5) {
        updatedVal[attrModName] = -2;
      } else if (v[attr] <= 3) {
        updatedVal[attrModName] = -3;
      } else {
        updatedVal[attrModName] = 0
      }

      setAttrs(updatedVal);
    });
  });
}

validateAttrMods = function() {
  calculateMod(['str', 'int', 'agi', 'per', 'sta', 'luck', 'luckStarting']);
}

/* ---- BEGIN: TheAaronSheet.js ---- */
// Github:   https://github.com/shdwjk/TheAaronSheet/blob/master/TheAaronSheet.js
// By:       The Aaron, Arcane Scriptomancer
// Contact:  https://app.roll20.net/users/104025/the-aaron
// Minified with http://jscompress.com/
var TAS=TAS||function(){"use strict";var a="0.2.4",b=1457098091,c={debug:{key:"debug",title:"DEBUG",color:{bgLabel:"#7732A2",label:"#F2EF40",bgText:"#FFFEB7",text:"#7732A2"}},error:{key:"error",title:"Error",color:{bgLabel:"#C11713",label:"white",bgText:"#C11713",text:"white"}},warn:{key:"warn",title:"Warning",color:{bgLabel:"#F29140",label:"white",bgText:"#FFD8B7",text:"black"}},info:{key:"info",title:"Info",color:{bgLabel:"#413FA9",label:"white",bgText:"#B3B2EB",text:"black"}},notice:{key:"notice",title:"Notice",color:{bgLabel:"#33C133",label:"white",bgText:"#ADF1AD",text:"black"}},log:{key:"log",title:"Log",color:{bgLabel:"#f2f240",label:"black",bgText:"#ffff90",text:"black"}},callstack:{key:"TAS",title:"function",color:{bgLabel:"#413FA9",label:"white",bgText:"#B3B2EB",text:"black"}},callstack_async:{key:"TAS",title:"ASYNC CALL",color:{bgLabel:"#413FA9",label:"white",bgText:"#413FA9",text:"white"}},TAS:{key:"TAS",title:"TAS",color:{bgLabel:"grey",label:"black;background:linear-gradient(#304352,#d7d2cc,#d7d2cc,#d7d2cc,#304352)",bgText:"grey",text:"black;background:linear-gradient(#304352,#d7d2cc,#d7d2cc,#d7d2cc,#304352)"}}},d={debugMode:!1,logging:{log:!0,notice:!0,info:!0,warn:!0,error:!0,debug:!1}},e=[],f={},g=function(a){switch(typeof a){case"string":return"string";case"boolean":return"boolean";case"number":return _.isNaN(a)?"NaN":a.toString().match(/\./)?"decimal":"integer";case"function":return"function: "+(a.name?a.name+"()":"(anonymous)");case"object":return _.isArray(a)?"array":_.isArguments(a)?"arguments":_.isNull(a)?"null":"object";default:return typeof a}},h=function(a,b,c){_.each(c,function(c){var d=g(c);switch(d){case"string":a(c);break;case"undefined":case"null":case"NaN":a("["+d+"]");break;case"number":case"not a number":case"integer":case"decimal":case"boolean":a("["+d+"]: "+c);break;default:a("["+d+"]:========================================="),b(c),a("=========================================================")}})},i=function(a){var b,c=a.key,e=a.title||"TAS",f=a.color&&a.color.bgLabel||"blue",g=a.color&&a.color.label||"white",i=a.color&&a.color.bgText||"blue",j=a.color&&a.color.text||"white";return b=function(a){console.log("%c "+e+": %c "+a+" ","background-color: "+f+";color: "+g+"; font-weight:bold;","background-color: "+i+";color: "+j+";")},function(){("TAS"===c||d.logging[c])&&h(b,function(a){console.log(a)},_.toArray(arguments))}},j=i(c.debug),k=i(c.error),l=i(c.warn),m=i(c.info),n=i(c.notice),o=i(c.log),p=i(c.TAS),q=i(c.callstack),r=i(c.callstack_async),s=function(a,b){var c=_.findIndex(e,function(c){return _.difference(c.stack,a).length===_.difference(a,c.stack).length&&0===_.difference(c.stack,a).length&&c.label===b});return-1===c&&(c=e.length,e.push({stack:a,label:b})),c},t=function(a){var b=_.defaults(a,d);b.logging=_.defaults(a&&a.logging||{},d.logging),d=b},u=function(){d.logging.debug=!0,d.debugMode=!0},v=function(){var a=new Error("dummy"),b=_.map(_.rest(a.stack.replace(/^[^\(]+?[\n$]/gm,"").replace(/^\s+at\s+/gm,"").replace(/^Object.<anonymous>\s*\(/gm,"{anonymous}()@").split("\n")),function(a){return a.replace(/\s+.*$/,"")});return b},w=function(a){var b,c;_.find(a,function(a){return(b=a.match(/TAS_CALLSTACK_(\d+)/))?(c=e[b[1]],r("===================="+(c.label?"> "+c.label+" <":"")+"===================="),w(c.stack),!0):(q(a),!1)})},x=function(){var a;d.debugMode&&(a=v(),a.shift(),p("==============================> CALLSTACK <=============================="),w(a),p("========================================================================="))},y=function(a,b,c){var e;return"function"==typeof a&&(c=b,b=a,a=void 0),d.debugMode?(e=v(),e.shift(),function(a,b,c,d){var e=s(c,d);return new Function("cb","ctx","TASlog","return function TAS_CALLSTACK_"+e+"(){TASlog('Entering: '+(cb.name||'(anonymous function)'));cb.apply(ctx||{},arguments);TASlog('Exiting: '+(cb.name||'(anonymous function)'));};")(a,b,p)}(b,c,e,a)):function(a,b){return function(){a.apply(b||{},arguments)}}(b,c)},z=function(a,b){f[a]=b},A=function(){setAttrs(f),f={}},B=function(a,b){return _.chain(a).reduce(function(b,c){return"string"==typeof c?b.push(c):(_.isArray(a)||_.isArguments(a))&&(b=B(c,b)),b},_.isArray(b)&&b||[]).uniq().value()},C=function(a,b){Object.defineProperty(a,"id",{value:b,writeable:!1,enumerable:!1})},D=function(a,b,c,d){!function(){var e=_.contains(["S","F","I","D"],b)?"_"+b:b,f=d||b,g=c;_.each(["S","I","F"],function(b){_.has(a,b)||Object.defineProperty(a,b,{value:{},enumerable:!1,readonly:!0})}),_.has(a,"D")||Object.defineProperty(a,"D",{value:_.reduce(_.range(10),function(a,b){return Object.defineProperty(a,b,{value:{},enumerable:!0,readonly:!0}),a},{}),enumerable:!1,readonly:!0}),Object.defineProperty(a,e,{enumerable:!0,set:function(a){a!==g&&(g=a,z(f,a))},get:function(){return g}}),Object.defineProperty(a.S,e,{enumerable:!0,set:function(a){var b=a.toString();b!==g&&(g=b,z(f,b))},get:function(){return g.toString()}}),Object.defineProperty(a.I,e,{enumerable:!0,set:function(a){var b=parseInt(a,10)||0;b!==g&&(g=b,z(f,b))},get:function(){return parseInt(g,10)||0}}),Object.defineProperty(a.F,e,{enumerable:!0,set:function(a){var b=parseFloat(a)||0;b!==g&&(g=b,z(f,b))},get:function(){return parseFloat(g)||0}}),_.each(_.range(10),function(b){Object.defineProperty(a.D[b],e,{enumerable:!0,set:function(a){var c=(parseFloat(a)||0).toFixed(b);c!==g&&(g=c,z(f,c))},get:function(){return(parseFloat(g)||0).toFixed(b)}})})}()},E=function(a){return function(a){var b=a,c=[],d=[],e=[],f=[],g=function(){return c=B(arguments,c),this},h=function(){return d=B(arguments,d),this},i=function(b,c,d,f){return e.push({type:"reduce",func:b&&_.isFunction(b)&&b||_.noop,memo:_.isUndefined(c)&&0||c,final:d&&_.isFunction(d)&&d||_.noop,context:f||{}}),this},j=function(b,c,d){return e.push({type:"map",func:b&&_.isFunction(b)&&b||_.noop,final:c&&_.isFunction(c)&&c||_.noop,context:d||{}}),this},k=function(b,c,d){return e.push({type:"each",func:b&&_.isFunction(b)&&b||_.noop,final:c&&_.isFunction(c)&&c||_.noop,context:d||{}}),this},l=function(b,c){return e.push({type:"tap",final:b&&_.isFunction(b)&&b||_.noop,context:c||{}}),this},m=function(b,c){return f.push({callback:b&&_.isFunction(b)&&b||_.noop,context:c||{}}),this},n=function(g,h){var i={},j={},k=[],l=[];m(g,h),getSectionIDs("repeating_"+b,function(a){k=a,l=_.reduce(k,function(a,c){return a.concat(_.map(d,function(a){return"repeating_"+b+"_"+c+"_"+a}))},[]),getAttrs(_.uniq(c.concat(l)),function(a){_.each(c,function(b){a.hasOwnProperty(b)&&D(j,b,a[b])}),i=_.reduce(k,function(c,e){var f={};return C(f,e),_.each(d,function(c){var d="repeating_"+b+"_"+e+"_"+c;D(f,c,a[d],d)}),c[e]=f,c},{}),_.each(e,function(a){var b;switch(a.type){case"tap":_.bind(a.final,a.context,i,j)();break;case"each":_.each(i,function(b){_.bind(a.func,a.context,b,j,b.id,i)()}),_.bind(a.final,a.context,i,j)();break;case"map":b=_.map(i,function(b){return _.bind(a.func,a.context,b,j,b.id,i)()}),_.bind(a.final,a.context,b,i,j)();break;case"reduce":b=a.memo,_.each(i,function(c){b=_.bind(a.func,a.context,b,c,j,c.id,i)()}),_.bind(a.final,a.context,b,i,j)()}}),A(),_.each(f,function(a){_.bind(a.callback,a.context)()})})})};return{attrs:g,attr:g,column:h,columns:h,field:h,fields:h,reduce:i,inject:i,foldl:i,map:j,collect:j,each:k,forEach:k,tap:l,do:l,after:m,last:m,done:m,execute:n,go:n,run:n}}(a)},F=function(a,b,c){E(a).attr(c).field(b).reduce(function(a,c){return a+c.F[b]},0,function(a,b,d){d.S[c]=a}).execute()};return console.log("%c•.¸¸.•*´¨`*•.¸¸.•*´¨`*•.¸  The Aaron Sheet  v"+a+"  ¸.•*´¨`*•.¸¸.•*´¨`*•.¸¸.•","background: linear-gradient(to right,green,white,white,green); color:black;text-shadow: 0 0 8px white;"),console.log("%c•.¸¸.•*´¨`*•.¸¸.•*´¨`*•.¸  Last update: "+new Date(1e3*b)+"  ¸.•*´¨`*•.¸¸.•*´¨`*•.¸¸.•","background: linear-gradient(to right,green,white,white,green); color:black;text-shadow: 0 0 8px white;"),{repeatingSimpleSum:F,repeating:E,config:t,callback:y,callstack:x,debugMode:u,_fn:y,debug:j,error:k,warn:l,info:m,notice:n,log:o}}();
/* ---- END: TheAaronSheet.js ---- */

on("change:repeating_armor:armorcheck change:repeating_armor:armoracbase change:repeating_armor:armormagicbonus change:repeating_armor:armorspeed change:repeating_armor:armoractive remove:repeating_armor change:agimod change:armorClassLuckyRoll change:luckstarting", function() {

  getAttrs(["acCalc", "armorCheck", "armorSpeed", "agiMod", "armorClassLuckyRoll" , "luckStartingMod"], function(values) {

        console.log("AC Lucky Roll value="+values.armorClassLuckyRoll);

        var baseAc = parseInt(10);
        var agiAc = parseInt(values.agiMod);
        var checkLuckyAc = (values.armorClassLuckyRoll == 'on') ? true : false;
        var luckyAc = parseInt(values.luckStartingMod);
        var startAc = 0;

        if ((checkLuckyAc) == true) {
            console.log("**AC Lucky Roll is Checked**");
            startAc = baseAc + agiAc + luckyAc;
        } else {
            console.log("**AC Lucky Roll is not Checked**");
            startAc = baseAc + agiAc;
        }

        console.log("Starting AC Value="+ baseAc);
      console.log("Agi Bonus to AC="+ agiAc);
      console.log("Lucky Roll to AC="+ luckyAc);
      console.log("Base Starting AC="+ startAc);

        setAttrs({
            acCalc: startAc,
            armorCheck: parseInt(0),
            armorSpeed: parseInt(0)
        });
    });

    TAS.repeating("armor")
        .attrs("acCalc", "armorCheck", "armorSpeed", "agiMod", "armorClassLuckyRoll")
        .fields("armorAcBase","armorMagicBonus","armorCheck","armorSpeed","armorActive")
        .map(function(row, attrSet, id, rowSet) {

          console.log(row.armorActive);

          var check = parseInt(row.armorCheck)||0;
            var speed = parseInt(row.armorSpeed)||0;
            //var checkArmor = (row.armorActive);
            var checkArmor = (row.armorActive == 'on') ? true : false;
            //var CheckNoArmor = (row.armorActiveUnarmored);
            //var CheckNoArmor = (row.armorActiveUnarmored == 'on') ? true : false;
            var acBase = parseInt(row.armorAcBase)||0;
            var acBonus = parseInt(row.armorMagicBonus)||0;

            //attrSet.AC_Unarmored_CalcZero += parseInt(ACBase) + parseInt(ACBonus);
            //attrSet.acCalcZero += parseInt(ACBase) + parseInt(ACBonus);

          console.log("CheckBonus="+ check);
          console.log("SpeedBonus="+ speed);
          console.log("Active Armor Checked="+ checkArmor);
          //console.log("Unarmored Checked="+ CheckNoArmor);
          console.log("Base Armor="+ acBase);
          console.log("Bonus Armor="+ acBonus);

          console.log("AGI Mod="+ attrSet.agiMod);
          console.log("LuckyRoll="+ attrSet.armorClassLuckyRoll);
          console.log("Current AC="+ attrSet.acCalc);

            if ((checkArmor) == true) {
              console.log("1");
                attrSet.acCalc += parseInt(acBase) + parseInt(acBonus);
                attrSet.armorCheck += parseInt(check);
                attrSet.armorSpeed += parseInt(speed);
                console.log("Current Worn AC="+ attrSet.acCalc);
            } else {
              console.log("4");
              //updateStartingArmor(['acCalcZero', 'armorCheckZero', 'armorSpeedZero', 'agiMod', 'armorClassLuckyRoll', 'luckstartingMod']) ;
            }

        })
        .execute();
});

/*on("change:repeating_rangedweapon:rangedweapontype change:repeating_rangedweapon:attackrange remove:repeating_rangedweapon change:strmod", function() {

  getAttrs(["repeating_rangedweapon_rangedWeaponType", "repeating_rangedweapon_attackRange", "strMod"], function(values) {

        console.log("Ranged weapon type value="+values.repeating_rangedweapon_rangedWeaponType);
        console.log("Attack Range value="+values.repeating_rangedweapon_attackRange);

        var rangedThrownMod = parseInt(values.strMod);
        var checkRangedWeaponType = (values.repeating_rangedweapon_rangedWeaponType == 'Thrown') ? true : false;
        var checkAttackRange = (values.repeating_rangedweapon_attackRange == 'Short') ? true : false;
        var rangedThrownBonus = 0;

        if (checkRangedWeaponType == true && checkAttackRange == true) {
            console.log("**Ranged Type is THROWN**");
            console.log("**Attack Range is SHORT**");
            rangedThrownBonus = rangedThrownMod;
            console.log("**BONUS IS="+rangedThrownBonus);
        } else {
            console.log("**Ranged Type is MISSILE or Attack Range is MED/LONG**");
            rangedThrownBonus = 0;
            console.log("**BONUS IS="+rangedThrownBonus);
        }

        setAttrs({
            repeating_rangedweapon_thrownShortRangeBonus: rangedThrownBonus
        });
        console.log("****FINAL STR BONUS ="+values.repeating_rangedweapon_thrownShortRangeBonus);
    });
});

on("change:repeating_rangedweapon:attackrange remove:repeating_rangedweapon", function() {

  getAttrs(["repeating_rangedweapon_attackRange"], function(values) {

        console.log("Attack Range value="+values.repeating_rangedweapon_attackRange);

        var checkMedPenalty = (values.repeating_rangedweapon_attackRange == 'Medium') ? true : false;
        var rangedMedPenalty = 0;

        if (checkMedPenalty == true) {
            console.log("**Range is MED**");
            rangedMedPenalty = 2;
            console.log("**MINUS IS="+rangedMedPenalty);
        } else {
            console.log("**Range is SHORT or LONG**");
            rangedMedPenalty = 0;
            console.log("**MINUS IS="+rangedMedPenalty);
        }

        setAttrs({
            repeating_rangedweapon_mediumRangePenalty: rangedMedPenalty
        });
        console.log("**FINAL MED PENALTY ="+values.repeating_rangedweapon_mediumRangePenalty);
    });
});*/
