(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius ;

datatype category = Ontology | Metaphysics | Cosmology | Rhetoric | Epistemology | Astronomy | Logic | Theology | Ethics | Mathematics | Politics; 

datatype philosopher = Philosopher of name * category list * (int * int) * bool;


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

(* helper functions to be called in more complex functions*)
fun image(a,[])=[]
| image(a,(x,y)::rest) = 
	if a=x
	then y::image(a,rest)
	else image(a,rest);

fun contains(x, []) = false
| contains(x, y::rest) = ((x=y) orelse contains(x,rest)); 

fun intersection([],bb) = [] | intersection(a::rest,bb) = if contains(a, bb) then a::intersection(rest, bb) else intersection(rest,bb);

fun makeNoRepeats([]) = []
	|makeNoRepeats(a::rest) = if contains(a,rest) = true then makeNoRepeats(rest) else a::makeNoRepeats(rest);

fun union(a,b) = makeNoRepeats(a@b);

fun fetchList(Philosopher(_,aa,_,_)) = aa;	

fun map(f, []) = []
  | map(f, a::rest) = f(a)::map(f, rest);

fun filter(f, []) = []
  | filter(f, a::rest) = 
    if f(a) 
    then a::filter(f, rest) 
    else filter(f, rest);

fun flatlist([]) = [] 
  | flatlist(x::rest) = x@flatlist(rest);

(*function to test two philosophers (a,b) over relation influence, to determine if a influenced b*)
fun influences(a,b,[]) = false
	| influences(a,b,(h1,h2)::rest) = (a = h1 andalso b = h2) orelse influences(a,b,rest);

(*function to test two philosophers (a,b) over image of relation influence, to determine if a was influenced by b*)
fun  influencedBy(a,b,[]) = false
	| influencedBy(a,b,xx) = contains(a, image(b,xx));

(*function returns intersection of two philosophers categories of thought*)
fun intersectionCategory(Philosopher(_,aa,_,_), Philosopher(_,bb,_,_)) =
	intersection(aa,bb);

(*function returns list of philosophers alive during a range of dates*)

fun wasAliveDuring(x,y) =
	if x >= y 
	then union(whoWasAlive(x), wasAliveDuring(x-1,y))
	else [];

(*function to find philosophers over a range of dates in a specific category*)
fun courseReadingList(a,b,c) = 
	let val aliveL = filter(f(x) => contains(x,wasAliveDuring(a,b)), philList)
	in
		filter(f(x) => contains(c, fetchList(x)), aliveL)
	end;

(*function to find the root influences of philosopher p, that informed p on category t*)
fun rootInfluence(p, t) = 
	let val tagged = filter( fn(x) => contains(t, fetchList(x)), influences(p));
		val xx = makeNoRepeats(flatlist(map(rootInfluence(t), tagged)))
	in 
		if xx = []
		then [p]
		else xx
	end;
