function out = model
%
% heat_approx.m
%
% Model exported on Sep 3 2021, 23:02 by COMSOL 5.4.0.225.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\dcy60\Google Drive\Research\MLOPT\code_data\heat');

model.label('heat_approx.mph');

model.param.set('l', '0.1[m]', 'horizontal length');
model.param.set('l_copper', '0.002[m]', 'copper thickness');
model.param.set('T_max', '60[degC]', 'maximum temperature');
model.param.set('q0', '10000[W/m^2]', 'heat flux');
model.param.set('qtotal', '632080[W*s/m]');
model.param.set('thres', '0.2');
model.param.set('w1', '1');
model.param.set('w2', '1');
model.param.set('w3', '1');
model.param.set('w4', '1');
model.param.set('w5', '1');
model.param.set('w6', '1');
model.param.set('w7', '1');
model.param.set('w8', '1');
model.param.set('w9', '1');
model.param.set('w10', '1');
model.param.set('w11', '1');
model.param.set('w12', '1');
model.param.set('w13', '1');
model.param.set('w14', '1');
model.param.set('w15', '1');
model.param.set('w16', '1');
model.param.set('w17', '1');
model.param.set('w18', '1');
model.param.set('w19', '1');
model.param.set('w20', '1');
model.param.set('w21', '1');
model.param.set('w22', '1');
model.param.set('w23', '1');
model.param.set('w24', '1');
model.param.set('w25', '1');
model.param.set('w26', '1');
model.param.set('w27', '1');
model.param.set('w28', '1');
model.param.set('w29', '1');
model.param.set('w30', '1');
model.param.set('w31', '1');
model.param.set('w32', '1');
model.param.set('w33', '1');
model.param.set('w34', '1');
model.param.set('w35', '1');
model.param.set('w36', '1');
model.param.set('w37', '1');
model.param.set('w38', '1');
model.param.set('w39', '1');
model.param.set('w40', '1');
model.param.set('w41', '1');
model.param.set('w42', '1');
model.param.set('w43', '1');
model.param.set('w44', '1');
model.param.set('w45', '1');
model.param.set('w46', '1');
model.param.set('w47', '1');
model.param.set('w48', '1');
model.param.set('w49', '1');
model.param.set('w50', '1');
model.param.set('w51', '1');
model.param.set('w52', '1');
model.param.set('w53', '1');
model.param.set('w54', '1');
model.param.set('w55', '1');
model.param.set('w56', '1');
model.param.set('w57', '1');
model.param.set('w58', '1');
model.param.set('w59', '1');
model.param.set('w60', '1');
model.param.set('w61', '1');
model.param.set('w62', '1');
model.param.set('w63', '1');
model.param.set('w64', '1');
model.param.set('w65', '1');
model.param.set('w66', '1');
model.param.set('w67', '1');
model.param.set('w68', '1');
model.param.set('w69', '1');
model.param.set('w70', '1');
model.param.set('w71', '1');
model.param.set('w72', '1');
model.param.set('w73', '1');
model.param.set('w74', '1');
model.param.set('w75', '1');
model.param.set('w76', '1');
model.param.set('w77', '1');
model.param.set('w78', '1');
model.param.set('w79', '1');
model.param.set('w80', '1');
model.param.set('w81', '1');
model.param.set('w82', '1');
model.param.set('w83', '1');
model.param.set('w84', '1');
model.param.set('w85', '1');
model.param.set('w86', '1');
model.param.set('w87', '1');
model.param.set('w88', '1');
model.param.set('w89', '1');
model.param.set('w90', '1');
model.param.set('w91', '1');
model.param.set('w92', '1');
model.param.set('w93', '1');
model.param.set('w94', '1');
model.param.set('w95', '1');
model.param.set('w96', '1');
model.param.set('w97', '1');
model.param.set('w98', '1');
model.param.set('w99', '1');
model.param.set('w100', '1');
model.param.set('w101', '1');
model.param.set('w102', '1');
model.param.set('w103', '1');
model.param.set('d', '0.01');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.table.create('tbl1', 'Table');
model.result.table.create('tbl2', 'Table');
model.result.table.create('tbl3', 'Table');
model.result.table.create('tbl4', 'Table');
model.result.table.create('tbl5', 'Table');
model.result.table.create('tbl6', 'Table');
model.result.table.create('tbl7', 'Table');
model.result.table.create('tbl8', 'Table');

model.component('comp1').func.create('step1', 'Step');
model.component('comp1').func.create('an1', 'Analytic');
model.component('comp1').func('step1').set('location', 0.4);
model.component('comp1').func('step1').set('smooth', 0.02);
model.component('comp1').func('an1').label('interpolation of rho');
model.component('comp1').func('an1').set('expr', 'w1*exp(((x-0.000000)^2+(y-0.050000)^2)/d^2)+w2*exp(((x-0.004358)^2+(y-0.049810)^2)/d^2)+w3*exp(((x-0.008682)^2+(y-0.049240)^2)/d^2)+w4*exp(((x-0.012941)^2+(y-0.048296)^2)/d^2)+w5*exp(((x-0.017101)^2+(y-0.046985)^2)/d^2)+w6*exp(((x-0.021131)^2+(y-0.045315)^2)/d^2)+w7*exp(((x-0.025000)^2+(y-0.043301)^2)/d^2)+w8*exp(((x-0.028679)^2+(y-0.040958)^2)/d^2)+w9*exp(((x-0.032139)^2+(y-0.038302)^2)/d^2)+w10*exp(((x-0.035355)^2+(y-0.035355)^2)/d^2)+w11*exp(((x-0.000000)^2+(y-0.055556)^2)/d^2)+w12*exp(((x-0.004846)^2+(y-0.055386)^2)/d^2)+w13*exp(((x-0.009677)^2+(y-0.054880)^2)/d^2)+w14*exp(((x-0.014480)^2+(y-0.054041)^2)/d^2)+w15*exp(((x-0.019245)^2+(y-0.052875)^2)/d^2)+w16*exp(((x-0.023964)^2+(y-0.051391)^2)/d^2)+w17*exp(((x-0.028637)^2+(y-0.049601)^2)/d^2)+w18*exp(((x-0.033272)^2+(y-0.047518)^2)/d^2)+w19*exp(((x-0.037892)^2+(y-0.045158)^2)/d^2)+w20*exp(((x-0.042538)^2+(y-0.042538)^2)/d^2)+w21*exp(((x-0.000000)^2+(y-0.061111)^2)/d^2)+w22*exp(((x-0.005334)^2+(y-0.060963)^2)/d^2)+w23*exp(((x-0.010671)^2+(y-0.060520)^2)/d^2)+w24*exp(((x-0.016020)^2+(y-0.059786)^2)/d^2)+w25*exp(((x-0.021389)^2+(y-0.058766)^2)/d^2)+w26*exp(((x-0.026798)^2+(y-0.057468)^2)/d^2)+w27*exp(((x-0.032274)^2+(y-0.055901)^2)/d^2)+w28*exp(((x-0.037866)^2+(y-0.054078)^2)/d^2)+w29*exp(((x-0.043644)^2+(y-0.052013)^2)/d^2)+w30*exp(((x-0.049721)^2+(y-0.049721)^2)/d^2)+w31*exp(((x-0.000000)^2+(y-0.066667)^2)/d^2)+w32*exp(((x-0.005821)^2+(y-0.066540)^2)/d^2)+w33*exp(((x-0.011666)^2+(y-0.066160)^2)/d^2)+w34*exp(((x-0.017559)^2+(y-0.065531)^2)/d^2)+w35*exp(((x-0.023533)^2+(y-0.064656)^2)/d^2)+w36*exp(((x-0.029631)^2+(y-0.063544)^2)/d^2)+w37*exp(((x-0.035912)^2+(y-0.062201)^2)/d^2)+w38*exp(((x-0.042459)^2+(y-0.060638)^2)/d^2)+w39*exp(((x-0.049396)^2+(y-0.058868)^2)/d^2)+w40*exp(((x-0.056904)^2+(y-0.056904)^2)/d^2)+w41*exp(((x-0.000000)^2+(y-0.072222)^2)/d^2)+w42*exp(((x-0.006309)^2+(y-0.072117)^2)/d^2)+w43*exp(((x-0.012660)^2+(y-0.071800)^2)/d^2)+w44*exp(((x-0.019098)^2+(y-0.071276)^2)/d^2)+w45*exp(((x-0.025677)^2+(y-0.070547)^2)/d^2)+w46*exp(((x-0.032464)^2+(y-0.069620)^2)/d^2)+w47*exp(((x-0.039549)^2+(y-0.068501)^2)/d^2)+w48*exp(((x-0.047053)^2+(y-0.067199)^2)/d^2)+w49*exp(((x-0.055149)^2+(y-0.065723)^2)/d^2)+w50*exp(((x-0.064086)^2+(y-0.064086)^2)/d^2)+w51*exp(((x-0.000000)^2+(y-0.077778)^2)/d^2)+w52*exp(((x-0.006797)^2+(y-0.077693)^2)/d^2)+w53*exp(((x-0.013655)^2+(y-0.077440)^2)/d^2)+w54*exp(((x-0.020638)^2+(y-0.077021)^2)/d^2)+w55*exp(((x-0.027821)^2+(y-0.076438)^2)/d^2)+w56*exp(((x-0.035297)^2+(y-0.075696)^2)/d^2)+w57*exp(((x-0.043186)^2+(y-0.074801)^2)/d^2)+w58*exp(((x-0.051647)^2+(y-0.073759)^2)/d^2)+w59*exp(((x-0.060901)^2+(y-0.072579)^2)/d^2)+w60*exp(((x-0.071269)^2+(y-0.071269)^2)/d^2)+w61*exp(((x-0.000000)^2+(y-0.083333)^2)/d^2)+w62*exp(((x-0.007285)^2+(y-0.083270)^2)/d^2)+w63*exp(((x-0.014649)^2+(y-0.083080)^2)/d^2)+w64*exp(((x-0.022177)^2+(y-0.082765)^2)/d^2)+w65*exp(((x-0.029965)^2+(y-0.082328)^2)/d^2)+w66*exp(((x-0.038131)^2+(y-0.081772)^2)/d^2)+w67*exp(((x-0.046823)^2+(y-0.081100)^2)/d^2)+w68*exp(((x-0.056240)^2+(y-0.080319)^2)/d^2)+w69*exp(((x-0.066653)^2+(y-0.079434)^2)/d^2)+w70*exp(((x-0.078452)^2+(y-0.078452)^2)/d^2)+w71*exp(((x-0.000000)^2+(y-0.088889)^2)/d^2)+w72*exp(((x-0.007773)^2+(y-0.088847)^2)/d^2)+w73*exp(((x-0.015644)^2+(y-0.088720)^2)/d^2)+w74*exp(((x-0.023716)^2+(y-0.088510)^2)/d^2)+w75*exp(((x-0.032109)^2+(y-0.088219)^2)/d^2)+w76*exp(((x-0.040964)^2+(y-0.087848)^2)/d^2)+w77*exp(((x-0.050461)^2+(y-0.087400)^2)/d^2)+w78*exp(((x-0.060834)^2+(y-0.086879)^2)/d^2)+w79*exp(((x-0.072405)^2+(y-0.086289)^2)/d^2)+w80*exp(((x-0.085635)^2+(y-0.085635)^2)/d^2)+w81*exp(((x-0.000000)^2+(y-0.094444)^2)/d^2)+w82*exp(((x-0.008261)^2+(y-0.094423)^2)/d^2)+w83*exp(((x-0.016638)^2+(y-0.094360)^2)/d^2)+w84*exp(((x-0.025256)^2+(y-0.094255)^2)/d^2)+w85*exp(((x-0.034253)^2+(y-0.094109)^2)/d^2)+w86*exp(((x-0.043797)^2+(y-0.093924)^2)/d^2)+w87*exp(((x-0.054098)^2+(y-0.093700)^2)/d^2)+w88*exp(((x-0.065427)^2+(y-0.093440)^2)/d^2)+w89*exp(((x-0.078158)^2+(y-0.093145)^2)/d^2)+w90*exp(((x-0.092817)^2+(y-0.092817)^2)/d^2)+w91*exp(((x-0.000000)^2+(y-0.100000)^2)/d^2)+w92*exp(((x-0.008749)^2+(y-0.100000)^2)/d^2)+w93*exp(((x-0.017633)^2+(y-0.100000)^2)/d^2)+w94*exp(((x-0.026795)^2+(y-0.100000)^2)/d^2)+w95*exp(((x-0.036397)^2+(y-0.100000)^2)/d^2)+w96*exp(((x-0.046631)^2+(y-0.100000)^2)/d^2)+w97*exp(((x-0.057735)^2+(y-0.100000)^2)/d^2)+w98*exp(((x-0.070021)^2+(y-0.100000)^2)/d^2)+w99*exp(((x-0.083910)^2+(y-0.100000)^2)/d^2)+w100*exp(((x-0.100000)^2+(y-0.100000)^2)/d^2)+w101+w102*x+w103+y');
model.component('comp1').func('an1').set('args', {'x' 'y'});
model.component('comp1').func('an1').set('argunit', 'm');
model.component('comp1').func('an1').set('fununit', '1');
model.component('comp1').func('an1').set('plotargs', {'x' '0' '1'; 'y' '0' '1'});

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('c1', 'Circle');
model.component('comp1').geom('geom1').feature('c1').set('r', 'l/2-l_copper');
model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'table');
model.component('comp1').geom('geom1').feature('pol1').set('table', {'0' '0'; '0' 'l'; 'l' 'l'});
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'pol1'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'c1'});
model.component('comp1').geom('geom1').create('c2', 'Circle');
model.component('comp1').geom('geom1').feature('c2').set('r', 'l/2');
model.component('comp1').geom('geom1').create('pard1', 'PartitionDomains');
model.component('comp1').geom('geom1').feature('pard1').set('partitionwith', 'objects');
model.component('comp1').geom('geom1').feature('pard1').set('keepobject', false);
model.component('comp1').geom('geom1').feature('pard1').selection('domain').set('dif1(1)', 1);
model.component('comp1').geom('geom1').feature('pard1').selection('object').set({'c2'});
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').variable.create('var1');
model.component('comp1').variable('var1').set('r_solid', 'dtopo1.theta_p');
model.component('comp1').variable('var1').set('r_fluid', '1-r_solid', 'ratio of fluid');
model.component('comp1').variable.create('var2');
model.component('comp1').variable('var2').set('r_solid', 'u');
model.component('comp1').variable('var2').set('r_fluid', '1-r_solid', 'ratio of fluid');

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('Cp', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('rho', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('cs', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup('def').func.create('an1', 'Analytic');
model.component('comp1').material('mat1').propertyGroup('def').func.create('an2', 'Analytic');
model.component('comp1').material('mat1').propertyGroup('def').func.create('an3', 'Analytic');
model.component('comp1').material('mat2').selection.set([1]);
model.component('comp1').material('mat2').propertyGroup('def').func.create('k_solid_residual_resistivity_ratio_of_30_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('def').func.create('alpha_solid_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('def').func.create('C_solid_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('def').func.create('HC_solid_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('def').func.create('VP_solid_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('def').func.create('rho_solid_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup.create('ThermalExpansion', 'Thermal expansion');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func.create('dL_solid_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func.create('CTE_solid_1', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat2').propertyGroup('Enu').func.create('E', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('Enu').func.create('nu', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup.create('KG', 'Bulk modulus and shear modulus');
model.component('comp1').material('mat2').propertyGroup('KG').func.create('mu', 'Piecewise');
model.component('comp1').material('mat2').propertyGroup('KG').func.create('kappa', 'Piecewise');

model.component('comp1').cpl.create('aveop1', 'Average');
model.component('comp1').cpl.create('intop1', 'Integration');
model.component('comp1').cpl('aveop1').selection.geom('geom1', 1);
model.component('comp1').cpl('aveop1').selection.set([6]);
model.component('comp1').cpl('intop1').selection.geom('geom1', 1);
model.component('comp1').cpl('intop1').selection.set([6]);

model.component('comp1').common.create('dtopo1', 'DensityTopology');
model.component('comp1').common('dtopo1').selection.set([2]);

model.component('comp1').physics.create('ht', 'HeatTransferInSolidsAndFluids', 'geom1');
model.component('comp1').physics('ht').feature('fluid1').selection.set([2]);
model.component('comp1').physics('ht').feature('fluid1').create('phc1', 'PhaseChangeMaterial', 2);
model.component('comp1').physics('ht').create('hf1', 'HeatFluxBoundary', 1);
model.component('comp1').physics('ht').feature('hf1').selection.set([6 7]);
model.component('comp1').physics('ht').create('temp1', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp1').selection.set([6]);
model.component('comp1').physics('ht').create('hs1', 'HeatSource', 2);
model.component('comp1').physics('ht').feature('hs1').selection.set([2]);
model.component('comp1').physics('ht').create('temp2', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp2').selection.set([6]);
model.component('comp1').physics.create('ge', 'GlobalEquations', 'geom1');
model.component('comp1').physics('ge').feature('ge1').set('DependentVariableQuantity', 'none');
model.component('comp1').physics('ge').feature('ge1').set('CustomDependentVariableUnit', 'W*s/m');
model.component('comp1').physics('ge').create('ge2', 'GlobalEquations', -1);
model.component('comp1').physics('ge').feature('ge2').set('DependentVariableQuantity', 'none');
model.component('comp1').physics('ge').feature('ge2').set('CustomDependentVariableUnit', 's');
model.component('comp1').physics.create('ev', 'Events', 'geom1');
model.component('comp1').physics('ev').create('impl1', 'ImplicitEvent', -1);
model.component('comp1').physics('ev').create('impl2', 'ImplicitEvent', -1);
model.component('comp1').physics('ev').create('is1', 'IndicatorStates', -1);
model.component('comp1').physics.create('c', 'CoefficientFormPDE', 'geom1');
model.component('comp1').physics('c').selection.set([2]);
model.component('comp1').physics.create('opt', 'GeneralOptimization', 'geom1');
model.component('comp1').physics('opt').create('iconstr1', 'IntegralInequality', 2);
model.component('comp1').physics('opt').feature('iconstr1').selection.set([2]);
model.component('comp1').physics('opt').create('iobj1', 'IntegralObjective', 2);
model.component('comp1').physics('opt').feature('iobj1').selection.set([2]);

model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
model.component('comp1').mesh('mesh1').feature('ftri1').selection.geom('geom1');

model.result.table('tbl1').comments('Global Evaluation 1 (q_total, t_total)');
model.result.table('tbl2').comments('Global Evaluation 1 (q_total, t_total)');
model.result.table('tbl3').comments('Global Evaluation 2 (q_total, t_total)');
model.result.table('tbl4').comments('Global Evaluation 3 (state)');
model.result.table('tbl5').comments('Surface Integration 1 (1, u)');
model.result.table('tbl6').label('Objective Probe Table 6');
model.result.table('tbl7').comments('Surface Average 1 (T, u)');
model.result.table('tbl8').comments('Global Evaluation 4 (intop1(ht.ntflux))');

model.component('comp1').variable('var1').label('Variables for study 0');
model.component('comp1').variable('var2').label('Variables for study 1 and 2');

model.component('comp1').view('view1').axis.set('xmin', -0.016247864812612534);
model.component('comp1').view('view1').axis.set('xmax', 0.10847102105617523);
model.component('comp1').view('view1').axis.set('ymin', 0.033497899770736694);
model.component('comp1').view('view1').axis.set('ymax', 0.10793641954660416);

model.component('comp1').material('mat1').label('Water');
model.component('comp1').material('mat1').set('family', 'water');
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('pieces', {'273.15' '413.15' '1.3799566804-0.021224019151*T^1+1.3604562827E-4*T^2-4.6454090319E-7*T^3+8.9042735735E-10*T^4-9.0790692686E-13*T^5+3.8457331488E-16*T^6'; '413.15' '553.75' '0.00401235783-2.10746715E-5*T^1+3.85772275E-8*T^2-2.39730284E-11*T^3'});
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('fununit', 'Pa*s');
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('pieces', {'273.15' '553.75' '12010.1471-80.4072879*T^1+0.309866854*T^2-5.38186884E-4*T^3+3.62536437E-7*T^4'});
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('smooth', 'contd1');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('pieces', {'273.15' '293.15' '0.000063092789034*T^3-0.060367639882855*T^2+18.9229382407066*T-950.704055329848'; '293.15' '373.15' '0.000010335053319*T^3-0.013395065634452*T^2+4.969288832655160*T+432.257114008512'});
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('pieces', {'273.15' '553.75' '-0.869083936+0.00894880345*T^1-1.58366345E-5*T^2+7.97543259E-9*T^3'});
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('table', {'273' '1403';  ...
'278' '1427';  ...
'283' '1447';  ...
'293' '1481';  ...
'303' '1507';  ...
'313' '1526';  ...
'323' '1541';  ...
'333' '1552';  ...
'343' '1555';  ...
'353' '1555';  ...
'363' '1550';  ...
'373' '1543'});
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('interp', 'piecewisecubic');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('fununit', 'm/s');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').label('Analytic ');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('funcname', 'alpha_p');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('expr', '-1/rho(T)*d(rho(T),T)');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('args', {'T'});
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('fununit', '1/K');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('plotargs', {'T' '273.15' '373.15'});
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('funcname', 'gamma_w');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('expr', '1+(T/Cp(T))*(alpha_p(T)*cs(T))^2');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('args', {'T'});
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('fununit', '1');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('plotargs', {'T' '273.15' '373.15'});
model.component('comp1').material('mat1').propertyGroup('def').func('an3').set('funcname', 'muB');
model.component('comp1').material('mat1').propertyGroup('def').func('an3').set('expr', '2.79*eta(T)');
model.component('comp1').material('mat1').propertyGroup('def').func('an3').set('args', {'T'});
model.component('comp1').material('mat1').propertyGroup('def').func('an3').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('an3').set('fununit', 'Pa*s');
model.component('comp1').material('mat1').propertyGroup('def').func('an3').set('plotargs', {'T' '273.15' '553.75'});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'alpha_p(T)' '0' '0' '0' 'alpha_p(T)' '0' '0' '0' 'alpha_p(T)'});
model.component('comp1').material('mat1').propertyGroup('def').set('bulkviscosity', 'muB(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('dynamicviscosity', 'eta(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('ratioofspecificheat', 'gamma_w(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'5.5e-6[S/m]' '0' '0' '0' '5.5e-6[S/m]' '0' '0' '0' '5.5e-6[S/m]'});
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', 'Cp(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('density', 'rho(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.component('comp1').material('mat1').propertyGroup('def').set('soundspeed', 'cs(T)');
model.component('comp1').material('mat1').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat2').label('Copper [solid,residual resistivity ratio of 30]');
model.component('comp1').material('mat2').set('family', 'copper');
model.component('comp1').material('mat2').propertyGroup('def').func('k_solid_residual_resistivity_ratio_of_30_1').label('Piecewise');
model.component('comp1').material('mat2').propertyGroup('def').func('k_solid_residual_resistivity_ratio_of_30_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('def').func('k_solid_residual_resistivity_ratio_of_30_1').set('pieces', {'1.0' '40.0' '12.55868+36.66487*T^1+1.387207*T^2-0.07168113*T^3+6.99799E-4*T^4';  ...
'40.0' '70.0' '2174.919-45.25448*T^1+0.3738471*T^2-9.504397E-4*T^3';  ...
'70.0' '100.0' '2545.87-67.53869*T^1+0.8176488*T^2-0.004470238*T^3+9.22619E-6*T^4';  ...
'100.0' '300.0' '555.4-2.116905*T^1+0.008971429*T^2-1.266667E-5*T^3';  ...
'300.0' '1358.0' '423.7411-0.3133575*T^1+0.001013916*T^2-1.570451E-6*T^3+1.06222E-9*T^4-2.64198E-13*T^5'});
model.component('comp1').material('mat2').propertyGroup('def').func('alpha_solid_1').label('Piecewise 1');
model.component('comp1').material('mat2').propertyGroup('def').func('alpha_solid_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('def').func('alpha_solid_1').set('pieces', {'4.0' '100.0' '1.104402E-5+4.812192E-8*T^1-1.223083E-10*T^2';  ...
'100.0' '210.0' '1.276495E-5+1.849516E-8*T^1+1.203963E-11*T^2-1.023671E-13*T^3';  ...
'210.0' '800.0' '1.47252E-5+8.137386E-9*T^1-4.58414E-12*T^2';  ...
'800.0' '1273.0' '1.83456E-5-1.577095E-9*T^1+1.908643E-12*T^2'});
model.component('comp1').material('mat2').propertyGroup('def').func('C_solid_1').label('Piecewise 2');
model.component('comp1').material('mat2').propertyGroup('def').func('C_solid_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('def').func('C_solid_1').set('pieces', {'1.0' '17.5' '0.00816805501+0.00104457033*T^1+0.00344121866*T^2+2.84703334E-4*T^3+2.24642893E-5*T^4';  ...
'17.5' '62.0' '29.059721-3.76716858*T^1+0.154053918*T^2-0.00104836396*T^3+3.01020641E-7*T^4';  ...
'62.0' '300.0' '-215.281402+8.23639228*T^1-0.0473210818*T^2+1.29111169E-4*T^3-1.35703145E-7*T^4';  ...
'300.0' '1300.0' '342.764033+0.133834821*T^1+5.53525209E-5*T^2-1.97122089E-7*T^3+1.1407471E-10*T^4'});
model.component('comp1').material('mat2').propertyGroup('def').func('HC_solid_1').label('Piecewise 3');
model.component('comp1').material('mat2').propertyGroup('def').func('HC_solid_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('def').func('HC_solid_1').set('pieces', {'1.0' '17.5' '5.19047375E-4+6.63782814E-5*T^1+2.18675672E-4*T^2+1.80917583E-5*T^3+1.42751553E-6*T^4';  ...
'17.5' '62.0' '1.8466289-0.23938848*T^1+0.00978950982*T^2-6.66193216E-5*T^3+1.91286581E-8*T^4';  ...
'62.0' '300.0' '-13.68027+0.523389949*T^1-0.00300706549*T^2+8.20449765E-6*T^3-8.62339136E-9*T^4';  ...
'300.0' '1300.0' '21.7812848+0.00850466618*T^1+3.51743148E-6*T^2-1.25263186E-8*T^3+7.24899338E-12*T^4'});
model.component('comp1').material('mat2').propertyGroup('def').func('VP_solid_1').label('Piecewise 4');
model.component('comp1').material('mat2').propertyGroup('def').func('VP_solid_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('def').func('VP_solid_1').set('pieces', {'293.0' '1358.0' '(exp((-1.77480000e+04/T-7.31700000e-01*log10(T)+1.20038100e+01)*log(10.0)))*1.33320000e+02'});
model.component('comp1').material('mat2').propertyGroup('def').func('rho_solid_1').label('Piecewise 5');
model.component('comp1').material('mat2').propertyGroup('def').func('rho_solid_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('def').func('rho_solid_1').set('pieces', {'4.0' '90.0' '9028.155+0.001936185*T^1-4.310034E-4*T^2-8.227902E-6*T^3';  ...
'90.0' '250.0' '9034.264-0.05885933*T^1-0.001406238*T^2+1.736657E-6*T^3';  ...
'250.0' '800.0' '9062.242-0.3913962*T^1-8.947644E-5*T^2';  ...
'800.0' '1273.0' '9038.962-0.3593546*T^1-9.31574E-5*T^2'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'k_solid_residual_resistivity_ratio_of_30_1(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_solid_residual_resistivity_ratio_of_30_1(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_solid_residual_resistivity_ratio_of_30_1(T[1/K])[W/(m*K)]'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'(alpha_solid_1(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha_solid_1(T[1/K])[1/K]-alpha_solid_1(Tempref[1/K])[1/K])/(T-Tempref),d(alpha_solid_1(T[1/K])[1/K],T)))/(1+alpha_solid_1(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha_solid_1(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha_solid_1(T[1/K])[1/K]-alpha_solid_1(Tempref[1/K])[1/K])/(T-Tempref),d(alpha_solid_1(T[1/K])[1/K],T)))/(1+alpha_solid_1(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha_solid_1(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha_solid_1(T[1/K])[1/K]-alpha_solid_1(Tempref[1/K])[1/K])/(T-Tempref),d(alpha_solid_1(T[1/K])[1/K],T)))/(1+alpha_solid_1(Tempref[1/K])[1/K]*(Tempref-293[K]))'});
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', 'C_solid_1(T[1/K])[J/(kg*K)]');
model.component('comp1').material('mat2').propertyGroup('def').set('HC', 'HC_solid_1(T[1/K])[J/(mol*K)]');
model.component('comp1').material('mat2').propertyGroup('def').set('VP', 'VP_solid_1(T[1/K])[Pa]');
model.component('comp1').material('mat2').propertyGroup('def').set('density', 'rho_solid_1(T[1/K])[kg/m^3]');
model.component('comp1').material('mat2').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('def').addInput('strainreferencetemperature');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func('dL_solid_1').label('Piecewise');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func('dL_solid_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func('dL_solid_1').set('pieces', {'4.0' '80.0' '-0.003272586-6.837087E-8*T^1+1.574823E-8*T^2+3.040518E-10*T^3';  ...
'80.0' '250.0' '-0.003491523+2.12144E-6*T^1+5.197613E-8*T^2-6.339761E-11*T^3';  ...
'250.0' '800.0' '-0.004355177+1.293125E-5*T^1+7.341229E-9*T^2-2.541027E-12*T^3';  ...
'800.0' '1273.0' '-0.004359242+1.427188E-5*T^1+3.639858E-9*T^2'});
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func('CTE_solid_1').label('Piecewise 1');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func('CTE_solid_1').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').func('CTE_solid_1').set('pieces', {'4.0' '13.0' '-8.574809E-9+4.13567E-9*T^1-5.673583E-10*T^2+5.520915E-11*T^3';  ...
'13.0' '60.0' '2.194122E-7-2.662325E-8*T^1+4.800942E-10*T^2+6.093443E-11*T^3-6.195564E-13*T^4';  ...
'60.0' '250.0' '-8.81E-6+3.292355E-7*T^1-1.773823E-9*T^2+4.545667E-12*T^3-4.483983E-15*T^4';  ...
'250.0' '800.0' '1.104756E-5+2.743089E-8*T^1-3.159431E-11*T^2+1.370433E-14*T^3'});
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').set('alphatan', '');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').set('dL', '');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').set('alphatanIso', '');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').set('dLIso', '');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').set('alphatan', {'CTE_solid_1(T[1/K])[1/K]' '0' '0' '0' 'CTE_solid_1(T[1/K])[1/K]' '0' '0' '0' 'CTE_solid_1(T[1/K])[1/K]'});
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').set('dL', {'(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))' '0' '0' '0' '(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))' '0' '0' '0' '(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))'});
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('ThermalExpansion').addInput('strainreferencetemperature');
model.component('comp1').material('mat2').propertyGroup('Enu').func('E').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('Enu').func('E').set('pieces', {'4.0' '1330.0' '1.396274E11-5077626.0*T^1-191131.5*T^2+290.7333*T^3-0.2058552*T^4+5.385261E-5*T^5'});
model.component('comp1').material('mat2').propertyGroup('Enu').func('nu').label('Piecewise 1');
model.component('comp1').material('mat2').propertyGroup('Enu').func('nu').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('Enu').func('nu').set('pieces', {'4.0' '20.0' '0.3413951-9.643661E-5*T^1+2.151898E-6*T^2'; '20.0' '1330.0' '0.339846+2.405498E-5*T^1'});
model.component('comp1').material('mat2').propertyGroup('Enu').set('youngsmodulus', 'E(T[1/K])[Pa]');
model.component('comp1').material('mat2').propertyGroup('Enu').set('poissonsratio', 'nu(T[1/K])');
model.component('comp1').material('mat2').propertyGroup('Enu').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('KG').func('mu').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('KG').func('mu').set('pieces', {'4.0' '1330.0' '5.208306E10-2585817.0*T^1-71978.63*T^2+110.2355*T^3-0.07807297*T^4+2.043615E-5*T^5'});
model.component('comp1').material('mat2').propertyGroup('KG').func('kappa').label('Piecewise 1');
model.component('comp1').material('mat2').propertyGroup('KG').func('kappa').set('arg', 'T');
model.component('comp1').material('mat2').propertyGroup('KG').func('kappa').set('pieces', {'4.0' '1330.0' '1.459784E11+4948257.0*T^1-132451.5*T^2+114.0737*T^3+0.02475104*T^4-9.178407E-5*T^5+3.51125E-8*T^6'});
model.component('comp1').material('mat2').propertyGroup('KG').set('K', '');
model.component('comp1').material('mat2').propertyGroup('KG').set('G', '');
model.component('comp1').material('mat2').propertyGroup('KG').set('K', 'kappa(T[1/K])[Pa]');
model.component('comp1').material('mat2').propertyGroup('KG').set('G', 'mu(T[1/K])[Pa]');
model.component('comp1').material('mat2').propertyGroup('KG').addInput('temperature');

model.component('comp1').common('dtopo1').set('L_min', '0.0022');
model.component('comp1').common('dtopo1').set('p_SIMP', '4');
model.component('comp1').common('dtopo1').set('theta_min', '0');
model.component('comp1').common('dtopo1').set('theta_0', 'thres');

model.component('comp1').physics('ht').prop('AmbientSettings').set('LocationInfo', 'Location:\n  NEW YORK/JOHN F. KE\n  United States\n  North America');
model.component('comp1').physics('ht').prop('AmbientSettings').set('CoordinatesInfo', ['Coordinates: 40.66' native2unicode(hex2dec({'00' 'b0'}), 'unicode') 'N 73.8' native2unicode(hex2dec({'00' 'b0'}), 'unicode') 'E 7.0m']);
model.component('comp1').physics('ht').prop('AmbientSettings').set('ashrae2017LocationInfo', 'Location:\n  JOHN F KENNEDY INTL\n  United States\n  North America');
model.component('comp1').physics('ht').prop('AmbientSettings').set('ashrae2017CoordinatesInfo', ['Coordinates: 40.639' native2unicode(hex2dec({'00' 'b0'}), 'unicode') 'N 73.762' native2unicode(hex2dec({'00' 'b0'}), 'unicode') 'E 3.0m']);
model.component('comp1').physics('ht').feature('fluid1').set('k', [999; 0; 0; 0; 999; 0; 0; 0; 999]);
model.component('comp1').physics('ht').feature('fluid1').set('rho', 888);
model.component('comp1').physics('ht').feature('fluid1').set('Cp', 777);
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('T_pc12', '273.15+53.5[K]');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('dT_pc12', '6[K]');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('L_pc12', '200[kJ/kg]*r_fluid');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('k_phase1', {'0.2*r_fluid+mat2.def.k_iso*(1-r_fluid)'; '0'; '0'; '0'; '0.2*r_fluid+mat2.def.k_iso*(1-r_fluid)'; '0'; '0'; '0'; '0.2*r_fluid+mat2.def.k_iso*(1-r_fluid)'});
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('k_phase2', {'0.1*r_fluid+mat2.def.k_iso*(1-r_fluid)'; '0'; '0'; '0'; '0.1*r_fluid+mat2.def.k_iso*(1-r_fluid)'; '0'; '0'; '0'; '0.1*r_fluid+mat2.def.k_iso*(1-r_fluid)'});
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('rho_phase1', '850*r_fluid+mat2.def.rho*(1-r_fluid)');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('rho_phase2', '800*r_fluid+mat2.def.rho*(1-r_fluid)');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('Cp_phase1', '2000[J/(kg*K)]*r_fluid+mat2.def.Cp*(1-r_fluid)');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('Cp_phase2', '2000[J/(kg*K)]*r_fluid+mat2.def.Cp*(1-r_fluid)');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('gamma_phase1', 1);
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('gamma_phase2', 1);
model.component('comp1').physics('ht').feature('init1').set('Tinit', '298.15[K]');
model.component('comp1').physics('ht').feature('hf1').set('q0', 'q0');
model.component('comp1').physics('ht').feature('hf1').set('h', 'if(ht.Tvar<T_max,q0/1e6[K],1000*ht.kzz/h)');
model.component('comp1').physics('ht').feature('hf1').set('Text', 'if(ht.Tvar<T_max,1e6[K],T_max)');
model.component('comp1').physics('ht').feature('temp1').set('T0', 'T_max');
model.component('comp1').physics('ht').feature('hs1').set('Q0', 10000);
model.component('comp1').physics('ht').feature('temp2').set('T0', '303.15[K]');
model.component('comp1').physics('ge').feature('ge1').set('name', 'q_total');
model.component('comp1').physics('ge').feature('ge1').set('equation', 'q_totalt/1[W/m]+intop1(ht.ntflux)/1[W/m]');
model.component('comp1').physics('ge').feature('ge2').set('name', 't_total');
model.component('comp1').physics('ge').feature('ge2').set('equation', 't_totalt-1');
model.component('comp1').physics('ev').feature('impl1').set('condition', 'tem>0');
model.component('comp1').physics('ev').feature('impl1').label('tempeature');
model.component('comp1').physics('ev').feature('impl2').set('condition', 'flow>0');
model.component('comp1').physics('ev').feature('impl2').label('heat flow');
model.component('comp1').physics('ev').feature('is1').set('indDim', {'tem'; 'flow'});
model.component('comp1').physics('ev').feature('is1').set('g', {'comp1.aveop1(comp1.T)-T_max'; 'q_total-qtotal'});
model.component('comp1').physics('ev').feature('is1').set('dimInit', [0; 0]);
model.component('comp1').physics('ev').feature('is1').set('dimDescr', {''; ''});
model.component('comp1').physics('c').feature('cfeq1').set('c', [0 0 0 0]);
model.component('comp1').physics('c').feature('cfeq1').set('f', 0);
model.component('comp1').physics('c').feature('init1').set('u', 'step1(withsol(''sol3'',dtopo1.theta))');
model.component('comp1').physics('opt').feature('iconstr1').set('constraintExpression', 'dtopo1.theta');
model.component('comp1').physics('opt').feature('iconstr1').set('upperBound', '0.0040183*thres');
model.component('comp1').physics('opt').feature('iobj1').set('objectiveExpression', 'T');

model.component('comp1').mesh('mesh1').feature('size').set('custom', 'on');
model.component('comp1').mesh('mesh1').feature('size').set('hmax', '0.0005');
model.component('comp1').mesh('mesh1').feature('size').set('hgrad', 1.1);
model.component('comp1').mesh('mesh1').run;

model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('k_phase1_mat', 'userdef');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('k_phase2_mat', 'userdef');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('rho_phase1_mat', 'userdef');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('rho_phase2_mat', 'userdef');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('Cp_phase1_mat', 'userdef');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('Cp_phase2_mat', 'userdef');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('gamma_phase1_mat', 'userdef');
model.component('comp1').physics('ht').feature('fluid1').feature('phc1').set('gamma_phase2_mat', 'userdef');

model.study.create('std3');
model.study('std3').create('opt', 'Optimization');
model.study('std3').create('stat', 'Stationary');
model.study('std3').feature('stat').set('useadvanceddisable', true);
model.study('std3').feature('stat').set('disabledphysics', {'c' 'ev' 'ge' 'ht/hf1' 'ht/temp1'});
model.study('std3').feature('stat').set('disabledvariables', {'var2'});
model.study('std3').feature('stat').set('activate', {'ht' 'on' 'ge' 'off' 'ev' 'off' 'c' 'off' 'opt' 'on'  ...
'frame:spatial1' 'on'});
model.study.create('std1');
model.study('std1').create('time', 'Transient');
model.study('std1').feature('time').set('useadvanceddisable', true);
model.study('std1').feature('time').set('disabledphysics', {'ht/temp1' 'ht/hs1' 'ht/temp2'});
model.study('std1').feature('time').set('disabledvariables', {'var1'});
model.study('std1').feature('time').set('activate', {'ht' 'on' 'ge' 'on' 'ev' 'on' 'c' 'off' 'opt' 'off'  ...
'frame:spatial1' 'on'});
model.study.create('std2');
model.study('std2').create('time1', 'Transient');
model.study('std2').feature('time1').set('useadvanceddisable', true);
model.study('std2').feature('time1').set('disabledphysics', {'ht/hf1' 'ev/impl1' 'ht/hs1' 'ht/temp2'});
model.study('std2').feature('time1').set('disabledvariables', {'var1'});
model.study('std2').feature('time1').set('activate', {'ht' 'on' 'ge' 'on' 'ev' 'on' 'c' 'off' 'opt' 'on'  ...
'frame:spatial1' 'on'});

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').create('st1', 'StopCondition');
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol.create('sol2');
model.sol('sol2').study('std2');
model.sol('sol2').attach('std2');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').create('d1', 'Direct');
model.sol('sol2').feature('t1').create('i1', 'Iterative');
model.sol('sol2').feature('t1').create('i2', 'Iterative');
model.sol('sol2').feature('t1').create('st1', 'StopCondition');
model.sol('sol2').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol2').feature('t1').feature('i1').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol2').feature('t1').feature('i1').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol2').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol2').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol2').feature('t1').feature('i2').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol2').feature('t1').feature('i2').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol2').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol.create('sol3');
model.sol('sol3').study('std3');
model.sol('sol3').attach('std3');
model.sol('sol3').create('st1', 'StudyStep');
model.sol('sol3').create('v1', 'Variables');
model.sol('sol3').create('o1', 'Optimization');
model.sol('sol3').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol3').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol3').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol3').feature('o1').feature('s1').create('i1', 'Iterative');
model.sol('sol3').feature('o1').feature('s1').create('i2', 'Iterative');
model.sol('sol3').feature('o1').feature('s1').create('p1', 'Parametric');
model.sol('sol3').feature('o1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol3').feature('o1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol3').feature('o1').feature('s1').feature('i2').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol3').feature('o1').feature('s1').feature('i2').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol3').feature('o1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol3').feature('o1').feature('s1').feature.remove('fcDef');

model.result.numerical.create('gev2', 'EvalGlobal');
model.result.numerical.create('gev3', 'EvalGlobal');
model.result.numerical.create('gev1', 'EvalGlobal');
model.result.numerical.create('av1', 'AvSurface');
model.result.numerical.create('gev4', 'EvalGlobal');
model.result.numerical('gev2').set('data', 'dset2');
model.result.numerical('gev2').set('probetag', 'none');
model.result.numerical('gev3').set('data', 'dset3');
model.result.numerical('gev3').set('probetag', 'none');
model.result.numerical('gev1').set('probetag', 'none');
model.result.numerical('av1').selection.set([2]);
model.result.numerical('av1').set('probetag', 'none');
model.result.numerical('gev4').set('probetag', 'none');
model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup2D');
model.result.create('pg3', 'PlotGroup1D');
model.result.create('pg4', 'PlotGroup2D');
model.result.create('pg5', 'PlotGroup2D');
model.result.create('pg6', 'PlotGroup1D');
model.result.create('pg7', 'PlotGroup2D');
model.result.create('pg8', 'PlotGroup2D');
model.result.create('pg9', 'PlotGroup2D');
model.result('pg1').set('data', 'dset2');
model.result('pg1').create('surf1', 'Surface');
model.result('pg2').create('con1', 'Contour');
model.result('pg3').create('glob1', 'Global');
model.result('pg4').create('surf1', 'Surface');
model.result('pg5').set('data', 'dset2');
model.result('pg5').create('con1', 'Contour');
model.result('pg6').set('data', 'dset2');
model.result('pg6').create('glob1', 'Global');
model.result('pg7').set('data', 'dset2');
model.result('pg7').create('surf1', 'Surface');
model.result('pg8').set('data', 'dset3');
model.result('pg8').create('con1', 'Contour');
model.result('pg9').set('data', 'dset2');
model.result('pg9').create('surf1', 'Surface');

model.study('std3').label('Study 0');
model.study('std3').feature('opt').set('optsolver', 'mma');
model.study('std3').feature('opt').set('gradientStep', 'stat');
model.study('std3').feature('opt').set('objtable', 'tbl6');
model.study('std1').feature('time').label('constant flux');
model.study('std1').feature('time').set('tlist', '1e7');
model.study('std1').feature('time').set('usertol', true);
model.study('std1').feature('time').set('rtol', '1e-4');
model.study('std1').feature('time').set('useinitsol', true);
model.study('std1').feature('time').set('usesol', true);
model.study('std2').feature('time1').label('constant temperature');
model.study('std2').feature('time1').set('tlist', '1e6');
model.study('std2').feature('time1').set('usertol', true);
model.study('std2').feature('time1').set('rtol', '1e-5');
model.study('std2').feature('time1').set('useinitsol', true);
model.study('std2').feature('time1').set('initmethod', 'sol');
model.study('std2').feature('time1').set('initstudy', 'std1');
model.study('std2').feature('time1').set('solnum', 'last');
model.study('std2').feature('time1').set('usesol', true);
model.study('std2').feature('time1').set('notsolmethod', 'sol');
model.study('std2').feature('time1').set('notstudy', 'std1');
model.study('std2').feature('time1').set('notsolnum', 'last');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('v1').set('clist', {'10000000' '10000.0[s]'});
model.sol('sol1').feature('t1').set('tlist', '1e7');
model.sol('sol1').feature('t1').set('rtol', '1e-4');
model.sol('sol1').feature('t1').set('fieldselection', 'comp1_T');
model.sol('sol1').feature('t1').set('atolmethod', {'comp1_T' 'global' 'comp1_u' 'global' 'comp1_ODE1' 'global' 'comp1_ODE2' 'global' 'comp1_ev_is1_indDim' 'global'  ...
'comp1_dtopo1_theta_f' 'global'});
model.sol('sol1').feature('t1').set('atolvaluemethod', {'comp1_T' 'factor' 'comp1_u' 'factor' 'comp1_ODE1' 'factor' 'comp1_ODE2' 'factor' 'comp1_ev_is1_indDim' 'factor'  ...
'comp1_dtopo1_theta_f' 'factor'});
model.sol('sol1').feature('t1').set('atolfactor', {'comp1_T' '0.1' 'comp1_u' '0.1' 'comp1_ODE1' '0.1' 'comp1_ODE2' '0.1' 'comp1_ev_is1_indDim' '0.1'  ...
'comp1_dtopo1_theta_f' '0.1'});
model.sol('sol1').feature('t1').set('atol', {'comp1_T' '1e-3' 'comp1_u' '1e-3' 'comp1_ODE1' '1e-3' 'comp1_ODE2' '1e-3' 'comp1_ev_is1_indDim' '1e-3'  ...
'comp1_dtopo1_theta_f' '1e-3'});
model.sol('sol1').feature('t1').set('atoludot', {'comp1_T' '1e-3' 'comp1_u' '1e-3' 'comp1_ODE1' '1e-3' 'comp1_ODE2' '1e-3' 'comp1_ev_is1_indDim' '1e-3'  ...
'comp1_dtopo1_theta_f' '1e-3'});
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('eventtol', '1e-4');
model.sol('sol1').feature('t1').set('estrat', 'exclude');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol1').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('stabacc', 'aacc');
model.sol('sol1').feature('t1').feature('fc1').set('aaccdim', 5);
model.sol('sol1').feature('t1').feature('i1').label('Algebraic Multigrid (ht)');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('usesmooth', false);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('i2').label('Geometric Multigrid (ht)');
model.sol('sol1').feature('t1').feature('i2').set('rhob', 20);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('st1').set('eventstopActive', {'on'});
model.sol('sol1').feature('t1').feature('st1').set('storestopcondsol', 'stepbefore_stepafter');
model.sol('sol1').runAll;
model.sol('sol2').attach('std2');
model.sol('sol2').feature('v1').set('initmethod', 'sol');
model.sol('sol2').feature('v1').set('initsol', 'sol1');
model.sol('sol2').feature('v1').set('solnum', 'last');
model.sol('sol2').feature('v1').set('notsolmethod', 'sol');
model.sol('sol2').feature('v1').set('notsol', 'sol1');
model.sol('sol2').feature('v1').set('notsolnum', 'last');
model.sol('sol2').feature('v1').set('clist', {'1000000' '1000.0[s]'});
model.sol('sol2').feature('t1').set('tlist', '1e6');
model.sol('sol2').feature('t1').set('rtol', '1e-5');
model.sol('sol2').feature('t1').set('fieldselection', 'comp1_T');
model.sol('sol2').feature('t1').set('atolmethod', {'comp1_T' 'global' 'comp1_u' 'global' 'comp1_ODE1' 'global' 'comp1_ODE2' 'global' 'comp1_ev_is1_indDim' 'global'  ...
'comp1_dtopo1_theta_f' 'global'});
model.sol('sol2').feature('t1').set('atolvaluemethod', {'comp1_T' 'factor' 'comp1_u' 'factor' 'comp1_ODE1' 'factor' 'comp1_ODE2' 'factor' 'comp1_ev_is1_indDim' 'factor'  ...
'comp1_dtopo1_theta_f' 'factor'});
model.sol('sol2').feature('t1').set('atolfactor', {'comp1_T' '0.1' 'comp1_u' '0.1' 'comp1_ODE1' '0.1' 'comp1_ODE2' '0.1' 'comp1_ev_is1_indDim' '0.1'  ...
'comp1_dtopo1_theta_f' '0.1'});
model.sol('sol2').feature('t1').set('atol', {'comp1_T' '1e-3' 'comp1_u' '1e-3' 'comp1_ODE1' '1e-3' 'comp1_ODE2' '1e-3' 'comp1_ev_is1_indDim' '1e-3'  ...
'comp1_dtopo1_theta_f' '1e-3'});
model.sol('sol2').feature('t1').set('atoludot', {'comp1_T' '1e-3' 'comp1_u' '1e-3' 'comp1_ODE1' '1e-3' 'comp1_ODE2' '1e-3' 'comp1_ev_is1_indDim' '1e-3'  ...
'comp1_dtopo1_theta_f' '1e-3'});
model.sol('sol2').feature('t1').set('maxorder', 2);
model.sol('sol2').feature('t1').set('eventtol', '1e-4');
model.sol('sol2').feature('t1').set('estrat', 'exclude');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol2').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol2').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol2').feature('t1').feature('fc1').set('stabacc', 'aacc');
model.sol('sol2').feature('t1').feature('fc1').set('aaccdim', 5);
model.sol('sol2').feature('t1').feature('i1').label('Algebraic Multigrid (ht)');
model.sol('sol2').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol2').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol2').feature('t1').feature('i1').feature('mg1').set('usesmooth', false);
model.sol('sol2').feature('t1').feature('i1').feature('mg1').feature('pr').feature('so1').set('relax', 0.9);
model.sol('sol2').feature('t1').feature('i1').feature('mg1').feature('po').feature('so1').set('relax', 0.9);
model.sol('sol2').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('t1').feature('i2').label('Geometric Multigrid (ht)');
model.sol('sol2').feature('t1').feature('i2').set('rhob', 20);
model.sol('sol2').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('t1').feature('st1').set('eventstopActive', {'on'});
model.sol('sol2').feature('t1').feature('st1').set('storestopcondsol', 'stepbefore_stepafter');
model.sol('sol2').runAll;
model.sol('sol3').attach('std3');
model.sol('sol3').feature('o1').set('control', 'opt');
model.sol('sol3').feature('o1').set('optsolver', 'mma');
model.sol('sol3').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol3').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol3').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol3').feature('o1').feature('s1').feature('fc1').set('maxiter', 50);
model.sol('sol3').feature('o1').feature('s1').feature('fc1').set('termonres', false);
model.sol('sol3').feature('o1').feature('s1').feature('i1').label('Algebraic Multigrid (ht)');
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').set('usesmooth', false);
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('so1').set('relax', 0.9);
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').feature('po').feature('so1').set('relax', 0.9);
model.sol('sol3').feature('o1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol3').feature('o1').feature('s1').feature('i2').label('Geometric Multigrid (ht)');
model.sol('sol3').feature('o1').feature('s1').feature('i2').set('rhob', 20);
model.sol('sol3').feature('o1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol3').feature('o1').feature('s1').feature('p1').active(false);
model.sol('sol3').runAll;

model.result.numerical('gev2').set('table', 'tbl3');
model.result.numerical('gev2').set('expr', {'q_total' 't_total'});
model.result.numerical('gev2').set('unit', {'N' 's'});
model.result.numerical('gev2').set('descr', {'State variable q_total' 'State variable t_total'});
model.result.numerical('gev3').set('expr', {'opt.iconstr1' 'opt.iobj1'});
model.result.numerical('gev3').set('unit', {'m^2' ''});
model.result.numerical('gev3').set('descr', {'Constraint value' 'Objective value'});
model.result.numerical('gev1').set('table', 'tbl2');
model.result.numerical('gev1').set('expr', {'q_total' 't_total'});
model.result.numerical('gev1').set('unit', {'N' 's'});
model.result.numerical('gev1').set('descr', {'State variable q_total' 'State variable t_total'});
model.result.numerical('av1').set('table', 'tbl7');
model.result.numerical('av1').set('expr', {'step1(u)'});
model.result.numerical('av1').set('unit', {''});
model.result.numerical('av1').set('descr', {'Step 1'});
model.result.numerical('gev4').set('table', 'tbl8');
model.result.numerical('gev4').set('expr', {'intop1(ht.ntflux)'});
model.result.numerical('gev4').set('unit', {'W/m'});
model.result.numerical('gev4').set('descr', {'Integration 1'});
model.result.numerical('gev2').setResult;
model.result.numerical('gev1').setResult;
model.result.numerical('av1').setResult;
model.result.numerical('gev4').setResult;
model.result('pg1').label('Temperature (ht)');
model.result('pg1').feature('surf1').label('Surface');
model.result('pg1').feature('surf1').set('colortable', 'ThermalLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg2').label('Isothermal Contours (ht)');
model.result('pg2').set('looplevel', [1]);
model.result('pg2').feature('con1').label('Contour');
model.result('pg2').feature('con1').set('colortable', 'ThermalLight');
model.result('pg2').feature('con1').set('smooth', 'internal');
model.result('pg2').feature('con1').set('resolution', 'normal');
model.result('pg3').set('xlabel', 'Time (s)');
model.result('pg3').set('xlabelactive', false);
model.result('pg3').feature('glob1').set('expr', {'q_total' 't_total'});
model.result('pg3').feature('glob1').set('unit', {'N' 's'});
model.result('pg3').feature('glob1').set('descr', {'State variable q_total' 'State variable t_total'});
model.result('pg4').label('Temperature (ht) 1');
model.result('pg4').set('looplevel', [1]);
model.result('pg4').feature('surf1').label('Surface');
model.result('pg4').feature('surf1').set('colortable', 'ThermalLight');
model.result('pg4').feature('surf1').set('resolution', 'normal');
model.result('pg5').label('Isothermal Contours (ht) 1');
model.result('pg5').set('looplevel', [1]);
model.result('pg5').feature('con1').label('Contour');
model.result('pg5').feature('con1').set('colortable', 'ThermalLight');
model.result('pg5').feature('con1').set('smooth', 'internal');
model.result('pg5').feature('con1').set('resolution', 'normal');
model.result('pg6').set('xlabel', 'Time (s)');
model.result('pg6').set('xlabelactive', false);
model.result('pg6').feature('glob1').set('expr', {'q_total' 't_total'});
model.result('pg6').feature('glob1').set('unit', {'N' 's'});
model.result('pg6').feature('glob1').set('descr', {'State variable q_total' 'State variable t_total'});
model.result('pg7').label('Temperature (ht) 2');
model.result('pg7').set('looplevel', [1]);
model.result('pg7').feature('surf1').label('Surface');
model.result('pg7').feature('surf1').set('colortable', 'ThermalLight');
model.result('pg7').feature('surf1').set('resolution', 'normal');
model.result('pg8').label('Isothermal Contours (ht) 2');
model.result('pg8').feature('con1').label('Contour');
model.result('pg8').feature('con1').set('colortable', 'ThermalLight');
model.result('pg8').feature('con1').set('smooth', 'internal');
model.result('pg8').feature('con1').set('resolution', 'normal');
model.result('pg9').label('solid distribution');
model.result('pg9').feature('surf1').set('expr', 'u>0.2');
model.result('pg9').feature('surf1').set('unit', '');
model.result('pg9').feature('surf1').set('descr', 'u>0.2');
model.result('pg9').feature('surf1').set('colortable', 'GrayScale');
model.result('pg9').feature('surf1').set('colortablerev', true);
model.result('pg9').feature('surf1').set('resolution', 'extrafine');

out = model;
