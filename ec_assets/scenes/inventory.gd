extends Node2D  

var sel_name = ""
var sel_desc = ""
var descontop = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$proton.unlocked = true
	$neutron.unlocked = true
	$electron.unlocked = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if sel_name == "idiot": sel_desc = ""
	elif $proton.selected == true:
		sel_name = "Proton"
		sel_desc = "The Hydrogen nucleus, but also the building block of other atomic nuclei."
	elif $neutron.selected == true:
		sel_name = "Neutron"
		sel_desc = "Like a proton, but with no electric charge. Adds mass to atoms, creating isotopes.\nHalf-life: 15 minutes"
	elif $electron.selected == true:
		sel_name = "Electron"
		sel_desc = "Zippy-zappy little thing. If a catto has unequal numbers of protons and electrons, they are ionized (charged) and are pulled towards ions with the opposite charge."
	elif $purrcent.selected == true:
		sel_name = "Purrcent"
		sel_desc = "Our lab cat. Make sure to keep him safe."
	elif $bungy.selected == true:
		sel_name = "Bungy"
		sel_desc = "???some kind of alien fellow???"
	elif $mu.selected == true:
		sel_name = "Muonium"
		sel_desc = "Hydrogen's little sibling. Extremely unstable.\nHalf-life: ~1 microsecond"
	elif $"up quark".selected == true:
		sel_name = "Up Quark"
		sel_desc = "Elementary particles found inside protons and neutrons.\nThese have a positive charge. Due to an effect called color confinement quarks cannot exist on their own for more than a miniscule fraction of a second."
	elif $"down quark".selected == true:
		sel_name = "Down Quark"
		sel_desc = "Elementary particles found inside protons and neutrons. These have a negative charge. Due to an effect called color confinement quarks cannot exist on their own for more than a miniscule fraction of a second."
	elif $neutrino.selected == true:
		sel_name = "Neutrino"
		sel_desc = "Very light leptons with no electric charge. They are usually created together with electrons or positrons in decaying atoms. Due to their extremely low mass, neutrinos almost never interact with other matter and are therefore hard to detect."
	elif $antineutrino.selected == true:
		sel_name = "Anti-Neutrino"
		sel_desc = "The antimatter counterpart to neutrinos. Like neutrinos, they have no charge. If an antineutrino meets a neutrino, they will both become photons."
	elif $positron.selected == true:
		sel_name = "Positron"
		sel_desc = "The antimatter counterpart to electrons. Like all antimatter, they are mostly created by decaying atoms. Free positrons will scatter photons (change their direction). If a positron meets an electron, they will both become photons."
	elif $compound_catto.selected == true:
		sel_name = "Water"
		sel_desc = "She solos."
	elif $h.selected == true:
		sel_name = "Hydrogen"
		sel_desc = "Grandmother of all elements. Readily bonds with many others, but tends to leave the party when a metal comes in. Usually peaceful, but has an explosive side."
	elif $he.selected == true:
		sel_name = "Helium"
		sel_desc = "The first and lightest noble gas. Sleepy and sunny little guy. Shortest of all element cattos.\nHas an electronless alter ego known as Alpha Radiation."
	elif $li.selected == true:
		sel_name = "Lithium"
		sel_desc = "Lightest alkali metal. Pretty jumpy and prone to mood swings. Good therapist."
	elif $be.selected == true:
		sel_name = "Beryllium"
		sel_desc = "Lightest alkaline earth metal. Gemstone collector."
	elif $b.selected == true:
		sel_name = "Boron"
		sel_desc = "Relatively strong metal, often eager to help others."
	elif $c.selected == true:
		sel_name = "Carbon"
		sel_desc = "Silly and outgoing metalloid full of life. Besties with Hydrogen, Nitrogen and Oxygen. Also Iron and Silicon. And... Well this guy just loves everybody!"
	elif $n.selected == true:
		sel_name = "Nitrogen"
		sel_desc = "Oxygen's friend who loves gardening and ice cream. Often attempts to prevent any mischief by Oxygen, which doesn't always end well."
	elif $o.selected == true:
		sel_name = "Oxygen"
		sel_desc = "Notorious pyromaniac, but also cherished by living things."
	elif $f.selected == true:
		sel_name = "Fluorine"
		sel_desc = "The lightest halogen, a yellowish gas. Competent dentist despite her gremlin-like nature."
	elif $ne.selected == true:
		sel_name = "Neon"
		sel_desc = "Second-lightest noble gas, the only one lighter than air other than Helium. Shiny girl."
	elif $na.selected == true:
		sel_name = "Sodium"
		sel_desc = "Second-lightest alkali. Besties with Chlorine, though their relationship is pretty salty. One of the animal-loving elements."
	elif $mg.selected == true:
		sel_name = "Magnesium"
		sel_desc = "Second-lightest alkaline earth. Firmly believes apples are better than oranges."
	elif $al.selected == true:
		sel_name = "Aluminium"
		sel_desc = "Metalloid who hardly lets go of his comedically large spoon. Secretly a conspiracy theorist."
	elif $si.selected == true:
		sel_name = "Silicon"
		sel_desc = "Programmer and generally loves electronics. Good friends with Carbon and Oxygen; like the former, he is quite silly and friendly."
	elif $p.selected == true:
		sel_name = "Phosphorus"
		sel_desc = "One of the lesser-known members of Team SPONCH along with Sulfur. Wears a hat to protect himself from sunlight, which turns him red (with no other negative effects, really - he just doesn't like being red)."
	elif $s.selected == true:
		sel_name = "Sulfur"
		sel_desc = "Friendly like her upstairs neighbour, but slightly more chaotic. Subject to rumours about her bad smell, but doesn't really mind it - all she wants is to be long."
	elif $cl.selected == true:
		sel_name = "Chlorine"
		sel_desc = "𝒮𝑜𝒹𝒾𝓊𝓂'𝓈 𝑔𝒶𝓈𝑒𝑜𝓊𝓈 𝒶𝒸𝓆𝓊𝒶𝒾𝓃𝓉𝒶𝓃𝒸𝑒."
	elif $ar.selected == true:
		sel_name = "Argon"
		sel_desc = "Most Greek of the nobles."
	elif $k.selected == true:
		sel_name = "Potassium"
		sel_desc = "An alkali who loves bananas, potatoes, pomegranates and other funny foods."
	elif $ca.selected == true:
		sel_name = "Calcium"
		sel_desc = "Spooky scary skeleton who loves milk."
	elif $sc.selected == true:
		sel_name = "Scandium"
		sel_desc = "Lightbulb boi. A bit of an airhead."
	elif $ti.selected == true:
		sel_name = "Titanium"
		sel_desc = "𝚃𝚁𝙰𝙽𝚂𝙸𝚃𝙸𝙾𝙽 𝙼𝙴𝚃𝙰𝙻 𝙺𝙽𝙾𝚆𝙽 𝙵𝙾𝚁 𝙸𝚃𝚂 𝙴𝚇𝙲𝙴𝙿𝚃𝙸𝙾𝙽𝙰𝙻 𝙳𝚄𝚁𝙰𝙱𝙸𝙻𝙸𝚃𝚈."
	elif $v.selected == true:
		sel_name = "Vanadium"
		sel_desc = "Metallic hype-man."
	elif $cr.selected == true:
		sel_name = "Chromium"
		sel_desc = "Shiny girl (metal!). Friends with Oxygen and Gadolinium."
	elif $mn.selected == true:
		sel_name = "Manganese"
		sel_desc = "Catto of few words."
	elif $fe.selected == true:
		sel_name = "Iron"
		sel_desc = "Deathly afraid of water. Manages the Purriodic Table hotel."
	elif $co.selected == true:
		sel_name = "Cobalt"
		sel_desc = "Usually very shy, but quite a silly goblin once out of his shell. Likes pottery, DnD, Samarium, and assembling batteries with Lithium."
	elif $ni.selected == true:
		sel_name = "Nickel"
		sel_desc = "Thinks about money most of the time."
	elif $cu.selected == true:
		sel_name = "Copper"
		sel_desc = "Nicknamed Lady Liberty for reasons unclear to her. Friends with Silver, Nickel, Gold and other ''coin'' metals."
	elif $zn.selected == true:
		sel_name = "Zinc"
		sel_desc = "Iron's bestie, stands up for him whenever he can."
	elif $ga.selected == true:
		sel_name = "Gallium"
		sel_desc = "Asterix's droopiest fan."
	elif $ge.selected == true:
		sel_name = "Germanium"
		sel_desc = "''Ich war im ersten Spitzentransistor!''"
	elif $as.selected == true:
		sel_name = "Arsenic"
		sel_desc = "Toxic metalloid, lives up to the first four letters of his name. Nobody likes him, except maybe his sisters... as a prank target."
	elif $se.selected == true:
		sel_name = "Selenium"
		sel_desc = "Colourful nonmetal, enamored with the Moon."
	elif $br.selected == true:
		sel_name = "Bromine"
		sel_desc = "Mercury's bestie, a very mischievous liquid. Most notorious for his Horrid Miasma."
	elif $kr.selected == true:
		sel_name = "Krypton"
		sel_desc = "Noble gas. Never explodes, despite the name."
	elif $rb.selected == true:
		sel_name = "Rubidium"
		sel_desc = "Heavy alkali metal, dangerously obsessed with pyrotecnics."
	elif $sr.selected == true:
		sel_name = "Strontium"
		sel_desc = "Pretty abrasive alkaline earth metal."
	elif $y.selected == true:
		sel_name = "Yttrium"
		sel_desc = "Part of Team Ytterby, four elements found in and named after said Swedish village."
	elif $zr.selected == true:
		sel_name = "Zirconium"
		sel_desc = "Heavily crystallized catto; became such after getting sand in xeir eye once."
	elif $nb.selected == true:
		sel_name = "Niobium"
		sel_desc = "Tantalum's upstairs neighbour."
	elif $mo.selected == true:
		sel_name = "Molybdenum"
		sel_desc = "''Gifted boy''. He likes cauliflowers!"
	elif $tc.selected == true:
		sel_name = "Technetium"
		sel_desc = "AKA Tech. Unique transition metal with no stable isotopes. Besties with Rhenium, considers him her brother. Not a hat.\nHalf-life: 211,000 years"
	elif $ru.selected == true:
		sel_name = "Ruthenium"
		sel_desc = "AKA Ruth, named after Russia, kind of. If you shake her too much her hat will fall off."
	elif $rh.selected == true:
		sel_name = "Rhodium"
		sel_desc = "Palladium's spouse. Big fan of catalytic converters."
	elif $pd.selected == true:
		sel_name = "Palladium"
		sel_desc = "Rhodium's wife, named after the asteroid Pallas."
	elif $ag.selected == true:
		sel_name = "Silver"
		sel_desc = "Shiny fan of jewelry and tableware. Best friends with Gold."
	elif $cd.selected == true:
		sel_name = "Cadmium"
		sel_desc = "Avid painter. Her eyes are little screens!"
	elif $in.selected == true:
		sel_name = "Indium"
		sel_desc = "Soft, clay-like metal.\nHalf-life: 441 trillion years"
	elif $sn.selected == true:
		sel_name = "Tin"
		sel_desc = "Although he's pretty soft, it usually takes a lot to break him; however he shows a more fragile side in cold environments."
	elif $sb.selected == true:
		sel_name = "Antimony"
		sel_desc = ""
	elif $te.selected == true:
		sel_name = "Tellurium"
		sel_desc = "\nHalf-life: 791 quintillion years"
	elif $i.selected == true:
		sel_name = "Iodine"
		sel_desc = "The medical halogen. If you're hurt, they got you!"
	elif $xe.selected == true:
		sel_name = "Xenon"
		sel_desc = "Watches movies in xer rare waking hours."
	elif $cs.selected == true:
		sel_name = "Caesium"
		sel_desc = "The tallest element catto. Nicknamed ''Grandpa Clock'' (and hates it). Loses his temper if you as much as call him ''Cesium''."
	elif $ba.selected == true:
		sel_name = "Barium"
		sel_desc = ""
	elif $la.selected == true:
		sel_name = "Lanthanum"
		sel_desc = "The first lanthanoid."
	elif $ce.selected == true:
		sel_name = "Cerium"
		sel_desc = "Named after the dwarf planet Ceres."
	elif $pr.selected == true:
		sel_name = "Praseodymium"
		sel_desc = "Huge fan of Hatsune Miku."
	elif $nd.selected == true:
		sel_name = "Neodymium"
		sel_desc = "Finds Iron, Cobalt and Nickel very attractive."
	elif $pm.selected == true:
		sel_name = "Promethium"
		sel_desc = "\nHalf-life: 2.6 years"
	elif $sm.selected == true:
		sel_name = "Samarium"
		sel_desc = "Lanthanide who likes music and Cobalt."
	elif $eu.selected == true:
		sel_name = "Europium"
		sel_desc = ""
	elif $gd.selected == true:
		sel_name = "Gadolinium"
		sel_desc = "MRI monitor catto. Eagerly assists doctors in their work."
	elif $tb.selected == true:
		sel_name = "Terbium"
		sel_desc = "Part of Team Ytterby, four elements found in and named after said Swedish village."
	elif $dy.selected == true:
		sel_name = "Dysprosium"
		sel_desc = "This lanthanide loves to play hide-and-seek."
	elif $ho.selected == true:
		sel_name = "Holmium"
		sel_desc = "Quantum computer enthusiast (she even attached one to her eye!)"
	elif $er.selected == true:
		sel_name = "Erbium"
		sel_desc = "Part of Team Ytterby, four elements found in and named after said Swedish village."
	elif $tm.selected == true:
		sel_name = "Thulium"
		sel_desc = ""
	elif $yb.selected == true:
		sel_name = "Ytterbium"
		sel_desc = "Part of Team Ytterby, four elements found in and named after said Swedish village."
	elif $lu.selected == true:
		sel_name = "Lutetium"
		sel_desc = "Dedicates herself to telling the time as precisely as possible."
	elif $hf.selected == true:
		sel_name = "Hafnium"
		sel_desc = "Zirconium's downstairs neighbour. The two used to look much more similar. Went to the Moon, but doesn't bring it up a lot."
	elif $ta.selected == true:
		sel_name = "Tantalum"
		sel_desc = "Skilled mechanic."
	elif $w.selected == true:
		sel_name = "Tungsten"
		sel_desc = "AKA Wolfram. Very dense and heavy."
	elif $re.selected == true:
		sel_name = "Rhenium"
		sel_desc = "Tech's bestie, considers her his sister.\nHalf-life: 41.6 billion years"
	elif $os.selected == true:
		sel_name = "Osmium"
		sel_desc = "Densest element known (but still tries his best). Writer."
	elif $ir.selected == true:
		sel_name = "Iridium"
		sel_desc = "Very extraterrestrial metal. Hobbies include riding meteors and being extremely verbose."
	elif $pt.selected == true:
		sel_name = "Platinum"
		sel_desc = "Osmium's wife. Quite bright and knowledgeable about lots of things."
	elif $au.selected == true:
		sel_name = "Gold"
		sel_desc = "Posh and royal transition metal. Remarkably yellow due to the size of her atoms (she thinks that's an insult)."
	elif $hg.selected == true:
		sel_name = "Mercury"
		sel_desc = "Toxic, aggressive liquid metal."
	elif $tl.selected == true:
		sel_name = "Thallium"
		sel_desc = "Mercury and Lead's neighbour, inbetween them in terms of danger. Shares Lead's distaste for humans."
	elif $pb.selected == true:
		sel_name = "Lead"
		sel_desc = "Metal who wishes she had more character like the other metals. Doesn't like humans, tends to bite."
	elif $bi.selected == true:
		sel_name = "Bismuth"
		sel_desc = "Colourful, veeeeeeeeeeeeeeeeeeeeeeeeeeery slightly radioactive metal. Besties with Oxygen since she owes his colours to her.\nHalf-life: 20.1 quintillion years"
	elif $po.selected == true:
		sel_name = "Polonium"
		sel_desc = "Named after Poland. Radium's old friend, since they were both discovered by Marie Curie.\nHalf-life: 138 days"
	elif $at.selected == true:
		sel_name = "Astatine"
		sel_desc = "Extremely elusive, mysterious element. Keep your eye on them.\nHalf-life: 56 seconds"
	elif $rn.selected == true:
		sel_name = "Radon"
		sel_desc = "A rather chaotic noble gas, likes breaking and entering and has a history of questionable medical practices.\nHalf-life: 3.8 days"
	elif $fr.selected == true:
		sel_name = "Francium"
		sel_desc = "Named after France. Pretty irritable alkali metal.\nHalf-life: 4.8 minutes"
	elif $ra.selected == true:
		sel_name = "Radium"
		sel_desc = "Helped Marie Curie win the Nobel Prize. Got their hairstyle from her too!\nHalf-life: 1599 years"
	elif $ac.selected == true:
		sel_name = "Actinium"
		sel_desc = "The first actinoid.\nHalf-life: 21.8 years"
	elif $th.selected == true:
		sel_name = "Thorium"
		sel_desc = "\nHalf-life: 14 billion years"
	elif $pa.selected == true:
		sel_name = "Protactinium"
		sel_desc = "A work-in-progress of Actinium (their eventual decay product).\nHalf-life: 36250 years"
	elif $u.selected == true:
		sel_name = "Uranium"
		sel_desc = "Named after the planet Uranus. Likes baking yellow cakes, offers them at every other dinner.\nHalf-life: 4.5 billion years"
	elif $np.selected == true:
		sel_name = "Neptunium"
		sel_desc = "Named after the planet Neptune.\nHalf-life: 2.1 million years"
	elif $pu.selected == true:
		sel_name = "Plutonium"
		sel_desc = "Named after the dwarf planet Pluto.\nHalf-life: 81.3 million years"
	elif $am.selected == true:
		sel_name = "Americium"
		sel_desc = "Lightest man-made element, named after the United States of America.\nHalf-life: 7350 years"
	elif $cm.selected == true:
		sel_name = "Curium"
		sel_desc = "Named after Marie Curie. No real relation to Radium.\nHalf-life: 15.6 million years"
	elif $bk.selected == true:
		sel_name = "Berkelium"
		sel_desc = "Named after the city and university of Berkeley. Programmer and Tennessine's dad (his atoms were used to create her).\nHalf-life: 1380 years"
	elif $cf.selected == true:
		sel_name = "Californium"
		sel_desc = "Named after the US state of California.\nHalf-life: 898 years"
	elif $es.selected == true:
		sel_name = "Einsteinium"
		sel_desc = "Named after Albert Einstein.\nHalf-life: 472 days"
	elif $fm.selected == true:
		sel_name = "Fermium"
		sel_desc = "Named after Enrico Fermi, known for the paradox.\nHalf-life: 100.5 days"
	elif $md.selected == true:
		sel_name = "Mendelevium"
		sel_desc = "Named after Dmitri Mendeleev, known for arranging the elements the way they are.\nHalf-life: 51.6 days"
	elif $no.selected == true:
		sel_name = "Nobelium"
		sel_desc = "Named after Alfred Nobel, known for the prize and for inventing dynamite.\nHalf-life: 58 minutes"
	elif $lr.selected == true:
		sel_name = "Lawrencium"
		sel_desc = "Named after Ernest Lawrence, the inventor of the cyclotron.\nHalf-life: 11 hours"
	elif $rf.selected == true:
		sel_name = "Rutherfordium"
		sel_desc = "Named after Ernest Rutherford. Avid golfer.\nHalf-life: 48 minutes"
	elif $db.selected == true:
		sel_name = "Dubnium"
		sel_desc = "Named after the Russian city of Dubna.\nHalf-life: 16 hours"
	elif $sg.selected == true:
		sel_name = "Seaborgium"
		sel_desc = "Named after Glenn Seaborg.\nHalf-life: 9.8 minutes"
	elif $bh.selected == true:
		sel_name = "Bohrium"
		sel_desc = "Named after Niels Bohr, known for his model of the atom.\nHalf-life: 2.4 minutes"
	elif $hs.selected == true:
		sel_name = "Hassium"
		sel_desc = "Named after the German state of Hesse, where Darmstadt is.\nHalf-life: 130 seconds"
	elif $mt.selected == true:
		sel_name = "Meitnerium"
		sel_desc = "Named after Lise Meitner.\nHalf-life: 4 seconds"
	elif $ds.selected == true:
		sel_name = "Darmstadtium"
		sel_desc = "Named after the German city of Darmstadt.\nHalf-life: 14 seconds"
	elif $rg.selected == true:
		sel_name = "Roentgenium"
		sel_desc = "Named after Wilhelm Röntgen (Roentgen).\nHalf-life: 130 seconds"
	elif $cn.selected == true:
		sel_name = "Copernicium"
		sel_desc = "Named after Nicolaus Copernicus.\nHalf-life: 30 seconds"
	elif $nh.selected == true:
		sel_name = "Nihonium"
		sel_desc = "Named after Japan.\nHalf-life: 9.5 seconds"
	elif $fl.selected == true:
		sel_name = "Flerovium"
		sel_desc = "Named after Georgy Flyorov.\nHalf-life: 2.1 seconds"
	elif $mc.selected == true:
		sel_name = "Moscovium"
		sel_desc = "Named after the Russian city of Moscow.\nHalf-life: 650 milliseconds"
	elif $lv.selected == true:
		sel_name = "Livermorium"
		sel_desc = "Named after the Lawrence Livermore National Lab (LLNL).\nHalf-life: 80 milliseconds"
	elif $ts.selected == true:
		sel_name = "Tennessine"
		sel_desc = "Named after the US state of Tennessee. Currently the youngest element, created by humans in 2009-2010.\nHalf-life: 51 milliseconds"
	elif $og.selected == true:
		sel_name = "Oganesson"
		sel_desc = "The heaviest known ''noble gas'' and element overall. Incredibly unstable.\nHalf-life: 700 microseconds"
	else:
		sel_name = ""
		sel_desc = ""
	
	$desc/name.text = sel_name
	$desc/text.text = sel_desc
	$desc.visible = sel_name != ""
	
	if descontop == true: $desc/bg.position.y = -233
	else: $desc/bg.position.y = 233
	$desc/bg.flip_v = descontop
	$desc/name.position.y = $desc/bg.position.y-57
	$desc/text.position.y = $desc/bg.position.y-9
