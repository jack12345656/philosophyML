(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius | SextusEmpericus;

datatype category = Metaphysics | Cosmology | Epistimology | Theology; 

datatype philosopher = Philosopher of name * category list * (int, int, char) * name list;


val Thales = Philosopher(Thales, [Metaphysics, Cosmology], (620,546,b),[Xenophanes, Heraclitus, Democritus]);
val Xenophanes = Philosopher(Xenophanes, [Metaphysics, Cosmology], (620,546,b),[Xenophanes, Heraclitus, Democritus]);

fun doesKnow(philA(_,_,_,a::rest), philB(name,_,_,_) = 
	 a = name orelse doesKnow(philA(_,_,_,rest), philB(name,_,_,_));  

fun contains(x, []) = false
| contains(x, y::rest) = ((x=y) orelse contains(x,rest)); 

fun inSameCategory(philA(_,[],_,_),philB(_,bb,_,_)) = []  
| inSameCategory(philA(_,a::aRest,_,_),philB(_,bb,_,_)) = 
	if contains(a,bb)
	then a::inSameCategory(philA(_,aRest,_,_),philB(_,bb,_,_))
	else inSameCategory(philA(_,aRest,_,_),philB(_,bb,_,_));
