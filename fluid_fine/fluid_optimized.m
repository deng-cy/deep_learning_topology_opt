function out = model
%
% fluid_optimized.m
%
% Model exported on Jan 5 2021, 13:40 by COMSOL 5.4.0.225.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\dcy60\Google Drive\Research\MLOPT\code_data\fluid_fine');

model.label('pressure.mph');

model.param.set('width', '2');
model.param.set('height', '0.8');
model.param.set('excess', '0.4');
model.param.set('dx', '0.1');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.result.table.create('tbl1', 'Table');

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('pos', {'-excess' '0'});
model.component('comp1').geom('geom1').feature('r1').set('size', {'width+excess*2' 'height'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'-excess' '0'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'excess' 'excess'});
model.component('comp1').geom('geom1').create('sq1', 'Square');
model.component('comp1').geom('geom1').feature('sq1').set('pos', {'0' '7*dx'});
model.component('comp1').geom('geom1').feature('sq1').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq2', 'Square');
model.component('comp1').geom('geom1').feature('sq2').set('pos', {'dx' '7*dx'});
model.component('comp1').geom('geom1').feature('sq2').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq3', 'Square');
model.component('comp1').geom('geom1').feature('sq3').set('pos', {'dx*2' '7*dx'});
model.component('comp1').geom('geom1').feature('sq3').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq4', 'Square');
model.component('comp1').geom('geom1').feature('sq4').set('pos', {'dx*3' '7*dx'});
model.component('comp1').geom('geom1').feature('sq4').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq5', 'Square');
model.component('comp1').geom('geom1').feature('sq5').set('pos', {'dx*4' '7*dx'});
model.component('comp1').geom('geom1').feature('sq5').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq6', 'Square');
model.component('comp1').geom('geom1').feature('sq6').set('pos', {'dx*5' '7*dx'});
model.component('comp1').geom('geom1').feature('sq6').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq7', 'Square');
model.component('comp1').geom('geom1').feature('sq7').set('pos', {'dx*6' '7*dx'});
model.component('comp1').geom('geom1').feature('sq7').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq8', 'Square');
model.component('comp1').geom('geom1').feature('sq8').set('pos', {'dx*7' '7*dx'});
model.component('comp1').geom('geom1').feature('sq8').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq9', 'Square');
model.component('comp1').geom('geom1').feature('sq9').set('pos', {'dx*8' '7*dx'});
model.component('comp1').geom('geom1').feature('sq9').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq10', 'Square');
model.component('comp1').geom('geom1').feature('sq10').set('pos', {'dx*9' '7*dx'});
model.component('comp1').geom('geom1').feature('sq10').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq11', 'Square');
model.component('comp1').geom('geom1').feature('sq11').set('pos', {'dx*10' '7*dx'});
model.component('comp1').geom('geom1').feature('sq11').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq12', 'Square');
model.component('comp1').geom('geom1').feature('sq12').set('pos', {'dx*11' '7*dx'});
model.component('comp1').geom('geom1').feature('sq12').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq13', 'Square');
model.component('comp1').geom('geom1').feature('sq13').set('pos', {'dx*12' '7*dx'});
model.component('comp1').geom('geom1').feature('sq13').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq14', 'Square');
model.component('comp1').geom('geom1').feature('sq14').set('pos', {'dx*13' '7*dx'});
model.component('comp1').geom('geom1').feature('sq14').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq15', 'Square');
model.component('comp1').geom('geom1').feature('sq15').set('pos', {'dx*14' '7*dx'});
model.component('comp1').geom('geom1').feature('sq15').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq16', 'Square');
model.component('comp1').geom('geom1').feature('sq16').set('pos', {'dx*15' '7*dx'});
model.component('comp1').geom('geom1').feature('sq16').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq17', 'Square');
model.component('comp1').geom('geom1').feature('sq17').set('pos', {'dx*16' '7*dx'});
model.component('comp1').geom('geom1').feature('sq17').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq18', 'Square');
model.component('comp1').geom('geom1').feature('sq18').set('pos', {'dx*17' '7*dx'});
model.component('comp1').geom('geom1').feature('sq18').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq19', 'Square');
model.component('comp1').geom('geom1').feature('sq19').set('pos', {'dx*18' '7*dx'});
model.component('comp1').geom('geom1').feature('sq19').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq20', 'Square');
model.component('comp1').geom('geom1').feature('sq20').set('pos', {'dx*19' '7*dx'});
model.component('comp1').geom('geom1').feature('sq20').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq21', 'Square');
model.component('comp1').geom('geom1').feature('sq21').set('pos', {'0' '6*dx'});
model.component('comp1').geom('geom1').feature('sq21').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq22', 'Square');
model.component('comp1').geom('geom1').feature('sq22').set('pos', {'dx' '6*dx'});
model.component('comp1').geom('geom1').feature('sq22').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq23', 'Square');
model.component('comp1').geom('geom1').feature('sq23').set('pos', {'dx*2' '6*dx'});
model.component('comp1').geom('geom1').feature('sq23').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq24', 'Square');
model.component('comp1').geom('geom1').feature('sq24').set('pos', {'dx*3' '6*dx'});
model.component('comp1').geom('geom1').feature('sq24').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq25', 'Square');
model.component('comp1').geom('geom1').feature('sq25').set('pos', {'dx*4' '6*dx'});
model.component('comp1').geom('geom1').feature('sq25').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq26', 'Square');
model.component('comp1').geom('geom1').feature('sq26').set('pos', {'dx*5' '6*dx'});
model.component('comp1').geom('geom1').feature('sq26').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq27', 'Square');
model.component('comp1').geom('geom1').feature('sq27').set('pos', {'dx*6' '6*dx'});
model.component('comp1').geom('geom1').feature('sq27').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq28', 'Square');
model.component('comp1').geom('geom1').feature('sq28').set('pos', {'dx*7' '6*dx'});
model.component('comp1').geom('geom1').feature('sq28').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq29', 'Square');
model.component('comp1').geom('geom1').feature('sq29').set('pos', {'dx*8' '6*dx'});
model.component('comp1').geom('geom1').feature('sq29').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq30', 'Square');
model.component('comp1').geom('geom1').feature('sq30').set('pos', {'dx*9' '6*dx'});
model.component('comp1').geom('geom1').feature('sq30').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq31', 'Square');
model.component('comp1').geom('geom1').feature('sq31').set('pos', {'dx*10' '6*dx'});
model.component('comp1').geom('geom1').feature('sq31').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq32', 'Square');
model.component('comp1').geom('geom1').feature('sq32').set('pos', {'dx*11' '6*dx'});
model.component('comp1').geom('geom1').feature('sq32').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq33', 'Square');
model.component('comp1').geom('geom1').feature('sq33').set('pos', {'dx*12' '6*dx'});
model.component('comp1').geom('geom1').feature('sq33').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq34', 'Square');
model.component('comp1').geom('geom1').feature('sq34').set('pos', {'dx*13' '6*dx'});
model.component('comp1').geom('geom1').feature('sq34').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq35', 'Square');
model.component('comp1').geom('geom1').feature('sq35').set('pos', {'dx*14' '6*dx'});
model.component('comp1').geom('geom1').feature('sq35').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq36', 'Square');
model.component('comp1').geom('geom1').feature('sq36').set('pos', {'dx*15' '6*dx'});
model.component('comp1').geom('geom1').feature('sq36').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq37', 'Square');
model.component('comp1').geom('geom1').feature('sq37').set('pos', {'dx*16' '6*dx'});
model.component('comp1').geom('geom1').feature('sq37').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq38', 'Square');
model.component('comp1').geom('geom1').feature('sq38').set('pos', {'dx*17' '6*dx'});
model.component('comp1').geom('geom1').feature('sq38').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq39', 'Square');
model.component('comp1').geom('geom1').feature('sq39').set('pos', {'dx*18' '6*dx'});
model.component('comp1').geom('geom1').feature('sq39').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq40', 'Square');
model.component('comp1').geom('geom1').feature('sq40').set('pos', {'dx*19' '6*dx'});
model.component('comp1').geom('geom1').feature('sq40').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq41', 'Square');
model.component('comp1').geom('geom1').feature('sq41').set('pos', {'0' '5*dx'});
model.component('comp1').geom('geom1').feature('sq41').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq42', 'Square');
model.component('comp1').geom('geom1').feature('sq42').set('pos', {'dx' '5*dx'});
model.component('comp1').geom('geom1').feature('sq42').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq43', 'Square');
model.component('comp1').geom('geom1').feature('sq43').set('pos', {'dx*2' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq43').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq44', 'Square');
model.component('comp1').geom('geom1').feature('sq44').set('pos', {'dx*3' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq44').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq45', 'Square');
model.component('comp1').geom('geom1').feature('sq45').set('pos', {'dx*4' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq45').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq46', 'Square');
model.component('comp1').geom('geom1').feature('sq46').set('pos', {'dx*5' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq46').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq47', 'Square');
model.component('comp1').geom('geom1').feature('sq47').set('pos', {'dx*6' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq47').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq48', 'Square');
model.component('comp1').geom('geom1').feature('sq48').set('pos', {'dx*7' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq48').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq49', 'Square');
model.component('comp1').geom('geom1').feature('sq49').set('pos', {'dx*8' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq49').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq50', 'Square');
model.component('comp1').geom('geom1').feature('sq50').set('pos', {'dx*9' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq50').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq51', 'Square');
model.component('comp1').geom('geom1').feature('sq51').set('pos', {'dx*10' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq51').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq52', 'Square');
model.component('comp1').geom('geom1').feature('sq52').set('pos', {'dx*11' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq52').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq53', 'Square');
model.component('comp1').geom('geom1').feature('sq53').set('pos', {'dx*12' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq53').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq54', 'Square');
model.component('comp1').geom('geom1').feature('sq54').set('pos', {'dx*13' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq54').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq55', 'Square');
model.component('comp1').geom('geom1').feature('sq55').set('pos', {'dx*14' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq55').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq56', 'Square');
model.component('comp1').geom('geom1').feature('sq56').set('pos', {'dx*15' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq56').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq57', 'Square');
model.component('comp1').geom('geom1').feature('sq57').set('pos', {'dx*16' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq57').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq58', 'Square');
model.component('comp1').geom('geom1').feature('sq58').set('pos', {'dx*17' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq58').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq59', 'Square');
model.component('comp1').geom('geom1').feature('sq59').set('pos', {'dx*18' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq59').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq60', 'Square');
model.component('comp1').geom('geom1').feature('sq60').set('pos', {'dx*19' 'dx*5'});
model.component('comp1').geom('geom1').feature('sq60').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq61', 'Square');
model.component('comp1').geom('geom1').feature('sq61').set('pos', {'0' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq61').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq62', 'Square');
model.component('comp1').geom('geom1').feature('sq62').set('pos', {'dx' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq62').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq63', 'Square');
model.component('comp1').geom('geom1').feature('sq63').set('pos', {'dx*2' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq63').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq64', 'Square');
model.component('comp1').geom('geom1').feature('sq64').set('pos', {'dx*3' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq64').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq65', 'Square');
model.component('comp1').geom('geom1').feature('sq65').set('pos', {'dx*4' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq65').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq66', 'Square');
model.component('comp1').geom('geom1').feature('sq66').set('pos', {'dx*5' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq66').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq67', 'Square');
model.component('comp1').geom('geom1').feature('sq67').set('pos', {'dx*6' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq67').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq68', 'Square');
model.component('comp1').geom('geom1').feature('sq68').set('pos', {'dx*7' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq68').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq69', 'Square');
model.component('comp1').geom('geom1').feature('sq69').set('pos', {'dx*8' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq69').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq70', 'Square');
model.component('comp1').geom('geom1').feature('sq70').set('pos', {'dx*9' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq70').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq71', 'Square');
model.component('comp1').geom('geom1').feature('sq71').set('pos', {'dx*10' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq71').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq72', 'Square');
model.component('comp1').geom('geom1').feature('sq72').set('pos', {'dx*11' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq72').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq73', 'Square');
model.component('comp1').geom('geom1').feature('sq73').set('pos', {'dx*12' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq73').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq74', 'Square');
model.component('comp1').geom('geom1').feature('sq74').set('pos', {'dx*13' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq74').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq75', 'Square');
model.component('comp1').geom('geom1').feature('sq75').set('pos', {'dx*14' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq75').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq76', 'Square');
model.component('comp1').geom('geom1').feature('sq76').set('pos', {'dx*15' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq76').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq77', 'Square');
model.component('comp1').geom('geom1').feature('sq77').set('pos', {'dx*16' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq77').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq78', 'Square');
model.component('comp1').geom('geom1').feature('sq78').set('pos', {'dx*17' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq78').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq79', 'Square');
model.component('comp1').geom('geom1').feature('sq79').set('pos', {'dx*18' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq79').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq80', 'Square');
model.component('comp1').geom('geom1').feature('sq80').set('pos', {'dx*19' 'dx*4'});
model.component('comp1').geom('geom1').feature('sq80').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq81', 'Square');
model.component('comp1').geom('geom1').feature('sq81').set('pos', {'0' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq81').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq82', 'Square');
model.component('comp1').geom('geom1').feature('sq82').set('pos', {'dx' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq82').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq83', 'Square');
model.component('comp1').geom('geom1').feature('sq83').set('pos', {'dx*2' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq83').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq84', 'Square');
model.component('comp1').geom('geom1').feature('sq84').set('pos', {'dx*3' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq84').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq85', 'Square');
model.component('comp1').geom('geom1').feature('sq85').set('pos', {'dx*4' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq85').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq86', 'Square');
model.component('comp1').geom('geom1').feature('sq86').set('pos', {'dx*5' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq86').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq87', 'Square');
model.component('comp1').geom('geom1').feature('sq87').set('pos', {'dx*6' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq87').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq88', 'Square');
model.component('comp1').geom('geom1').feature('sq88').set('pos', {'dx*7' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq88').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq89', 'Square');
model.component('comp1').geom('geom1').feature('sq89').set('pos', {'dx*8' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq89').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq90', 'Square');
model.component('comp1').geom('geom1').feature('sq90').set('pos', {'dx*9' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq90').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq91', 'Square');
model.component('comp1').geom('geom1').feature('sq91').set('pos', {'dx*10' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq91').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq92', 'Square');
model.component('comp1').geom('geom1').feature('sq92').set('pos', {'dx*11' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq92').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq93', 'Square');
model.component('comp1').geom('geom1').feature('sq93').set('pos', {'dx*12' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq93').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq94', 'Square');
model.component('comp1').geom('geom1').feature('sq94').set('pos', {'dx*13' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq94').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq95', 'Square');
model.component('comp1').geom('geom1').feature('sq95').set('pos', {'dx*14' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq95').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq96', 'Square');
model.component('comp1').geom('geom1').feature('sq96').set('pos', {'dx*15' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq96').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq97', 'Square');
model.component('comp1').geom('geom1').feature('sq97').set('pos', {'dx*16' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq97').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq98', 'Square');
model.component('comp1').geom('geom1').feature('sq98').set('pos', {'dx*17' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq98').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq99', 'Square');
model.component('comp1').geom('geom1').feature('sq99').set('pos', {'dx*18' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq99').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq100', 'Square');
model.component('comp1').geom('geom1').feature('sq100').set('pos', {'dx*19' 'dx*3'});
model.component('comp1').geom('geom1').feature('sq100').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq101', 'Square');
model.component('comp1').geom('geom1').feature('sq101').set('pos', {'0' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq101').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq102', 'Square');
model.component('comp1').geom('geom1').feature('sq102').set('pos', {'dx' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq102').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq103', 'Square');
model.component('comp1').geom('geom1').feature('sq103').set('pos', {'dx*2' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq103').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq104', 'Square');
model.component('comp1').geom('geom1').feature('sq104').set('pos', {'dx*3' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq104').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq105', 'Square');
model.component('comp1').geom('geom1').feature('sq105').set('pos', {'dx*4' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq105').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq106', 'Square');
model.component('comp1').geom('geom1').feature('sq106').set('pos', {'dx*5' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq106').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq107', 'Square');
model.component('comp1').geom('geom1').feature('sq107').set('pos', {'dx*6' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq107').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq108', 'Square');
model.component('comp1').geom('geom1').feature('sq108').set('pos', {'dx*7' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq108').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq109', 'Square');
model.component('comp1').geom('geom1').feature('sq109').set('pos', {'dx*8' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq109').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq110', 'Square');
model.component('comp1').geom('geom1').feature('sq110').set('pos', {'dx*9' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq110').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq111', 'Square');
model.component('comp1').geom('geom1').feature('sq111').set('pos', {'dx*10' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq111').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq112', 'Square');
model.component('comp1').geom('geom1').feature('sq112').set('pos', {'dx*11' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq112').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq113', 'Square');
model.component('comp1').geom('geom1').feature('sq113').set('pos', {'dx*12' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq113').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq114', 'Square');
model.component('comp1').geom('geom1').feature('sq114').set('pos', {'dx*13' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq114').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq115', 'Square');
model.component('comp1').geom('geom1').feature('sq115').set('pos', {'dx*14' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq115').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq116', 'Square');
model.component('comp1').geom('geom1').feature('sq116').set('pos', {'dx*15' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq116').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq117', 'Square');
model.component('comp1').geom('geom1').feature('sq117').set('pos', {'dx*16' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq117').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq118', 'Square');
model.component('comp1').geom('geom1').feature('sq118').set('pos', {'dx*17' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq118').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq119', 'Square');
model.component('comp1').geom('geom1').feature('sq119').set('pos', {'dx*18' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq119').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq120', 'Square');
model.component('comp1').geom('geom1').feature('sq120').set('pos', {'dx*19' 'dx*2'});
model.component('comp1').geom('geom1').feature('sq120').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq121', 'Square');
model.component('comp1').geom('geom1').feature('sq121').set('pos', {'0' 'dx'});
model.component('comp1').geom('geom1').feature('sq121').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq122', 'Square');
model.component('comp1').geom('geom1').feature('sq122').set('pos', {'dx' 'dx'});
model.component('comp1').geom('geom1').feature('sq122').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq123', 'Square');
model.component('comp1').geom('geom1').feature('sq123').set('pos', {'dx*2' 'dx'});
model.component('comp1').geom('geom1').feature('sq123').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq124', 'Square');
model.component('comp1').geom('geom1').feature('sq124').set('pos', {'dx*3' 'dx'});
model.component('comp1').geom('geom1').feature('sq124').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq125', 'Square');
model.component('comp1').geom('geom1').feature('sq125').set('pos', {'dx*4' 'dx'});
model.component('comp1').geom('geom1').feature('sq125').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq126', 'Square');
model.component('comp1').geom('geom1').feature('sq126').set('pos', {'dx*5' 'dx'});
model.component('comp1').geom('geom1').feature('sq126').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq127', 'Square');
model.component('comp1').geom('geom1').feature('sq127').set('pos', {'dx*6' 'dx'});
model.component('comp1').geom('geom1').feature('sq127').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq128', 'Square');
model.component('comp1').geom('geom1').feature('sq128').set('pos', {'dx*7' 'dx'});
model.component('comp1').geom('geom1').feature('sq128').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq129', 'Square');
model.component('comp1').geom('geom1').feature('sq129').set('pos', {'dx*8' 'dx'});
model.component('comp1').geom('geom1').feature('sq129').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq130', 'Square');
model.component('comp1').geom('geom1').feature('sq130').set('pos', {'dx*9' 'dx'});
model.component('comp1').geom('geom1').feature('sq130').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq131', 'Square');
model.component('comp1').geom('geom1').feature('sq131').set('pos', {'dx*10' 'dx'});
model.component('comp1').geom('geom1').feature('sq131').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq132', 'Square');
model.component('comp1').geom('geom1').feature('sq132').set('pos', {'dx*11' 'dx'});
model.component('comp1').geom('geom1').feature('sq132').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq133', 'Square');
model.component('comp1').geom('geom1').feature('sq133').set('pos', {'dx*12' 'dx'});
model.component('comp1').geom('geom1').feature('sq133').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq134', 'Square');
model.component('comp1').geom('geom1').feature('sq134').set('pos', {'dx*13' 'dx'});
model.component('comp1').geom('geom1').feature('sq134').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq135', 'Square');
model.component('comp1').geom('geom1').feature('sq135').set('pos', {'dx*14' 'dx'});
model.component('comp1').geom('geom1').feature('sq135').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq136', 'Square');
model.component('comp1').geom('geom1').feature('sq136').set('pos', {'dx*15' 'dx'});
model.component('comp1').geom('geom1').feature('sq136').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq137', 'Square');
model.component('comp1').geom('geom1').feature('sq137').set('pos', {'dx*16' 'dx'});
model.component('comp1').geom('geom1').feature('sq137').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq138', 'Square');
model.component('comp1').geom('geom1').feature('sq138').set('pos', {'dx*17' 'dx'});
model.component('comp1').geom('geom1').feature('sq138').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq139', 'Square');
model.component('comp1').geom('geom1').feature('sq139').set('pos', {'dx*18' 'dx'});
model.component('comp1').geom('geom1').feature('sq139').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq140', 'Square');
model.component('comp1').geom('geom1').feature('sq140').set('pos', {'dx*19' 'dx'});
model.component('comp1').geom('geom1').feature('sq140').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq141', 'Square');
model.component('comp1').geom('geom1').feature('sq141').set('pos', [0 0]);
model.component('comp1').geom('geom1').feature('sq141').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq142', 'Square');
model.component('comp1').geom('geom1').feature('sq142').set('pos', {'dx' '0'});
model.component('comp1').geom('geom1').feature('sq142').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq143', 'Square');
model.component('comp1').geom('geom1').feature('sq143').set('pos', {'dx*2' '0'});
model.component('comp1').geom('geom1').feature('sq143').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq144', 'Square');
model.component('comp1').geom('geom1').feature('sq144').set('pos', {'dx*3' '0'});
model.component('comp1').geom('geom1').feature('sq144').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq145', 'Square');
model.component('comp1').geom('geom1').feature('sq145').set('pos', {'dx*4' '0'});
model.component('comp1').geom('geom1').feature('sq145').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq146', 'Square');
model.component('comp1').geom('geom1').feature('sq146').set('pos', {'dx*5' '0'});
model.component('comp1').geom('geom1').feature('sq146').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq147', 'Square');
model.component('comp1').geom('geom1').feature('sq147').set('pos', {'dx*6' '0'});
model.component('comp1').geom('geom1').feature('sq147').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq148', 'Square');
model.component('comp1').geom('geom1').feature('sq148').set('pos', {'dx*7' '0'});
model.component('comp1').geom('geom1').feature('sq148').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq149', 'Square');
model.component('comp1').geom('geom1').feature('sq149').set('pos', {'dx*8' '0'});
model.component('comp1').geom('geom1').feature('sq149').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq150', 'Square');
model.component('comp1').geom('geom1').feature('sq150').set('pos', {'dx*9' '0'});
model.component('comp1').geom('geom1').feature('sq150').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq151', 'Square');
model.component('comp1').geom('geom1').feature('sq151').set('pos', {'dx*10' '0'});
model.component('comp1').geom('geom1').feature('sq151').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq152', 'Square');
model.component('comp1').geom('geom1').feature('sq152').set('pos', {'dx*11' '0'});
model.component('comp1').geom('geom1').feature('sq152').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq153', 'Square');
model.component('comp1').geom('geom1').feature('sq153').set('pos', {'dx*12' '0'});
model.component('comp1').geom('geom1').feature('sq153').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq154', 'Square');
model.component('comp1').geom('geom1').feature('sq154').set('pos', {'dx*13' '0'});
model.component('comp1').geom('geom1').feature('sq154').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq155', 'Square');
model.component('comp1').geom('geom1').feature('sq155').set('pos', {'dx*14' '0'});
model.component('comp1').geom('geom1').feature('sq155').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq156', 'Square');
model.component('comp1').geom('geom1').feature('sq156').set('pos', {'dx*15' '0'});
model.component('comp1').geom('geom1').feature('sq156').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq157', 'Square');
model.component('comp1').geom('geom1').feature('sq157').set('pos', {'dx*16' '0'});
model.component('comp1').geom('geom1').feature('sq157').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq158', 'Square');
model.component('comp1').geom('geom1').feature('sq158').set('pos', {'dx*17' '0'});
model.component('comp1').geom('geom1').feature('sq158').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq159', 'Square');
model.component('comp1').geom('geom1').feature('sq159').set('pos', {'dx*18' '0'});
model.component('comp1').geom('geom1').feature('sq159').set('size', 'dx');
model.component('comp1').geom('geom1').create('sq160', 'Square');
model.component('comp1').geom('geom1').feature('sq160').set('pos', {'dx*19' '0'});
model.component('comp1').geom('geom1').feature('sq160').set('size', 'dx');
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('dif1').set('intbnd', false);
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'r1' 'sq1' 'sq10' 'sq100' 'sq101' 'sq102' 'sq103' 'sq104' 'sq105' 'sq106'  ...
'sq107' 'sq108' 'sq109' 'sq11' 'sq110' 'sq111' 'sq112' 'sq113' 'sq114' 'sq115'  ...
'sq116' 'sq117' 'sq118' 'sq119' 'sq12' 'sq120' 'sq121' 'sq122' 'sq123' 'sq124'  ...
'sq125' 'sq126' 'sq127' 'sq128' 'sq129' 'sq13' 'sq130' 'sq131' 'sq132' 'sq133'  ...
'sq134' 'sq135' 'sq136' 'sq137' 'sq138' 'sq139' 'sq14' 'sq140' 'sq141' 'sq142'  ...
'sq143' 'sq144' 'sq145' 'sq146' 'sq147' 'sq148' 'sq149' 'sq15' 'sq150' 'sq151'  ...
'sq152' 'sq153' 'sq154' 'sq155' 'sq156' 'sq157' 'sq158' 'sq159' 'sq16' 'sq160'  ...
'sq17' 'sq18' 'sq19' 'sq2' 'sq20' 'sq21' 'sq22' 'sq23' 'sq24' 'sq25'  ...
'sq26' 'sq27' 'sq28' 'sq29' 'sq3' 'sq30' 'sq31' 'sq32' 'sq33' 'sq34'  ...
'sq35' 'sq36' 'sq37' 'sq38' 'sq39' 'sq4' 'sq40' 'sq41' 'sq42' 'sq43'  ...
'sq44' 'sq45' 'sq46' 'sq47' 'sq48' 'sq49' 'sq5' 'sq50' 'sq51' 'sq52'  ...
'sq53' 'sq54' 'sq55' 'sq56' 'sq57' 'sq58' 'sq59' 'sq6' 'sq60' 'sq61'  ...
'sq62' 'sq63' 'sq64' 'sq65' 'sq66' 'sq67' 'sq68' 'sq69' 'sq7' 'sq70'  ...
'sq71' 'sq72' 'sq73' 'sq74' 'sq75' 'sq76' 'sq77' 'sq78' 'sq79' 'sq8'  ...
'sq80' 'sq81' 'sq82' 'sq83' 'sq84' 'sq85' 'sq86' 'sq87' 'sq88' 'sq89'  ...
'sq9' 'sq90' 'sq91' 'sq92' 'sq93' 'sq94' 'sq95' 'sq96' 'sq97' 'sq98'  ...
'sq99'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'r2' 'sq1' 'sq2' 'sq3' 'sq4'});
model.component('comp1').geom('geom1').run;

model.component('comp1').material.create('mat1', 'Common');

model.component('comp1').physics.create('spf', 'LaminarFlow', 'geom1');
model.component('comp1').physics('spf').create('inl1', 'InletBoundary', 1);
model.component('comp1').physics('spf').feature('inl1').selection.set([1]);
model.component('comp1').physics('spf').create('out1', 'OutletBoundary', 1);
model.component('comp1').physics('spf').feature('out1').selection.set([52]);

model.component('comp1').mesh('mesh1').autoMeshSize(6);

model.result.table('tbl1').comments('Line Average 1 (p)');

model.component('comp1').view('view1').axis.set('xmin', -0.6211636066436768);
model.component('comp1').view('view1').axis.set('xmax', 2.921337127685547);
model.component('comp1').view('view1').axis.set('ymin', -0.6200881004333496);
model.component('comp1').view('view1').axis.set('ymax', 1.948786735534668);

model.component('comp1').material('mat1').propertyGroup('def').set('density', '1');
model.component('comp1').material('mat1').propertyGroup('def').set('dynamicviscosity', '1e-3');

model.component('comp1').physics('spf').feature('inl1').set('ComponentWise', 'VelocityFieldComponentWise');
model.component('comp1').physics('spf').feature('inl1').set('U0in', 0.01);
model.component('comp1').physics('spf').feature('inl1').set('u0', [1; 0; 0]);

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.numerical.create('av1', 'AvLine');
model.result.numerical('av1').selection.set([1]);
model.result.numerical('av1').set('probetag', 'none');
model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup2D');
model.result('pg1').create('surf1', 'Surface');
model.result('pg2').create('con1', 'Contour');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').runAll;

model.result.numerical('av1').set('table', 'tbl1');
model.result.numerical('av1').set('expr', {'p'});
model.result.numerical('av1').set('unit', {'Pa'});
model.result.numerical('av1').set('descr', {'Pressure'});
model.result.numerical('av1').setResult;
model.result('pg1').label('Velocity (spf)');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').feature('surf1').label('Surface');
model.result('pg1').feature('surf1').set('smooth', 'internal');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg2').label('Pressure (spf)');
model.result('pg2').set('frametype', 'spatial');
model.result('pg2').feature('con1').label('Contour');
model.result('pg2').feature('con1').set('expr', 'p');
model.result('pg2').feature('con1').set('unit', 'Pa');
model.result('pg2').feature('con1').set('descr', 'Pressure');
model.result('pg2').feature('con1').set('number', 40);
model.result('pg2').feature('con1').set('smooth', 'internal');
model.result('pg2').feature('con1').set('resolution', 'normal');

model.label('pressure.mph');

model.component('comp1').geom('geom1').feature.remove('sq1');
model.component('comp1').geom('geom1').feature.remove('sq2');
model.component('comp1').geom('geom1').feature.remove('sq3');
model.component('comp1').geom('geom1').feature.remove('sq4');
model.component('comp1').geom('geom1').feature.remove('sq5');
model.component('comp1').geom('geom1').feature.remove('sq6');
model.component('comp1').geom('geom1').feature.remove('sq7');
model.component('comp1').geom('geom1').feature.remove('sq8');
model.component('comp1').geom('geom1').feature.remove('sq9');
model.component('comp1').geom('geom1').feature.remove('sq10');
model.component('comp1').geom('geom1').feature.remove('sq11');
model.component('comp1').geom('geom1').feature.remove('sq12');
model.component('comp1').geom('geom1').feature.remove('sq13');
model.component('comp1').geom('geom1').feature.remove('sq14');
model.component('comp1').geom('geom1').feature.remove('sq15');
model.component('comp1').geom('geom1').feature.remove('sq16');
model.component('comp1').geom('geom1').feature.remove('sq17');
model.component('comp1').geom('geom1').feature.remove('sq18');
model.component('comp1').geom('geom1').feature.remove('sq19');
model.component('comp1').geom('geom1').feature.remove('sq20');
model.component('comp1').geom('geom1').feature.remove('sq21');
model.component('comp1').geom('geom1').feature.remove('sq22');
model.component('comp1').geom('geom1').feature.remove('sq23');
model.component('comp1').geom('geom1').feature.remove('sq24');
model.component('comp1').geom('geom1').feature.remove('sq25');
model.component('comp1').geom('geom1').feature.remove('sq26');
model.component('comp1').geom('geom1').feature.remove('sq27');
model.component('comp1').geom('geom1').feature.remove('sq28');
model.component('comp1').geom('geom1').feature.remove('sq29');
model.component('comp1').geom('geom1').feature.remove('sq30');
model.component('comp1').geom('geom1').feature.remove('sq31');
model.component('comp1').geom('geom1').feature.remove('sq32');
model.component('comp1').geom('geom1').feature.remove('sq33');
model.component('comp1').geom('geom1').feature.remove('sq34');
model.component('comp1').geom('geom1').feature.remove('sq35');
model.component('comp1').geom('geom1').feature.remove('sq36');
model.component('comp1').geom('geom1').feature.remove('sq37');
model.component('comp1').geom('geom1').feature.remove('sq38');
model.component('comp1').geom('geom1').feature.remove('sq39');
model.component('comp1').geom('geom1').feature.remove('sq40');
model.component('comp1').geom('geom1').feature.remove('sq41');
model.component('comp1').geom('geom1').feature.remove('sq42');
model.component('comp1').geom('geom1').feature.remove('sq43');
model.component('comp1').geom('geom1').feature.remove('sq44');
model.component('comp1').geom('geom1').feature.remove('sq45');
model.component('comp1').geom('geom1').feature.remove('sq46');
model.component('comp1').geom('geom1').feature.remove('sq47');
model.component('comp1').geom('geom1').feature.remove('sq48');
model.component('comp1').geom('geom1').feature.remove('sq49');
model.component('comp1').geom('geom1').feature.remove('sq50');
model.component('comp1').geom('geom1').feature.remove('sq51');
model.component('comp1').geom('geom1').feature.remove('sq52');
model.component('comp1').geom('geom1').feature.remove('sq53');
model.component('comp1').geom('geom1').feature.remove('sq54');
model.component('comp1').geom('geom1').feature.remove('sq55');
model.component('comp1').geom('geom1').feature.remove('sq56');
model.component('comp1').geom('geom1').feature.remove('sq57');
model.component('comp1').geom('geom1').feature.remove('sq58');
model.component('comp1').geom('geom1').feature.remove('sq59');
model.component('comp1').geom('geom1').feature.remove('sq60');
model.component('comp1').geom('geom1').feature.remove('sq61');
model.component('comp1').geom('geom1').feature.remove('sq62');
model.component('comp1').geom('geom1').feature.remove('sq63');
model.component('comp1').geom('geom1').feature.remove('sq64');
model.component('comp1').geom('geom1').feature.remove('sq65');
model.component('comp1').geom('geom1').feature.remove('sq66');
model.component('comp1').geom('geom1').feature.remove('sq67');
model.component('comp1').geom('geom1').feature.remove('sq68');
model.component('comp1').geom('geom1').feature.remove('sq69');
model.component('comp1').geom('geom1').feature.remove('sq70');
model.component('comp1').geom('geom1').feature.remove('sq71');
model.component('comp1').geom('geom1').feature.remove('sq72');
model.component('comp1').geom('geom1').feature.remove('sq73');
model.component('comp1').geom('geom1').feature.remove('sq74');
model.component('comp1').geom('geom1').feature.remove('sq75');
model.component('comp1').geom('geom1').feature.remove('sq76');
model.component('comp1').geom('geom1').feature.remove('sq77');
model.component('comp1').geom('geom1').feature.remove('sq78');
model.component('comp1').geom('geom1').feature.remove('sq79');
model.component('comp1').geom('geom1').feature.remove('sq80');
model.component('comp1').geom('geom1').feature.remove('sq81');
model.component('comp1').geom('geom1').feature.remove('sq82');
model.component('comp1').geom('geom1').feature.remove('sq83');
model.component('comp1').geom('geom1').feature.remove('sq84');
model.component('comp1').geom('geom1').feature.remove('sq85');
model.component('comp1').geom('geom1').feature.remove('sq86');
model.component('comp1').geom('geom1').feature.remove('sq87');
model.component('comp1').geom('geom1').feature.remove('sq88');
model.component('comp1').geom('geom1').feature.remove('sq89');
model.component('comp1').geom('geom1').feature.remove('sq90');
model.component('comp1').geom('geom1').feature.remove('sq91');
model.component('comp1').geom('geom1').feature.remove('sq92');
model.component('comp1').geom('geom1').feature.remove('sq93');
model.component('comp1').geom('geom1').feature.remove('sq94');
model.component('comp1').geom('geom1').feature.remove('sq95');
model.component('comp1').geom('geom1').feature.remove('sq96');
model.component('comp1').geom('geom1').feature.remove('sq97');
model.component('comp1').geom('geom1').feature.remove('sq98');
model.component('comp1').geom('geom1').feature.remove('sq99');
model.component('comp1').geom('geom1').feature.remove('sq100');
model.component('comp1').geom('geom1').feature.remove('sq101');
model.component('comp1').geom('geom1').feature.remove('sq102');
model.component('comp1').geom('geom1').feature.remove('sq103');
model.component('comp1').geom('geom1').feature.remove('sq104');
model.component('comp1').geom('geom1').feature.remove('sq105');
model.component('comp1').geom('geom1').feature.remove('sq106');
model.component('comp1').geom('geom1').feature.remove('sq107');
model.component('comp1').geom('geom1').feature.remove('sq108');
model.component('comp1').geom('geom1').feature.remove('sq109');
model.component('comp1').geom('geom1').feature.remove('sq110');
model.component('comp1').geom('geom1').feature.remove('sq111');
model.component('comp1').geom('geom1').feature.remove('sq112');
model.component('comp1').geom('geom1').feature.remove('sq113');
model.component('comp1').geom('geom1').feature.remove('sq114');
model.component('comp1').geom('geom1').feature.remove('sq115');
model.component('comp1').geom('geom1').feature.remove('sq116');
model.component('comp1').geom('geom1').feature.remove('sq117');
model.component('comp1').geom('geom1').feature.remove('sq118');
model.component('comp1').geom('geom1').feature.remove('sq119');
model.component('comp1').geom('geom1').feature.remove('sq120');
model.component('comp1').geom('geom1').feature.remove('sq121');
model.component('comp1').geom('geom1').feature.remove('sq122');
model.component('comp1').geom('geom1').feature.remove('sq123');
model.component('comp1').geom('geom1').feature.remove('sq124');
model.component('comp1').geom('geom1').feature.remove('sq125');
model.component('comp1').geom('geom1').feature.remove('sq126');
model.component('comp1').geom('geom1').feature.remove('sq127');
model.component('comp1').geom('geom1').feature.remove('sq128');
model.component('comp1').geom('geom1').feature.remove('sq129');
model.component('comp1').geom('geom1').feature.remove('sq130');
model.component('comp1').geom('geom1').feature.remove('sq131');
model.component('comp1').geom('geom1').feature.remove('sq132');
model.component('comp1').geom('geom1').feature.remove('sq133');
model.component('comp1').geom('geom1').feature.remove('sq134');
model.component('comp1').geom('geom1').feature.remove('sq135');
model.component('comp1').geom('geom1').feature.remove('sq136');
model.component('comp1').geom('geom1').feature.remove('sq137');
model.component('comp1').geom('geom1').feature.remove('sq138');
model.component('comp1').geom('geom1').feature.remove('sq139');
model.component('comp1').geom('geom1').feature.remove('sq140');
model.component('comp1').geom('geom1').feature.remove('sq141');
model.component('comp1').geom('geom1').feature.remove('sq142');
model.component('comp1').geom('geom1').feature.remove('sq143');
model.component('comp1').geom('geom1').feature.remove('sq144');
model.component('comp1').geom('geom1').feature.remove('sq145');
model.component('comp1').geom('geom1').feature.remove('sq146');
model.component('comp1').geom('geom1').feature.remove('sq147');
model.component('comp1').geom('geom1').feature.remove('sq148');
model.component('comp1').geom('geom1').feature.remove('sq149');
model.component('comp1').geom('geom1').feature.remove('sq150');
model.component('comp1').geom('geom1').feature.remove('sq151');
model.component('comp1').geom('geom1').feature.remove('sq152');
model.component('comp1').geom('geom1').feature.remove('sq153');
model.component('comp1').geom('geom1').feature.remove('sq154');
model.component('comp1').geom('geom1').feature.remove('sq155');
model.component('comp1').geom('geom1').feature.remove('sq156');
model.component('comp1').geom('geom1').feature.remove('sq157');
model.component('comp1').geom('geom1').feature.remove('sq158');
model.component('comp1').geom('geom1').feature.remove('sq159');
model.component('comp1').geom('geom1').feature.remove('sq160');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').common.create('dtopo1', 'DensityTopology');
model.component('comp1').common.remove('dtopo1');

model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').feature('r1').set('pos', {'excess' '0'});
model.component('comp1').geom('geom1').feature('r1').set('size', {'width' 'height'});
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature.remove('r2');
model.component('comp1').geom('geom1').feature.remove('r3');
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', {'-excess' '0'});
model.component('comp1').geom('geom1').feature('r2').set('size', {'1' 'height'});
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature('r2').set('size', {'excess' 'height'});
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature('r1').set('pos', [0 0]);
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature('r2').set('size', {'excess' 'height/2'});
model.component('comp1').geom('geom1').feature('r2').set('pos', {'-excess' 'height/2'});
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('size', {'excess' 'height'});
model.component('comp1').geom('geom1').feature('r3').set('pos', {'width' '0'});
model.component('comp1').geom('geom1').feature.remove('dif1');

model.component('comp1').common.create('dtopo1', 'DensityTopology');

model.component('comp1').geom('geom1').run;

model.component('comp1').common('dtopo1').selection.set([2]);
model.component('comp1').common('dtopo1').set('filterType', 'No_filter');
model.component('comp1').common('dtopo1').set('projectionType', 'TanhProjection');
model.component('comp1').common('dtopo1').set('interpolationType', 'Darcy');
model.component('comp1').common('dtopo1').set('q_Darcy', '1');
model.component('comp1').common('dtopo1').set('theta_0', '1');
model.component('comp1').common('dtopo1').selection.set([2]);

model.component('comp1').variable.create('var1');
model.component('comp1').variable('var1').set('alpha_max', 'spf.mu/(Da*L^2)');
model.component('comp1').variable('var1').descr('alpha_max', 'Volume force coefficient, max value');
model.component('comp1').variable('var1').set('alpha', 'alpha_max*dtopo1.theta_p');
model.component('comp1').variable('var1').descr('alpha', 'Volume force coefficient');

model.param.set('Da', '1e-5');
model.param.descr('Da', '');
model.param.set('L', 'dx');

model.component('comp1').physics('spf').create('vf1', 'VolumeForce', 2);
model.component('comp1').physics('spf').feature('vf1').set('F', {'-alpha*u' '-alpha*v' '0'});
model.component('comp1').physics('spf').feature('vf1').selection.set([2]);

model.param.set('dx', '0.1[m]');

model.study.create('std2');
model.study('std2').setGenConv(true);
model.study('std2').create('stat', 'Stationary');
model.study('std2').feature('stat').activate('spf', true);
model.study('std2').label('Optimization');

model.component('comp1').physics.create('opt', 'GeneralOptimization', 'geom1');

model.study('std1').feature('stat').activate('opt', true);
model.study('std2').feature('stat').activate('opt', true);

model.component('comp1').physics('opt').create('iobj1', 'IntegralObjective', 1);
model.component('comp1').physics('opt').feature('iobj1').selection.set([1]);
model.component('comp1').physics('opt').feature('iobj1').set('objectiveExpression', 'p');

model.study('std2').create('opt', 'Optimization');

model.sol.create('sol2');
model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.batch.create('o1', 'Optimization');
model.batch('o1').study('std2');
model.batch('p1').study('std2');
model.batch('o1').attach('std2');
model.batch('p1').create('so1', 'Solutionseq');
model.batch('p1').feature('so1').set('seq', 'sol2');
model.batch('p1').feature('so1').set('store', 'on');
model.batch('p1').feature('so1').set('clear', 'on');
model.batch('p1').feature('so1').set('psol', 'none');
model.batch('p1').attach('std2');
model.batch('p1').set('optimization', 'o1');
model.batch('p1').set('err', 'on');
model.batch('p1').set('control', 'opt');
model.batch('o1').set('parametricjobs', {'p1'});

model.sol.create('sol3');
model.sol('sol3').study('std2');
model.sol('sol3').label('Parametric Solutions 1');

model.batch('p1').feature('so1').set('psol', 'sol3');

model.result.dataset('dset3').set('geom', 'geom1');
model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').label('Velocity (spf) 1');
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('data', 'dset3');
model.result('pg3').feature.create('surf1', 'Surface');
model.result('pg3').feature('surf1').label('Surface');
model.result('pg3').feature('surf1').set('smooth', 'internal');
model.result('pg3').feature('surf1').set('data', 'parent');
model.result.create('pg4', 'PlotGroup2D');
model.result('pg4').label('Pressure (spf) 1');
model.result('pg4').set('frametype', 'spatial');
model.result('pg4').set('data', 'dset3');
model.result('pg4').feature.create('con1', 'Contour');
model.result('pg4').feature('con1').label('Contour');
model.result('pg4').feature('con1').set('expr', 'p');
model.result('pg4').feature('con1').set('number', 40);
model.result('pg4').feature('con1').set('smooth', 'internal');
model.result('pg4').feature('con1').set('data', 'parent');
model.result.numerical.create('gev1', 'EvalGlobal');
model.result.numerical('gev1').set('data', 'dset3');
model.result.numerical('gev1').set('expr', {'opt.iobj1'});
model.result.numerical('gev1').set('descr', {'Objective value'});
model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset3');
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', 'dtopo1.theta');
model.result.remove('pg4');
model.result.remove('pg3');
model.result.remove('pg5');
model.result.numerical.remove('gev1');

model.study('std2').feature('opt').set('probewindow', '');

model.component('comp1').common('dtopo1').set('projectionType', 'No_projection');
model.component('comp1').common('dtopo1').set('q_Darcy', 'q');

model.param.set('q', '1');

model.component('comp1').material('mat1').selection.set([1 2 3]);

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('s1', 'Stationary');
model.sol('sol2').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.batch('o1').active(true);
model.batch('o1').attach('std2');
model.batch('p1').feature.remove('so1');
model.batch('p1').create('so1', 'Solutionseq');
model.batch('p1').feature('so1').set('seq', 'sol2');
model.batch('p1').feature('so1').set('store', 'on');
model.batch('p1').feature('so1').set('clear', 'on');
model.batch('p1').feature('so1').set('psol', 'sol3');
model.batch('p1').attach('std2');
model.batch('p1').set('optimization', 'o1');
model.batch('p1').set('err', 'on');
model.batch('p1').set('control', 'opt');
model.batch('o1').set('parametricjobs', {'p1'});

model.result.dataset('dset3').set('geom', 'geom1');
model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').label('Velocity (spf) 1');
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('data', 'dset3');
model.result('pg3').feature.create('surf1', 'Surface');
model.result('pg3').feature('surf1').label('Surface');
model.result('pg3').feature('surf1').set('smooth', 'internal');
model.result('pg3').feature('surf1').set('data', 'parent');
model.result.create('pg4', 'PlotGroup2D');
model.result('pg4').label('Pressure (spf) 1');
model.result('pg4').set('frametype', 'spatial');
model.result('pg4').set('data', 'dset3');
model.result('pg4').feature.create('con1', 'Contour');
model.result('pg4').feature('con1').label('Contour');
model.result('pg4').feature('con1').set('expr', 'p');
model.result('pg4').feature('con1').set('number', 40);
model.result('pg4').feature('con1').set('smooth', 'internal');
model.result('pg4').feature('con1').set('data', 'parent');
model.result.numerical.create('gev1', 'EvalGlobal');
model.result.numerical('gev1').set('data', 'dset3');
model.result.numerical('gev1').set('expr', {'opt.iobj1'});
model.result.numerical('gev1').set('descr', {'Objective value'});
model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset3');
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', 'dtopo1.theta');
model.result.remove('pg4');
model.result.remove('pg3');
model.result.remove('pg5');
model.result.numerical.remove('gev1');

model.study('std2').feature('opt').set('probewindow', '');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('spf').feature('inl1').selection.set([1 6]);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').geom('geom1').run('fin');

model.study('std1').feature('stat').setIndex('activate', false, 3);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('opt').active(false);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('spf').feature('out1').selection.set([8 11]);

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.component('comp1').physics('opt').active(true);

model.study('std2').feature('opt').setIndex('controlVariableActive', false, 0);
model.study('std2').feature('opt').setIndex('controlVariableActive', true, 0);
model.study('std2').feature('opt').set('optsolver', 'mma');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('s1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.batch.remove('o1');
model.batch.remove('p1');

model.result.dataset('dset2').set('geom', 'geom1');
model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').label('Velocity (spf) 1');
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('data', 'dset2');
model.result('pg3').feature.create('surf1', 'Surface');
model.result('pg3').feature('surf1').label('Surface');
model.result('pg3').feature('surf1').set('smooth', 'internal');
model.result('pg3').feature('surf1').set('data', 'parent');
model.result.create('pg4', 'PlotGroup2D');
model.result('pg4').label('Pressure (spf) 1');
model.result('pg4').set('frametype', 'spatial');
model.result('pg4').set('data', 'dset2');
model.result('pg4').feature.create('con1', 'Contour');
model.result('pg4').feature('con1').label('Contour');
model.result('pg4').feature('con1').set('expr', 'p');
model.result('pg4').feature('con1').set('number', 40);
model.result('pg4').feature('con1').set('smooth', 'internal');
model.result('pg4').feature('con1').set('data', 'parent');
model.result.numerical.create('gev1', 'EvalGlobal');
model.result.numerical('gev1').set('data', 'dset2');
model.result.numerical('gev1').set('expr', {'opt.iobj1'});
model.result.numerical('gev1').set('descr', {'Objective value'});
model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset2');
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', 'dtopo1.theta');

model.sol('sol2').runAll;

model.result('pg3').run;
model.result('pg3').set('data', 'dset2');
model.result('pg4').set('data', 'dset2');

model.study('std2').feature('opt').set('probewindow', '');

model.component('comp1').mesh('mesh1').autoMeshSize(4);
model.component('comp1').mesh('mesh1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg4').run;
model.result('pg2').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg3').run;
model.result.create('pg6', 'PlotGroup2D');
model.result('pg6').run;
model.result('pg5').run;
model.result('pg6').run;
model.result.remove('pg6');
model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').label('Topology');
model.result('pg5').run;
model.result('pg5').run;
model.result('pg4').run;
model.result('pg3').run;
model.result('pg2').run;
model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').variable('var1').set('entropy', 'spf.mu*(2*ux*ux+(uy+vx)*uy+(uy+vx)*vx+2*vy*vy)');

model.component('comp1').common('dtopo1').set('theta_0', '0.5');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;

model.component('comp1').mesh('mesh1').autoMeshSize(1);
model.component('comp1').mesh('mesh1').autoMeshSize(4);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').autoMeshSize(5);
model.component('comp1').mesh('mesh1').run;

model.component('comp1').common('dtopo1').set('projectionType', 'No_projection');

model.component('comp1').mesh('mesh1').create('map1', 'Map');
model.component('comp1').mesh('mesh1').feature('map1').selection.geom('geom1');
model.component('comp1').mesh('mesh1').feature('size').set('custom', false);
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('size').set('custom', true);
model.component('comp1').mesh('mesh1').feature('size').set('hmax', 0.1);
model.component('comp1').mesh('mesh1').feature('size').set('hmin', 0.1);
model.component('comp1').mesh('mesh1').run('size');
model.component('comp1').mesh('mesh1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.component('comp1').common('dtopo1').set('discretization', 'constant');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;

model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('map1').active(false);
model.component('comp1').mesh('mesh1').feature('size').set('custom', false);
model.component('comp1').mesh('mesh1').feature('size').set('hauto', 4);
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').automatic(true);
model.component('comp1').mesh('mesh1').automatic(false);
model.component('comp1').mesh('mesh1').run('size');
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').automatic(true);
model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg5').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.study('std1').label('Baseline');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.component('comp1').common('dtopo1').set('discretization', 'linear');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;

model.component('comp1').variable('var1').set('entropy', 'spf.mu*(2*ux*ux+(uy+vx)*uy+(uy+vx)*vx+2*vy*vy)+alpha*(u^2+v^2)');

model.component('comp1').physics('opt').feature('iobj1').active(false);
model.component('comp1').physics('opt').create('iobj2', 'IntegralObjective', 2);
model.component('comp1').physics('opt').feature('iobj2').set('objectiveExpression', 'entropy');
model.component('comp1').physics('opt').feature('iobj2').selection.set([2]);

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');

model.component('comp1').common('dtopo1').set('projectionType', 'TanhProjection');

model.result('pg5').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');

model.param.set('Da', '1e-4');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');
model.study('std2').feature('opt').set('nsolvemax', 150);

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.component('comp1').physics('opt').feature('iobj2').active(false);
model.component('comp1').physics('opt').feature('iobj1').active(true);

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.component('comp1').mesh('mesh1').create('map1', 'Map');
model.component('comp1').mesh('mesh1').run('map1');
model.component('comp1').mesh('mesh1').feature('map1').create('size1', 'Size');
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('custom', true);
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hmaxactive', true);
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hmax', 0.1);
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hminactive', true);
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hmin', 0.1);
model.component('comp1').mesh('mesh1').run('map1');

model.component('comp1').physics('spf').prop('ShapeProperty').set('order_fluid', 5);

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;
model.result('pg1').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg2').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg3').run;
model.result('pg2').run;
model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.component('comp1').common('dtopo1').set('discretization', 'constant');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg4').run;
model.result('pg5').run;

model.label('pressure_opt.mph');

model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').feature('surf1').set('expr', 'dtopo1.theta_p');
model.result('pg5').run;

model.label('pressure_opt.mph');

model.result('pg5').run;

model.component('comp1').material('mat1').propertyGroup('def').set('dynamicviscosity', {'1e-2'});

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg5').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg5').run;
model.result('pg4').run;
model.result('pg5').run;

model.component('comp1').common('dtopo1').set('projectionType', 'No_projection');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.component('comp1').common('dtopo1').set('projectionType', 'TanhProjection');

model.param.set('Da', '1e-5');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg4').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg5').run;
model.result('pg5').run;

model.component('comp1').common('dtopo1').set('projectionType', 'No_projection');

model.param.set('Da', '1e-6');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.param.set('Da', '1e-5');

model.sol('sol1').study('std1');

model.study('std1').feature('stat').set('notlistsolnum', 1);
model.study('std1').feature('stat').set('notsolnum', '1');
model.study('std1').feature('stat').set('listsolnum', 1);
model.study('std1').feature('stat').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.component('comp1').common('dtopo1').set('projectionType', 'TanhProjection');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');
model.study('std2').feature('opt').set('nsolvemax', 50);

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg3').run;
model.result('pg5').run;

model.param.set('Da', '1e-4');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg4').run;
model.result('pg3').run;
model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').run;
model.result('pg5').feature('surf1').set('expr', 'dtopo1.theta');
model.result('pg5').run;
model.result('pg5').run;

model.label('pressure_opt.mph');

model.param.set('dx', '0.1[m]/2');

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');

model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hmax', 'dx');
model.component('comp1').mesh('mesh1').feature('map1').feature('size1').set('hmin', 'dx');
model.component('comp1').mesh('mesh1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;

model.param.set('Da', '1e-5');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg5').run;

model.param.set('Da', '5e-4');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.study('std2').feature('opt').set('probewindow', '');

model.label('pressure_opt.mph');

model.param.set('dx', '0.1[m]/4');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg5').run;
model.result('pg5').set('showlegendsunit', true);

model.label('pressure_opt.mph');

model.result('pg5').run;

model.param.set('dx', '0.1[m]/2');

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

model.result('pg4').run;
model.result('pg5').run;

model.label('fluid_optimized.mph');

model.result('pg5').run;

model.study('std2').feature('opt').set('optsolver', 'mma');
model.study('std2').feature('opt').set('nsolvemax', 150);

model.sol('sol2').study('std2');

model.study('std2').feature('stat').set('notlistsolnum', 1);
model.study('std2').feature('stat').set('notsolnum', '1');
model.study('std2').feature('stat').set('listsolnum', 1);
model.study('std2').feature('stat').set('solnum', '1');

model.sol('sol2').feature.remove('o1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'stat');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'stat');
model.sol('sol2').create('o1', 'Optimization');
model.sol('sol2').feature('o1').set('control', 'opt');
model.sol('sol2').feature('o1').create('s1', 'StationaryAttrib');
model.sol('sol2').feature('o1').feature('s1').set('control', 'stat');
model.sol('sol2').feature('o1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol2').feature('o1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').create('d1', 'Direct');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('o1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol2').feature('o1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol2').feature('o1').feature('s1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg3').run;

model.study('std2').feature('opt').set('probewindow', '');

out = model;
