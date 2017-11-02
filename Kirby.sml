(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius | SextusEmpericus;

datatype category = Metaphysics | Cosmology | Epistimology | Theology; 

datatype philosopher = Philosopher of name * list of category  * (int, int, char) * list of name;

Philosopher(Thales, [Metaphysics, Cosmology], (620,546,b),[Xenophanes, Heraclitus, Democritus]
