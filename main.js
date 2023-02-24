import Glicol from 'glicol';
import { sin } from 'glicol';

const glicol = new Glicol();

document.getElementById('play').onclick = () => {
  glicol.play({
    o: sin(440).mul('~am'),
    '~am': sin(0.81).mul(0.3).add(0.5),
  });
};