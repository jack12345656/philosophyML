(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius ;

datatype category = Ontology | Metaphysics | Cosmology | Rhetoric | Epistemology | Astronomy | Logic | Theology | Ethics | Mathematics | Politics; 

datatype philosopher = Philosopher of name * category list * (int * int);


val thales = Philosopher(Thales, [Metaphysics, Ethics, Mathematics, Astronomy], (620,546));
val xenophanes = Philosopher(Xenophanes, [Epistemology, Cosmology, Theology], (570,475));
val pythagoras = Philosopher(Pythagoras, [Metaphysics, Cosmology, Mathematics, Politics, Ethics], (570,495));
val heraclitus = Philosopher(Heraclitus, [Epistemology, Cosmology, Theology], (535,475));
val parmenides = Philosopher(Parmenides, [Ontology, Metaphysics], (515,450));
val zeno = Philosopher(Zeno, [Ontology, Metaphysics], (490,430));
val democritus = Philosopher(Democritus, [Metaphysics, Mathematics, Astronomy], (460,370));
val empedocles = Philosopher(Empedocles, [Epistemology, Cosmology, Ontology], (490,430));
val protagoras = Philosopher(Protagoras, [Rhetoric, Ethics], (490,420));
val gorgias = Philosopher(Gorgias, [Epistemology, Rhetoric, Ethics], (485,380));
val socrates = Philosopher(Socrates, [Epistemology, Ethics], (470,399));
val plato = Philosopher(Plato, [Rhetoric, Ethics, Politics], (428,348));
val aristotle = Philosopher(Aristotle, [Epistemology, Ethics, Metaphysics, Logic, Politics], (484,322));
val lucretius = Philosopher(Lucretius, [Ethics, Metaphysics], (99,44));

(*list of philosophers to run methods over*)
val philList = [thales,xenophanes,pythagoras,heraclitus,parmenides,zeno,democritus,empedocles,protagoras,gorgias,socrates,plato,aristotle,lucretius];

(*relation influce([(this philosopher, influences this philosopher)]*)
val influence = [(thales,pythagoras),(thales,xenophanes),
		(xenophanes,heraclitus),(xenophanes,parmenides),
		(pythagoras,plato),(pythagoras,empedocles),(pythagoras,parmenides),(pythagoras,heraclitus),
		(parmenides,plato),(parmenides,empedocles),(parmenides,gorgias),(parmenides,zeno),(parmenides,aristotle),(parmenides,protagoras),
		(heraclitus,plato),(heraclitus,parmenides),
		(democritus,aristotle),(democritus,protagoras),
		(zeno,plato),(zeno,gorgias),(zeno,aristotle),
		(plato,aristotle),(plato,lucretius),
		(protagoras,plato),
		(aristotle,lucretius),
		(socrates,plato),(socrates,aristotle),(socrates,lucretius),
		(empedocles,gorgias)];

(*function to test two philosophers (a,b) over relation influence, to determine if a influenced b*)
fun influences(a,b,[]) = false
	| influences(a,b,(h1,h2)::rest) = (a = h1 andalso b = h2) orelse influences(a,b,rest);

(*function to test two philosophers (a,b) over image of relation influence, to determine if a was influenced by b*)
fun  influencedBy(a,b,[]) = false
	| influencedBy(a,b,xx) = contains(a, image(b,xx);

(*the following function will probably be taken out with the addition of the tree, philosopher types no longer have a name list at the end*)
(*fun doesKnow(philA(_,_,_,a::rest), philB(name,_,_,_) = 
	 a = name orelse doesKnow(philA(_,_,_,rest), philB(name,_,_,_));*)

(* helper functions to be called in more complext functions*)
fun image(a,[])=[]
| image(a,(x,y)::rest) = 
	if a=x
	then y::image(a,rest)
	else image(a,rest);
fun contains(x, []) = false
| contains(x, y::rest) = ((x=y) orelse contains(x,rest)); 

fun inSameCategory(philA(_,[],_),philB(_,bb,_)) = []  
| inSameCategory(philA(_,a::aRest,_),philB(_,bb,_)) = 
	if contains(a,bb)
	then a::inSameCategory(philA(_,aRest,_),philB(_,bb,_))
	else inSameCategory(philA(_,aRest,_),philB(_,bb,_));
