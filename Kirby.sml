(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius ;

datatype category = Ontology | Metaphysics | Cosmology | Rhetoric | Epistemology | Astronomy | Logic | Theology | Ethics | Mathematics | Politics; 

datatype philosopher = Philosopher of name * category list * (int * int);


val thales = Philosopher(Thales, [Metaphysics, Ethics, Mathematics, Astronomy], (620,546),true);
val xenophanes = Philosopher(Xenophanes, [Epistemology, Cosmology, Theology], (570,475),true);
val pythagoras = Philosopher(Pythagoras, [Metaphysics, Cosmology, Mathematics, Politics, Ethics], (570,495),true);
val heraclitus = Philosopher(Heraclitus, [Epistemology, Cosmology, Theology], (535,475),true);
val parmenides = Philosopher(Parmenides, [Ontology, Metaphysics], (515,450),true);
val zeno = Philosopher(Zeno, [Ontology, Metaphysics], (490,430),true);
val democritus = Philosopher(Democritus, [Metaphysics, Mathematics, Astronomy], (460,370),true);
val empedocles = Philosopher(Empedocles, [Epistemology, Cosmology, Ontology], (490,430),true);
val protagoras = Philosopher(Protagoras, [Rhetoric, Ethics], (490,420),true);
val gorgias = Philosopher(Gorgias, [Epistemology, Rhetoric, Ethics], (485,380),true);
val socrates = Philosopher(Socrates, [Epistemology, Ethics], (470,399),true);
val plato = Philosopher(Plato, [Rhetoric, Ethics, Politics], (428,348),true);
val aristotle = Philosopher(Aristotle, [Epistemology, Ethics, Metaphysics, Logic, Politics], (484,322),true);
val lucretius = Philosopher(Lucretius, [Ethics, Metaphysics], (99,44),true);

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

(* helper functions to be called in more complext functions*)
fun image(a,[])=[]
| image(a,(x,y)::rest) = 
	if a=x
	then y::image(a,rest)
	else image(a,rest);

fun contains(x, []) = false
| contains(x, y::rest) = ((x=y) orelse contains(x,rest)); 

fun intersect([],bb) = []
|intersect(a:rest,[]) = []
|intersect(a:rest,bb) = 
	if contains(a,bb)
	then a::intersect(rest,bb)
	else intersect(rest,bb);

(*function to test two philosophers (a,b) over relation influence, to determine if a influenced b*)
fun influences(a,b,[]) = false
	| influences(a,b,(h1,h2)::rest) = (a = h1 andalso b = h2) orelse influences(a,b,rest);

(*function to test two philosophers (a,b) over image of relation influence, to determine if a was influenced by b*)
fun  influencedBy(a,b,[]) = false
	| influencedBy(a,b,xx) = contains(a, image(b,xx);

(*function returns intersection of two philosophers categories of thought*)
fun intersectionCategory(Philosopher(_,aa,_,_), Philosopher(_,bb,_,_)) =
	intersect(aa,bb);

fun wasAliveDuring(x,y) = 
	let
		val i = ref x;
		val pp = whoWasAlive(i);
	in
		(while !i > y do
			( i:= !i - 1;
			 pp := union(!pp, whoWasAlive(!i)));
			!pp)
	end;

fun fetchList(Philosopher(_,aa,_,_)) = aa;	

fun courseReadingList(x,y,c) =
	let
		val pp = wasAliveDuring(x,y);
	in
		fun listCategory(c,[]) = []
			|listCategory(c,pp) =
			if contains(c, fetchList(hd(pp)))
			then hd(pp)::listCategory(c, tl(pp))
			else listCategory(c, tl(pp));
	end;
