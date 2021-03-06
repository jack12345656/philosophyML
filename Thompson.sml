(*So this is the file for our new Project, this line will not affect any `code 
because I am using block comments. Any after the parenthesis you can write the
code. To runTo put the file in sml. Put the file in the place where you run ml 
for me I had to put the file in the bin folder then run ./sml). Once in ml use the 
command: use "filename.sml"; Use ml to test, make changes in the file. *)
fun contains(x, []) = false
    | contains(x, y::rest) = x = y orelse contains(x, rest);

fun intersection([],bb) = [] | intersection(a::rest,bb) = if contains(a, bb) then a::intersection(rest, bb) else intersection(rest,bb);

fun filter(f, []) = []
  | filter(f, a::rest) = if f(a) then a::filter(f, rest) else filter(f, rest);


(*Philosopher that would get lifespan, name, list of schools of thought, list of known relationships, and location. *)

datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius ;

(*School of thoughts *)

datatype category = Ontology | Metaphysics | Cosmology | Rhetoric | Epistemology | Astronomy | Logic | Theology | Ethics | Mathematics | Politics; 

(*Philospher has a name * school of thought * (birth, death, b or a) * 
* list of names of other philosophers * boolean of whether they have beard or
* name *)

datatype philosopher = Philosopher of name * category list * (int * int) *
bool;


val thales = Philosopher(Thales, [Metaphysics, Ethics, Mathematics, Astronomy],
(620,546), true);
val xenophanes = Philosopher(Xenophanes, [Epistemology, Cosmology, Theology],
(570,475), true);
val pythagoras = Philosopher(Pythagoras, [Metaphysics, Cosmology, Mathematics,
Politics, Ethics], (570,495), true);
val heraclitus = Philosopher(Heraclitus, [Epistemology, Cosmology, Theology],
(535,475),true);
val parmenides = Philosopher(Parmenides, [Ontology, Metaphysics], (515,450),true);
val zeno = Philosopher(Zeno, [Ontology, Metaphysics], (490,430),true);
val democritus = Philosopher(Democritus, [Metaphysics, Mathematics, Astronomy],
(460,370),true);
val empedocles = Philosopher(Empedocles, [Epistemology, Cosmology, Ontology],
(490,430),true);
val protagoras = Philosopher(Protagoras, [Rhetoric, Ethics], (490,420),true);
val gorgias = Philosopher(Gorgias, [Epistemology, Rhetoric, Ethics],
(485,380),true);
val socrates = Philosopher(Socrates, [Epistemology, Ethics], (470,399),true);
val plato = Philosopher(Plato, [Rhetoric, Ethics, Politics], (428,348),true);
val aristotle = Philosopher(Aristotle, [Epistemology, Ethics, Metaphysics,
Logic, Politics], (484,322),true);
val lucretius = Philosopher(Lucretius, [Ethics, Metaphysics], (99,44),true);

val allPhilosopher = [thales, xenophanes, heraclitus, parmenides, zeno, democritus, empedocles, protagoras, gorgias, socrates, plato, aristotle, lucretius];
(*____________________________________________________________________*)
(*Insert Year, get list of philosophers who were alive*)
fun whoWasAlive(year) =
  let fun helper([]) = []
    | helper((p as Philosopher(_,_,(born,died),_))::rest) = if born >= year
    andalso year >= died then p::helper(rest) else helper(rest);
  in
    helper(allPhilosopher)
  end;
(*_____________________________________________________________________*)
(* hasBeard(philosopher) return boolean (beard) *)
fun hasBeard(p as Philosopher(_,_,_,beard)) = if beard = true then true else
  false;

(*____________________________________________________________________*)
(*Takes a list of topics, gives out list of philophers*)
fun hasCategories(cc) =
let fun testPhil(Philosopher(_,dd,_,_)) = intersection(cc,dd) <> [];
in
  filter(testPhil, allPhilosopher)
end;
