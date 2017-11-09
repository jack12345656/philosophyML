(*So this is the file for our new Project, this line will not affect any code 
because I am using block comments. Any after the parenthesis you can write the
code. To runTo put the file in sml. Put the file in the place where you run ml 
for me I had to put the file in the bin folder then run ./sml). Once in ml use the 
command: use "filename.sml"; Use ml to test, make changes in the file. *)

(*Philosopher that would get lifespan, name, list of schools of thought, list of known relationships, and location. *)

(*School of thoughts *)
datatype category = Metaphysics | Cosmology | Epistimology | Theology; 

(*These are the names of the philosophers *)
datatype name = Thales | Xenophanes | Pythagoras | Heraclitus | Parmenides | Zeno | Democritus | Empedocles | Protagoras | Gorgias | Socrates | Plato | Aristotle | Lucretius | SextusEmpericus;

(*Philospher has a name * school of thought * (birth, death, b or a) * 
* list of names of other philosophers * boolean of whether they have beard or
* name *)
datatype philosopher = Philosopher of name * category list * (int, int, char) * name list * boolean;

val Xenophanes = Philosopher(Xenophanes, [Epistemology, Cosmology, Theology], (570,475,b));
val Thales = Philosopher(Thales, [Metaphysics, Ethics, Mathematics, Astronomy], (620,546,b));
val Pythagoras = Philosopher(Pythagoras, [Metaphysics, Cosmology, Mathematics, Politics, Ethics], (570,495,b));
val Heraclitus = Philosopher(Heraclitus, [Epistemology, Cosmology, Theology], (535,475,b));
val Parmenides = Philosopher(Parminedes, [Ontology, Metaphysics], (515,450,b));
val Zeno = Philosopher(Zeno, [Ontology, Metaphysics], (490,430,b));
val Democritus = Philosopher(Democritus, [Metaphysics, Mathematics, Astronomy], (460,370,b));
val Empedocles = Philosopher(Empedocles, [Epistemology, Cosmology, Ontology], (490,430,b));

val Protagoras = Philosopher(Protagoras, [Rhetoric, Ethics], (490,420,b));
val Gorgias = Philosopher(Gorgias, [Epistemology, Rhetoric, Ethics], (485,380,b));
val Socrates = Philosopher(Socrates, [Epistemology, Ethics], (470,399,b));
val Plato = Philosopher(Plato, [Rhetoric, Ethics, Politics], (428,348,b));
val Aristotle = Philosopher(Aristotle, [Epistemology, Ethics, Metaphysics, Logic, Politics], (484,322,b));
val Lucretius = Philosopher(Lucretius, [Ethics, Metaphysics], (99,44,b));
(*Insert Year, get list of philosophers who were alive*)
fun whoWasAlive(int) = [];

(*fun inSameSchoolOfThought(philosopher,philosopher, school of thought) return
* boolean*)

(* hasBeard(philosopher) return boolean (beard) *)

