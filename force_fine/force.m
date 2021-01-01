function out = model
%
% force.m
%
% Model exported on Dec 5 2020, 12:03 by COMSOL 5.4.0.225.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\dcy60\Google Drive\Research\MLOPT\code_data\fine');

model.label('force.mph');

model.comments(['Topology Optimization of an MBB Beam\n\nThis example demonstrates topology optimization with the Optimization Module in the context of the Messerschmitt-B' native2unicode(hex2dec({'00' 'f6'}), 'unicode') 'lkow-Blohm beam benchmark problem.']);

model.param.set('a', '1 [m]', 'beam half width');
model.param.set('b', '1 [m]', 'beam height');
model.param.set('L1', '0.2 [m]', 'support width');
model.param.set('Ws0', '30 [J]', 'characteristic energy');
model.param.set('volfrac', '0.5', 'maximum volume fraction');
model.param.set('minE', '1e-12', 'percentage of E with void material');
model.param.set('delta', '0.1');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.table.create('tbl1', 'Table');
model.result.table.create('tbl2', 'Table');
model.result.table.create('tbl3', 'Table');
model.result.table.create('tbl4', 'Table');

model.component('comp1').func.create('int1', 'Interpolation');
model.component('comp1').func('int1').set('source', 'file');
model.component('comp1').func('int1').set('struct', 'grid');
model.component('comp1').func('int1').set('defvars', true);
model.component('comp1').func('int1').set('frame', 'geometry');
model.component('comp1').func('int1').set('argunit', 'm');
model.component('comp1').func('int1').set('fununit', '1');

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('size', {'a' 'b'});
model.component('comp1').geom('geom1').create('pt1', 'Point');
model.component('comp1').geom('geom1').feature('pt1').set('p', {'L1' '0'});
model.component('comp1').geom('geom1').create('pt2', 'Point');
model.component('comp1').geom('geom1').feature('pt2').set('p', {'a-L1' 'b'});
model.component('comp1').geom('geom1').run;

model.component('comp1').variable.create('var1');
model.component('comp1').variable('var1').set('E_SIMP', 'mat1.Enu.E*(p+(1-p)*minE)', 'Penalized Young''s modulus');
model.component('comp1').variable('var1').set('p', 'pp^3', 'material ratio');
model.component('comp1').variable('var1').set('pp', 'int1(x,y)');

model.view.create('view2', 2);
model.view.create('view3', 2);
model.view.create('view4', 3);
model.view.create('view5', 3);

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat1').propertyGroup.create('Murnaghan', 'Murnaghan');
model.component('comp1').material('mat1').propertyGroup.create('Lame', ['Lam' native2unicode(hex2dec({'00' 'e9'}), 'unicode') ' parameters']);

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('roll1', 'Roller', 1);
model.component('comp1').physics('solid').feature('roll1').selection.set([2 6]);
model.component('comp1').physics('solid').create('bndl1', 'BoundaryLoad', 1);
model.component('comp1').physics('solid').feature('bndl1').selection.set([5]);

model.component('comp1').mesh('mesh1').create('map1', 'Map');

model.result.table('tbl1').comments('Global Evaluation 2 (solid.Ws_tot)');
model.result.table('tbl2').label('input');
model.result.table('tbl3').comments('Surface Integration 1 (solid.Ws)');
model.result.table('tbl4').label('Objective Probe Table 4');

model.component('comp1').view('view1').axis.set('xmin', -1.4247846603393555);
model.component('comp1').view('view1').axis.set('xmax', 2.984947919845581);
model.component('comp1').view('view1').axis.set('ymin', -0.5035969018936157);
model.component('comp1').view('view1').axis.set('ymax', 1.4075349569320679);
model.view('view2').axis.set('xmin', -0.360154926776886);
model.view('view2').axis.set('xmax', 5.8532328605651855);
model.view('view2').axis.set('ymin', -1.4008510112762451);
model.view('view2').axis.set('ymax', 3.7526509761810303);
model.view('view3').axis.set('xmin', -0.29698655009269714);
model.view('view3').axis.set('xmax', 7.026908874511719);
model.view('view3').axis.set('ymin', -2.227956533432007);
model.view('view3').axis.set('ymax', 3.8194632530212402);

model.component('comp1').material('mat1').label('Structural steel');
model.component('comp1').material('mat1').set('family', 'custom');
model.component('comp1').material('mat1').set('specular', 'custom');
model.component('comp1').material('mat1').set('customspecular', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat1').set('diffuse', 'custom');
model.component('comp1').material('mat1').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.6666666666666666]);
model.component('comp1').material('mat1').set('ambient', 'custom');
model.component('comp1').material('mat1').set('customambient', [0.6666666666666666 0.6666666666666666 0.6666666666666666]);
model.component('comp1').material('mat1').set('noise', true);
model.component('comp1').material('mat1').set('noisefreq', 1);
model.component('comp1').material('mat1').set('lighting', 'cooktorrance');
model.component('comp1').material('mat1').set('fresnel', 0.9);
model.component('comp1').material('mat1').set('roughness', 0.3);
model.component('comp1').material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '475[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]' '0' '0' '0' '44.5[W/(m*K)]'});
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]' '0' '0' '0' '4.032e6[S/m]'});
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]' '0' '0' '0' '12.3e-6[1/K]'});
model.component('comp1').material('mat1').propertyGroup('def').set('density', '7850[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('Enu').set('youngsmodulus', '200e9[Pa]');
model.component('comp1').material('mat1').propertyGroup('Enu').set('poissonsratio', '0.30');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('l', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('m', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('n', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('l', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('m', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('n', '');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('l', '-3.0e11[Pa]');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('m', '-6.2e11[Pa]');
model.component('comp1').material('mat1').propertyGroup('Murnaghan').set('n', '-7.2e11[Pa]');
model.component('comp1').material('mat1').propertyGroup('Lame').set('lambLame', '');
model.component('comp1').material('mat1').propertyGroup('Lame').set('muLame', '');
model.component('comp1').material('mat1').propertyGroup('Lame').set('lambLame', '');
model.component('comp1').material('mat1').propertyGroup('Lame').set('muLame', '');
model.component('comp1').material('mat1').propertyGroup('Lame').set('lambLame', '1.15e11[Pa]');
model.component('comp1').material('mat1').propertyGroup('Lame').set('muLame', '7.69e10[Pa]');

model.component('comp1').physics('solid').feature('lemm1').set('E', 'E_SIMP');
model.component('comp1').physics('solid').feature('bndl1').set('LoadType', 'TotalForce');
model.component('comp1').physics('solid').feature('bndl1').set('Ftot', {'0'; '-100 [kN]'; '0'});

model.component('comp1').mesh('mesh1').feature('size').set('hauto', 1);
model.component('comp1').mesh('mesh1').feature('size').set('custom', 'on');
model.component('comp1').mesh('mesh1').feature('size').set('hmax', 'delta');
model.component('comp1').mesh('mesh1').feature('size').set('hmin', 6.0E-5);
model.component('comp1').mesh('mesh1').run;

model.component('comp1').physics('solid').feature('lemm1').set('E_mat', 'userdef');

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.numerical.create('int1', 'IntSurface');
model.result.numerical.create('gev2', 'EvalGlobal');
model.result.numerical('int1').selection.set([1]);
model.result.numerical('int1').set('probetag', 'none');
model.result.numerical('gev2').set('probetag', 'none');
model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup2D');
model.result.create('pg3', 'PlotGroup2D');
model.result('pg1').create('surf1', 'Surface');
model.result('pg2').create('surf1', 'Surface');
model.result('pg3').create('surf1', 'Surface');
model.result('pg3').feature('surf1').create('def1', 'Deform');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').runAll;

model.result.numerical('int1').set('table', 'tbl3');
model.result.numerical('int1').set('expr', {'solid.Ws'});
model.result.numerical('int1').set('unit', {'J/m'});
model.result.numerical('int1').set('descr', {'Elastic strain energy density'});
model.result.numerical('int1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.numerical('gev2').set('table', 'tbl1');
model.result.numerical('gev2').set('expr', {'solid.Ws_tot'});
model.result.numerical('gev2').set('unit', {'J'});
model.result.numerical('gev2').set('descr', {'Total elastic strain energy'});
model.result.numerical('gev2').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.numerical('int1').setResult;
model.result.numerical('gev2').setResult;
model.result('pg1').label('material');
model.result('pg1').feature('surf1').set('expr', 'pp');
model.result('pg1').feature('surf1').set('unit', '1');
model.result('pg1').feature('surf1').set('descr', 'pp');
model.result('pg1').feature('surf1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg2').label('energy');
model.result('pg2').feature('surf1').set('expr', 'solid.Ws');
model.result('pg2').feature('surf1').set('unit', 'J/m^3');
model.result('pg2').feature('surf1').set('descr', 'Elastic strain energy density');
model.result('pg2').feature('surf1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result('pg3').label('displacement');
model.result('pg3').feature('surf1').set('descr', 'Total displacement Total displacement');
model.result('pg3').feature('surf1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg3').feature('surf1').set('resolution', 'normal');
model.result('pg3').feature('surf1').feature('def1').set('scale', 114.5839622304955);
model.result('pg3').feature('surf1').feature('def1').set('scaleactive', false);

out = model;
