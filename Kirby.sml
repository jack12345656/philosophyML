(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius ;

datatype category = Metaphysics | Cosmology | Rhetoric | Epistemology | Astronomy | Logic | Theology | Ethics | Mathematics | Politics; 

datatype philosopher = Philosopher of name * category list * (int * int) * name list;


val Thales = Philosopher(Thales, [Metaphysics, Ethics, Mathematics, Astronomy], (620,546));
val Xenophanes = Philosopher(Xenophanes, [Epistemology, Cosmology, Theology], (570,475));
val Pythagoras = Philosopher(Pythagoras, [Metaphysics, Cosmology, Mathematics, Politics, Ethics], (570,495));
val Heraclitus = Philosopher(Heraclitus, [Epistemology, Cosmology, Theology], (535,475));
val Parmenides = Philosopher(Parminedes, [Ontology, Metaphysics], (515,450));
val Zeno = Philosopher(Zeno, [Ontology, Metaphysics], (490,430));
val Democritus = Philosopher(Democritus, [Metaphysics, Mathematics, Astronomy], (460,370));
val Empedocles = Philosopher(Empedocles, [Epistemology, Cosmology, Ontology], (490,430));
val Protagoras = Philosopher(Protagoras, [Rhetoric, Ethics], (490,420));
val Gorgias = Philosopher(Gorgias, [Epistemology, Rhetoric, Ethics], (485,380));
val Socrates = Philosopher(Socrates, [Epistemology, Ethics], (470,399));
val Plato = Philosopher(Plato, [Rhetoric, Ethics, Politics], (428,348));
val Aristotle = Philosopher(Aristotle, [Epistemology, Ethics, Metaphysics, Logic, Politics], (484,322));
val Lucretius = Philosopher(Lucretius, [Ethics, Metaphysics], (99,44));


(*the following function will probably be taken out with the addition of the tree, philosopher types no longer have a name list at the end*)
(*fun doesKnow(philA(_,_,_,a::rest), philB(name,_,_,_) = 
	 a = name orelse doesKnow(philA(_,_,_,rest), philB(name,_,_,_));*)

fun contains(x, []) = false
| contains(x, y::rest) = ((x=y) orelse contains(x,rest)); 

fun inSameCategory(philA(_,[],_),philB(_,bb,_)) = []  
| inSameCategory(philA(_,a::aRest,_),philB(_,bb,_)) = 
	if contains(a,bb)
	then a::inSameCategory(philA(_,aRest,_),philB(_,bb,_))
	else inSameCategory(philA(_,aRest,_),philB(_,bb,_));
