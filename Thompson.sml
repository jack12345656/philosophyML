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
datatype philosopher = Philosopher of name * category list * (int, int, char) *
name list * boolean;

val Thales = Philosopher(Thales, [Metaphysics, Cosmology], (620,546,b),[Xenophanes, Heraclitus, Democritus]);

val Xenophanes = Philosopher(Xenophanes, [Metaphysics, Cosmology], (620,546,b),[Xenophanes, Heraclitus, Democritus]);


(*Insert Year, get list of philosophers who were alive*)
fun whoWasAlive(int) = [];

(*fun inSameSchoolOfThought(philosopher,philosopher, school of thought) return
* boolean*)

(* hasBeard(philosopher) return boolean (beard) *)

