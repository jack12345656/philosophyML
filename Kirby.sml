(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius | SextusEmpericus;

datatype category = Metaphysics | Cosmology | Epistimology; 

datatype philosopher = name * category list  * (int, int, char) * name of list * string;

