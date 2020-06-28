prologues := 3;
outputtemplate := "card%c.mps";
input roundrect;

u := 1cm;
spoke_length := 2u;
spoke_angle := 0.4;

color bleu;
bleu := (0, 0, 0.5);

color rouge;
rouge := (1, 0, 0);

def drawlabel(expr num, theta) =
	if num = 9:
		transform T;
		if (theta mod 180) = 0:
			T := identity xscaled 0.26 spoke_length yscaled 0.17 spoke_length;
		else:
			T := identity yscaled 0.26 spoke_length xscaled 0.17 spoke_length;
		fi;
		fill fullcircle transformed T shifted (dir(theta) scaled 0.875 spoke_length) withcolor rouge;
	fi;
	label (decimal(num) infont defaultfont scaled 3.5 rotated (theta-90), dir(theta) scaled 0.8 spoke_length);
enddef;

def card(expr fig, a, b, c, d) = 
beginfig(fig);
	rrbordercolor(bleu);
	rrinnercolor := bleu;
	roundrect(5u, 5u)(back);
	draw back;
	fill fullcircle scaled 4.5u withcolor (1, 1, 0);
	
	for i = 0 upto 3:
		pair P; pair Q; pair R;
		P := dir(25 + 90 * i) scaled spoke_length;
		R := dir(65 + 90 * i) scaled spoke_length;
		Q = P + whatever * dir(90 + i * 90);
		Q = R + whatever * dir(180 + i * 90);
		fill (0, 0)--P--Q--R--cycle withcolor rouge;

		for j = 1 upto 4:

			pair A; pair B;
			A = whatever * dir(25 + 90 * i + 4 * j - spoke_angle);
			A = whatever[P, Q];

			B = whatever * dir(25 + 90 * i + 4 * j + spoke_angle);
			B = whatever[P, Q];

			fill (0, 0)--A--B--cycle withcolor white;

		endfor;

		pair A; pair B;
		A = whatever * dir(45 + 90 * i - spoke_angle);
		A = whatever[P, Q]; 

		B = whatever * dir(45 + 90 * i + spoke_angle);
		B = whatever[Q, R];

		fill (0, 0)--A--Q--B--cycle withcolor white;

		for j = 1 upto 4:

			pair A; pair B;
			A = whatever * dir(65 + 90 * i - 4 * j - spoke_angle);
			A = whatever[Q, R];

			B = whatever * dir(65 + 90 * i - 4 * j + spoke_angle);
			B = whatever[Q, R];

			fill (0, 0)--A--B--cycle withcolor white;

		endfor;

		for j = 0 upto 4:
			fill fullcircle scaled 0.18u shifted ((1.8u - 0.22u * j, 2.3u) rotated (90 * i)) withcolor rouge;
		endfor;
	endfor;

	fill unitsquare scaled 1u shifted (-0.5u, -0.5u) withcolor white;
	draw unitsquare scaled 1u shifted (-0.5u, -0.5u) withcolor rouge withpen pencircle;

	drawlabel(a, 0);
	drawlabel(b, 90);
	drawlabel(c, 180);
	drawlabel(d, 270);

endfig;	
enddef;

card(1, 1, 1, 1, 1)
card(2, 1, 1, 1, 2)
card(3, 1, 1, 1, 3)
card(4, 1, 1, 1, 4)
card(5, 1, 1, 1, 5)
card(6, 1, 1, 1, 6)
card(7, 1, 1, 1, 7)
card(8, 1, 1, 1, 9)
card(9, 1, 1, 2, 2)
card(10, 1, 1, 2, 3)
card(11, 1, 1, 2, 4)
card(12, 1, 1, 2, 5)
card(13, 1, 1, 3, 3)
card(14, 1, 1, 5, 9)
card(15, 1, 1, 6, 7)
card(16, 1, 1, 7, 7)
card(17, 1, 1, 7, 8)
card(18, 1, 1, 7, 9)
card(19, 1, 1, 8, 9)
card(20, 1, 1, 9, 9)
card(21, 1, 2, 2, 2)
card(22, 1, 2, 2, 3)
card(23, 1, 2, 9, 9)
card(24, 1, 3, 5, 5)
card(25, 1, 4, 9, 9)
card(26, 1, 5, 5, 7)
card(27, 1, 5, 5, 8)
card(28, 1, 5, 7, 7)
card(29, 1, 6, 6, 7)
card(30, 1, 6, 7, 7)
card(31, 1, 6, 7, 8)
card(32, 1, 7, 7, 7)
card(33, 1, 7, 7, 8)
card(34, 1, 8, 9, 9)
card(35, 1, 9, 9, 9)
card(36, 2, 2, 2, 2)
card(37, 2, 2, 2, 6)
card(38, 2, 2, 7, 9)
card(39, 2, 2, 9, 9)
card(40, 2, 3, 3, 4)
card(41, 2, 5, 5, 5)
card(42, 2, 5, 5, 6)
card(43, 2, 5, 9, 9)
card(44, 2, 6, 7, 7)
card(45, 2, 7, 7, 7)
card(46, 2, 7, 7, 9)
card(47, 2, 7, 9, 9)
card(48, 2, 9, 9, 9)
card(49, 3, 3, 5, 8)
card(50, 3, 4, 6, 7)
card(51, 3, 4, 8, 8)
card(52, 3, 5, 5, 5)
card(53, 3, 5, 7, 7)
card(54, 4, 4, 5, 9)
card(55, 4, 4, 6, 6)
card(56, 4, 4, 6, 7)
card(57, 4, 4, 9, 9)
card(58, 4, 7, 7, 9)
card(59, 4, 9, 9, 9)
card(60, 5, 5, 5, 7)
card(61, 5, 5, 5, 8)
card(62, 5, 5, 6, 9)
card(63, 5, 5, 7, 9)
card(64, 5, 7, 7, 7)
card(65, 5, 7, 7, 8)
card(66, 5, 7, 9, 9)
card(67, 5, 8, 9, 9)
card(68, 5, 9, 9, 9)
card(69, 6, 6, 6, 7)
card(70, 6, 6, 7, 7)
card(71, 6, 6, 7, 8)
card(72, 6, 6, 9, 9)
card(73, 6, 7, 7, 7)
card(74, 6, 7, 7, 8)
card(75, 6, 7, 7, 9)
card(76, 6, 7, 8, 8)
card(77, 6, 9, 9, 9)
card(78, 7, 7, 7, 7)
card(79, 7, 7, 7, 8)
card(80, 7, 7, 7, 9)
card(81, 7, 7, 8, 8)
card(82, 7, 7, 8, 9)
card(83, 7, 7, 9, 9)
card(84, 7, 8, 8, 8)
card(85, 7, 8, 9, 9)
card(86, 7, 9, 9, 9)
card(87, 8, 8, 8, 8)
card(88, 8, 8, 8, 9)
card(89, 8, 8, 9, 9)
card(90, 8, 9, 9, 9)
card(91, 9, 9, 9, 9)

end;
