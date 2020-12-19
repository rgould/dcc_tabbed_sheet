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
