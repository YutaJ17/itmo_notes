#set text(lang: "ru")
#set text(lang: "ru", font: "Liberation Serif", size: 14pt)
#import "theme.typ": term, def, th, proof, ex, eqlong, ash, ach, nota, mem, letsym, sh, ch

#import "@preview/cetz:0.3.1"
#import "@preview/fletcher:0.5.7": diagram, node, edge
#set outline.entry(fill: repeat([.]))

#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true) 
  strong(it)         
}

#outline()
#pagebreak() 



= Интегрирование ФНП
== Кратные интегралы
=== 1. Двойной интеграл
==== 1.1 Определение
\
#nota[
 Будем рассматривать часть плоскости $D$, ограниченную замкнутой простой (без самопересечений) кривой $gamma$. 
]
#image("images/im1.png", width: 50%)

Будем следовать плану определения $integral_a^b f(x) dif x$.
#mem[
  
#def(title: "Определенный интеграл функции одной переменной")[
  Дано: $f(x):[a; b] ->RR, a < b$.
  1. Дробление отрезка $[a,b]$ на участки $[x_(i-1); x_i]$, \ $a = x_0 < x_1 < ... < x_n = b$. \ Длина малого (элементарного) участка: $|x_i - x_(i-1)|$, но будем рассматривать $triangle x_i = x_i - x_(i-1) - 1$.
  
  2. Выбор средней точки $xi_i in [x_(i-1), x_(i)]$ и вычисление элементарной площади: $f(xi_i) triangle x_i$.
  3. Составление интегральной суммы $sigma_n = sum_(i=1)^n f(xi_i) triangle x_i$.
  4. Предельный переход: $max triangle x_i eqlong(top: "об.") tau -> 0, space n->infinity$, $tau$ - ранг дробления. 

  Предел интегральных сумм $lim_(n->infinity, tau->0) sigma_n$, если он:
  - существует
  - конечен
  - не зависит от дробления и выбора средней точки,
  называется #term[определенным интегралом] от $f(x)$ на отрезке $[a; b]$. 

  $lim_(n->infinity, tau->0) sigma_n = lim_(n->infinity) sum_(i=1)^n f(xi_i) triangle x_i eqlong(top: "об.") integral_(a)^b f(x) dif x$
]
]

#def(title:"Определенный интеграл функции нескольких переменных")[
  $f(x,y): overline(D) subset RR^2 -> RR$
  1. Дробление $overline(D)$ на элементарные площадки (произвольной формы) $Delta S_i$ (площадь).

#image("images/im2_1.png", width: 40%)

  2. Выбор средних точек $M_i (xi_i, eta_i)$ в каждом $Delta S_i$.
  #image("images/im3.png",width: 50%)
\ \
  3. Интегральная сумма
  $ nu_n = sum_(i=1)^n f(xi_i, eta_i) Delta S_i $
  #image("images/im4.png",width: 50%)
  4. Предельный переход: $tau = max S_i->0, n->oo:$
  $ limits(integral.double)_D f(x,y) dif S eqlong(top:"def") lim_(mat(delim: #none,n->oo; tau->0)) sum_(i=1)^n f(xi_i, eta_i) Delta S_i, space "если предел существует," $
  $ "конечен и не зависит от выбора средних точек." $
  
#grid(
  columns: (1fr, 1fr), 
  
  image("images/im5.png",width: 100%),
  image("images/im6.png",width: 100%)
)
]

#pagebreak()

#nota[
  В обозначении двойного интеграла $dif S$, по определению, означает элемент области $D$ и может быть произвольной формы. Но часто область $D$ квадрируют: разрезают на прямоугольники со сторонами $dif x$ и $dif y$ координатными прямыми $x=c, y=c$. Тогда, пишут:
  $ limits(integral.double)_D f(x,y) dif x dif y,  $
  $ dif S = dif x dot dif y "(площадь прямоугольника)" $
]

#nota[
  Если $f(x,y)=1$, то $limits(integral.double)_D f(x,y) dif x dif y = S_D, $ так как объем численно совпадает с площадью основания.
]
#ex[
  Найти площадь между кривыми:
  $ cases(y=1+x^2,y=2x^2) $
  #image("images/im7.png", width: 80%)
  Решим задачу с помощью двойного интеграла (обоснование см. ниже):
  $ S_D = limits(integral.double)_D 1 dot dif x dif y = integral_(-1)^1 dif x integral_(2x^2)^(1+x^2) 1 dot dif y = $
  $ = integral_(-1)^1 dif x dot (1+x^2 -2x^2) = lr((-1/3 x^3 + x)|)_(-1)^1 = 4/3 $
]


==== 1.2. Вычисление двойного интеграла

#nota[
  Вычисление $integral_(a)^b f(x) dif x$ (там, где это возможно) велось по формуле N-L. С двойным интегралом поступим также. Для решения задачи в простейшем случае потребуем дополнительного свойства от области $D$: #term[правильности в координатном направлении].
]

#def(title: "Правильность в направлении Oy")[
  Область $D$ называется #term[правильной в направлении $O y$], если она ограничена двумя кривыми: "нижней" $y_1(x)$ и "верхней" $y_2(x)$. \
  Любая прямая, сонаправленная $O y$, входит в область $D$ через $y_1(x)$ (и только) и выходит через $y_2(x)$ (и только).

#image("images/im8.png", width: 80%)
]
#image("images/im9_1.png")
#nota[
  Заметим, что область, представленная на рисунке выше, является неправильной по направлению $O y$, но является правильной по направлению $O x$.
]

#pagebreak()
==== 1.3. Вывод формулы вычисления
\
Функция $f(x,y):D -> RR.$ \
Зафиксируем $x=c$ и пересечем этой плоскостью поверхность $z=f(x,y)$. 

#grid(
  columns: (1fr, 1fr),
  
  image("images/im11.png",width: 100%),
  image("images/im11.1.png",width: 100%)
)


На рис.2 изображена площадь подграфика функции $f(x=c, y)$ (функция одной переменной $y$), она вычисляется интегралом $ S_(x=c)=integral_(y_1(x))^(y_2(x)) f(x,y) dif y  $
Таким образом, при всяком фиксированном $x=c$ известна $S_"сечения"$.
Объем цилиндра с основанием $D$, накрытого $f(x,y)$ - это объем тела с известными площадями сечений. \
С другой стороны, он равен двойному интегралу (геометрический смысл).
$ S_"сеч" = integral_(y_1(x))^(y_2(x)) f(x,y) dif y  $
$ underbrace(limits(integral.double)_D f(x,y) dif x dif y, "двойной") = underbrace(integral_a^b (integral_(y_1(x))^(y_2(x)) f(x,y) dif y) dif x, "кратный" ) $
#pagebreak()
==== 1.4. Запись

Кратный интеграл пишут без скобок:
$ integral_a^b (integral_(y_1(x))^(y_2(x)) f(x,y) dif y) dif x eqlong(top:"запись") integral_a^b dif x integral_(y_1(x))^(y_2(x)) f(x,y) dif y $
Вычисление происходит слева направо.

#nota[
  Формула используется для области, правильной в направлении $O y$: в последнем интеграле сохраняются границы интегрирования $y_1(x), y_2(x)$. \
  Если $D$ -- неправильная в направлении $O y$, то либо меняем направление:
  $ limits(integral.double)_D f(x,y) dif x dif y = integral_alpha^beta dif y integral_(x_1(y))^(x_2(y)) f(x,y) dif x, $
  либо режем на участки правильности.
]

#nota[
  Вычисление по формуле свелось к двум интегралам ФОП, каждый берется по формуле N-L:
  $ "Пусть" F(x,y) - "п/о для функции" f(x,y) "по" y "при" x=c. $
  $ "Тогда" integral_(y_1(x))^(y_2(x)) f(x,y) dif y eqlong(top: "N-L") lr(F(x,y)|)_(y_1(x))^(y_2(x)) eqlong(top:"при подстановке", bottom: "пределов") Phi(x) - "ФОП". $
]


#pagebreak()

=== 2. Тройной интеграл
\
$T$ -- тело, область интегрирования $f(x,y,z):T subset RR^3 -> RR$. \
#image("images/im12.png")
Делим $T$ на элементарные объемы $Delta nu_i$, выбираем средние точки $M_i ( xi_i, eta_i, zeta_i)$, составляем интегральную сумму и делаем предельный переход:
#def(title: "Тройной интеграл")[
  $ limits(integral.triple)_T f(x_i, y_i, z_i) dif nu = lim_(mat(delim: #none,n->oo; tau->0)) sum_(i=1)^n f(M_i) Delta nu_i $
]

*Формула*

$ limits(integral.triple)_T f(x_i, y_i, z_i) dif x dif y dif z = integral_a^b dif x integral_(y_1(x))^(y_2(x)) dif y integral_(z_1(x,y))^(z_2(x,y)) f(x,y,z) dif z $
Вычисление справа налево.

#pagebreak()


=== 3. Замена переменной. Криволинейные координаты.
\

#mem[
 СК -- биекция из $M$ (геом. множества) в $RR^n$.
]

#ex[
  ДПСК в $RR^2$.

  $(arrow(i), arrow(j)) -$ ортонормированный базис.\
  $|arrow(i)|=|arrow(j)|=1$, $space arrow(i) dot arrow(j) = 0$

  $(arrow(i), arrow(j)) - "правая ориентация."$

  #image("images/image.png", width: 50%)
  Для осей задается порядок: $(underbrace(arrow(i), "1ая"), underbrace(arrow(j), "2ая"))$


  Если наименьший поворот от первого вектора ко второму -- против часовой стрелки, то такая пара векторов будет #term[правоориентированной].

  Если наименьший поворот от первого вектора ко второму -- по часовой стрелке, то такая пара векторов будет #term[левоориентированной].

  То есть (по рисунку): 
  - $(arrow(i), arrow(j))-$ правоориентированная пара.
  - $(arrow(j), arrow(i))-$ левоориентированная пара.
\
  Координатными линиями будет сетка прямых: семейство прямых $l_i || O x$ и семейство прямых $p_i || O y$: $l_i perp p_j$.

    
#grid(
  columns: (1fr, 1.2fr), 
  
  image("images/im.png",width: 70%),
  image("images/im0.png",width: 70%)
)
]


#ex[
  ПСК в $RR^2$.

  #image("images/im01.png")

  $rho in RR_0^+$

  $phi in [0; 2pi)$

  $M(underbrace(rho, "радиус"), underbrace(phi, "угол"))$
]
#pagebreak()
Уравнение $x=a$ задает:

1. в $RR^1$ -- точка

2. в $RR^2$ -- прямая
3. в $RR^3$ -- плоскость
4. в ПСК, (если $x - "полярный угол"$) -- луч
5.  в ПСК, (если $x - "полярный радиус"$) -- окружность
\
*Формулы:*

ПСК $-->$ ДПСК
$ cases(x= rho cos phi, y = rho sin phi) $


 #image("images/im02.png")


#pagebreak()
 
==== 3.1 Криволинейные координаты

#def[
В $RR^3$ введена ДСК $O x y z$. Определена тройка гладких функций $ cases(xi = xi(x,y,z),eta = eta(x,y,z),zeta = zeta(x,y,z)) space, $
которая биективно отображает $O x y z$ (старую СК) в $O xi eta zeta$ (новую СК), то будем говорить, что задана #term[система криволинейных координат] $O xi eta zeta$.
]
*Важные СК в $RR^3$* (на основе ПСК):

1. Цилиндрическая 

#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/image (2).png", width: 50%),
  $ cases(x = rho cos phi, y = rho sin phi, z = z) $
)

#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im03.png"),
  [Если зафиксировать $rho = a$, то будут цилиндры.]
)


#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im04.png"),
  [Если зафиксировать $phi = a$, то будут вертикальные плоскости.]
)

#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im14.png"),
  [Если зафиксировать $z = a$, то будут плоскости.]
)

#pagebreak()
2. Сферическая

#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
image("images/im15.png", width: 70%),
$ cases(x=rho cos phi sin theta,y=rho sin phi sin theta,z=rho cos theta) $
)



$ M(x,y,z) --> M(rho, phi, theta) $
$ rho = O M, \ theta = angle(O z; arrow(O M)) \ M' = "Пр"_(O x y) M \ phi = angle(O x; arrow(O M')) $


#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im16.png"),
  [Если зафиксировать $rho = a$, то будут сферы.]
)

#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im17.png"),
  [Если зафиксировать $phi = a$, то будут вертикальные плоскости.]
)
#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im18.png"),
  [Если зафиксировать $theta = a$, то будут конусы.]
)
#grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im19.png", width: 70%),
  [Задание точки.]
)

#pagebreak()

==== 3.2 Замена переменной


#mem[
  $ integral_a^b f(x) dif x eqlong(top: x=phi(t), bottom:phi(alpha)=a "," phi(beta)=b) integral_alpha^beta f(phi(t)) phi'(t) dif t $
]
\
*Вывод формулы для двойного интеграла*

#nota[
  #grid(
  columns: (auto, auto),
  gutter: 1em,
  align: (center + horizon, center + horizon),
  image("images/im20.png", width: 90%),
  image("images/im21.png", width: 90%)
)
  
  Разрезая при дроблении на элементарные участки координатными линиями, получаем _элементы разной формы_, площади которых вычисляются по _разным формулам_.
]
\ \ \ \
Вычислим, как меняется размер элемента $Delta sigma = dif x dif y$ при переходе:
$ O x y  --> O u v $
$ cases(x=phi(u,v), y = psi(u,v)) space, phi, psi - "непр. дифф." $

#let img = image("images/im22.png", width: 7cm)

#let img1 = image("images/im23.png", width: 9cm)

#grid(
  columns: 2,
  column-gutter: 5em,
  align: top,

  box(width: 8cm, height: 8cm)[
    #place(top + left, dx: 0pt, dy: 0pt, img)
    #place(top + left, dx: 1cm, dy: 1cm, $v + Delta v$)
    #place(top + left, dx: 5cm, dy: 1cm, $u + Delta u$)
    #place(top + left, dx: 5cm, dy: 3.5cm, $v$)
    #place(top + left, dx: 1cm, dy: 3cm, $u$)
    #place(top + left, dx: 3cm, dy: 2cm, $Delta S$)
  ],

  box(width: 8cm, height: 8cm)[
    #place(top + left, dx: 0pt, dy: 0pt, img1)
    #place(top + left, dx: 7cm, dy: 2cm, $v + Delta v$)
    #place(top + left, dx: 5cm, dy: 0cm, $u + Delta u$)
    #place(top + left, dx: 5.5cm, dy: 4cm, $v$)
    #place(top + left, dx: 2.8cm, dy: 2cm, $u$)
    #place(top + left, dx: 5cm, dy: 2cm, $Delta S'$)
  ],
)

Распрямили координатную сетку $u, v$.\
Заметим, что $Delta S != Delta S' != Delta sigma$.

Изначально, элементарный участок -- криволинейный параллелограмм.

За счет малости участка $Delta S$ и гладкости функций $phi, psi$, можно считать площадь $Delta S approx S_(A B C' D)$.

Пояснение: параллелограмм однозначно задается тремя точками: $A, B, D$. При этом точка $C$ образует с тремя другими именно криволинейный параллелограмм. Чтобы образовать обычный параллелограмм, точка $C$ сдвинется в $C'$:
#image("images/im24.png", width: 60%)
#pagebreak()
Так как $u, v -$ криволинейные координаты, а $u="const"$ и $v="const"$ -- координатные кривые, то мы можем задать точки, лежащие на пересечении некоторых координатных кривых:
$ 
A(u, v + Delta v), \ 
B(u, v), \
D(u + Delta u, v + Delta v), \
C(u+ Delta u, v)
$
$Delta_u phi = phi(u, v + Delta v)-phi(u,v)$

Воспользуемся тем фактом, что площадь параллелограмма можно посчитать через векторное произведение:

$ S_(A B C D) approx |arrow(B A) times arrow(B C)| = lr(||mat(
  arrow(i), arrow(j), arrow(k);
  phi_v Delta v, psi_v Delta v, 0;
  phi_u Delta u, psi_u Delta u, 0
)||) = lr(|mat(delim: "|",Delta_v phi, Delta_v psi; Delta_u phi, Delta_u psi) dot arrow(k)|) = $
$ eqlong(top:Delta_u phi approx (partial phi)/(partial u) dif u",...", bottom:Delta_v psi approx (partial psi)/(partial v) dif v",...") lr(|mat(delim: "|",(partial phi)/(partial v), (partial psi)/(partial v); (partial phi)/(partial u), (partial psi)/(partial u)) dif u dif v|) dot |arrow(k)| $

Окончательно:
$ S_(A B C D) approx underbrace(lr(|mat(delim: "|",(partial phi)/(partial v), (partial psi)/(partial v); (partial phi)/(partial u), (partial psi)/(partial u))|), "поправка на деформацию") dot dif u dif v  $

$  scr(J) = mat(delim: "|",(partial phi)/(partial v), (partial psi)/(partial v); (partial phi)/(partial u), (partial psi)/(partial u)) - #term[якобиан]. $ 


$ scr(J) = lim_(Delta S -> 0) (Delta S)/(Delta S'), space space space space Delta S = |scr(J)| underbrace(dif u dif v, Delta S') + o(Delta S) $


*Формула*:
$ limits(integral.double)_D_(x y) f(x,y) dif x dif y = limits(integral.double)_D_(u v) tilde(f)(u,v) |scr(J)| dif u dif v $

#pagebreak()





