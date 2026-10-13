#set text(lang: "ru")
#set text(lang: "ru", font: "Liberation Serif", size: 14pt)
#import "./theme.typ": term, def, th, proof, ex, eqlong, ash, ach, nota, mem, letsym, sh, ch

#import "@preview/cetz:0.3.1"
#import "@preview/fletcher:0.5.7": diagram, node, edge

#set heading(numbering: (..nums) => {
  let n = nums.pos()
  if n.len() == 2 {
    [§]
  } else if n.len() == 2 {
    numbering("1", n.at(1))
  } else {
    numbering("1.1", ..n.slice(1))
  }
})

// Все заголовки жирные
#show heading: it => {
  set text(weight: "bold")
  it
}

#outline()

#pagebreak()



= Интегрирование ФНП
== Кратные интегралы
=== Двойной интеграл
==== Определение
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
  columns: (1fr, 1fr), // Два столбца одинаковой ширины
  
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


==== Вычисление двойного интеграла

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
==== Вывод формулы вычисления
\
Функция $f(x,y):D -> RR.$ \
Зафиксируем $x=c$ и пересечем этой плоскостью поверхность $z=f(x,y)$. 

#grid(
  columns: (1fr, 1fr), // Два столбца одинаковой ширины
  
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
==== Запись

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

=== Тройной интеграл
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


=== Замена переменной. Криволинейные координаты.
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
  columns: (1fr, 1.2fr), // Два столбца одинаковой ширины
  
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
 
==== Криволинейные координаты

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
$ rho = O M, \ theta = angle(O z, arrow(O M)) \ M' = "Пр"_(O x y) M \ phi = angle(O x, arrow(O M')) $


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

==== Замена переменной


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


*Формула*:
$ limits(integral.double)_D_(x y) f(x,y) dif x dif y = limits(integral.double)_D_(u v) tilde(f)(u,v) |scr(J)| dif u dif v $

#pagebreak()



#nota[
  Таким образом, геометрический смысл Якобиана:
  
$ scr(J) = lim_(Delta S -> 0) (Delta S)/(Delta S') - "коэфф. искажения площади" Delta S' = dif u dif v "при" $
$ "искривлении коорд. линий" u, v. $
$ Delta S = |scr(J)| underbrace(dif u dif v, Delta S') + o(Delta S) $
]

#nota[
  Для $"Ф"_n"П": f(x_1, x_2, ..., x_n): RR^n -> RR$

  $"Исходная СК:" O x_1, x_2, ..., x_n - "ДСК."$

  Переход к криволинейной СК:
  $ cases(x_1 = x_1(phi_1, phi_2, ..., phi_n), x_2 = x_2(phi_1, phi_2, ..., phi_n), ..., x_n = x_n (phi_1, phi_2, ..., phi_n)) $

  $ scr(J) = mat(delim: "|",
  (partial x_1)/(partial phi_1), (partial x_2)/(partial phi_2), ...,  (partial x_n)/(partial phi_n); 
  ..., ..., ..., ...;
  dots.v, dots.v, dots.v, dots.v;
  (partial x_n)/(partial phi_1), (partial x_n)/(partial phi_2), ...,  (partial x_n)/(partial phi_n))  $

  Тогда, $ limits(integral)_Omega f(arrow(x)) dif v = limits(integral)_Omega' f(arrow(phi)) dot |scr(J)| dif Theta $
  $ dif Theta = dif phi_1 dif phi_2 dot ... dot dif phi_n $
]
#pagebreak()

#ex[
  *Объем "мороженки"*:

  #image("images/im25.png", width: 60%)
  Концентрические конус и шар:
  
  $T: z = sqrt(x^2+y^2)$
  
  $T: z = sqrt(1-x^2-y^2)$

  $ arrow(r) - "радиус вектор". \ "Так как есть концентричность (упаковывается в шар с центром" O")," \  "переходим в сферическую СК:"  $

  $ cases(x=rho cos phi sin theta,y=rho sin phi sin theta,z=rho cos theta) $

  $ "Конус:" cos theta = sin theta <=> tan theta = 1 <=> theta = pi/4 => theta arrow.t_0^(pi/4) $

  $ "Сфера:" rho = 1 => rho arrow.t_0^1, space phi arrow.t_0^(2 pi)  $

  $ "В ДСК:" \ V_T = integral_T 1 dot dif x dif y dif z eqlong(top: "Сферическая", bottom: "СК") integral_T |scr(J)| dif rho dif phi dif theta eqlong(top:"кратный") \ = integral dif phi integral dif theta integral rho^2 sin theta dif rho = $
  $ = phi|_0^(2 pi) dot integral_0^(pi/4) sin theta dif theta dot integral_0^1 rho^2 dif rho = 2 pi (- cos theta)|_0^(pi/4) dot lr(rho^3 /3|)_0^1 = \ =  2 pi (1 - 1/(sqrt(2))) dot 1/3 = (sqrt(2) (sqrt(2)-1))/3 pi $

]


#pagebreak()


== Криволинейные интегралы

=== Определение. Свойства.

#nota[
  Построим интегралы в соответствующих задачах.
]

#ex[
  *Задача 1*

  Найти массу неоднородного искривленного (плоского) стержня.

#image("images/im26.png", width: 50%)
  Стержень $A B -$ плоская кривая с уравнением $y=y(x).$ Потребуем гладкости $y(x)$.

  Вырежем из $A B$ элемент $dif l$.

  По стрежню распределена плотность $rho(M) = rho(x,y) - $ функция точки.

  Если элемент $dif l$ мал, то изменение плотности в нем незначительны. Во всяком случае, мы этого потребуем.

  Выберем любую точку в элементе $dif l$ и найдем среднее значение $rho(N) dif l -$ средняя масса элемента.

  Вся масса $A B$ равна $integral_(A B) rho(x,y) dif l$
]
#pagebreak()
  *Строго*:

  Дробление дуги на $Delta l_i$ #image("images/im27.png")

  Замена с точностью до бесконечно малого высшего порядка $Delta l_i = Delta S_i$  

  #image("images/im28.png")

  $ Delta S_i = Delta x_i sqrt(1+((Delta y_i)/(Delta x_i))^2) $

  Тогда
  
  $ limits(integral)_(A B) rho(x,y) dif l eqlong(top:"def") limits(lim_(n->oo))_(tau ->0) sum_(i=0)^n
  f(xi_i, eta_i) dot Delta l_i -
  $
  $ "криволинейный интеграл I рода (интеграл по дуге)." $



*Свойства* (очевидные): 

+ Линейность, аддитивность.

+ Не меняет знак при смене направления: $integral_(A B) = integral_(B A)$

#ex[
  *Задача 2*:

  Сила совершает работу по перемещению мат. точки вдоль плоского криволинейного пути.

  Найти работу.

  #mem[
    #image("images/im29.png", width: 70%)
    #image("images/im30.png", width: 70%)

    $A = arrow(F) dot arrow(S) -$ формула для константных величин.
  ]

  Для переменной силы: $arrow(F) = (P(x,y), Q(x,y))$

  #image("images/im31.png", width: 80%)

  Для криволинейного пути:

  #image("images/im32.png", width: 50%)

  Гладкая дуга $A B$ -- спрямляемая (функция, задающая $A B -$ непрерывно дифференцируема.)

  Вырезаем элемент дуги $dif l$.

  #image("images/im33.png", width: 50%)

  При малых $dif l$ $arrow(F)$ меняется мало (требуем), $dif l approx dif s$.

  В произвольной точке $dif l$ находим элементарную работу $ dif A = arrow(F)(N) arrow(dif s) $
$ N = (xi, eta)- "средняя точка" $
$ arrow(F)(N) = (P(xi, eta), Q(xi, eta)) $
$ arrow(dif s) = (dif x; dif y) $

#image("images/im34.png", width: 50%)

Находим всю работу
$ A = limits(integral)_L dif A = limits(integral)_L arrow(F) dot arrow(dif s) = limits(integral)_L (P(x,y), Q(x,y)) dot (dif x, dif y) = $
$ = limits(integral)_L (P(x,y) dif x + Q(x,y) dif y) eqlong(top:"пишут") $
$ = limits(integral)_L P dif x + Q dif y - "интеграл II рода (в проекциях)" $
$ limits(integral)_L arrow(F) arrow(dif s) $
]

*LAB* строгое определение 2 рода через дробление, предел интегральных сумм...

*Свойства интеграла II рода*:

+ Линейность 

+ Аддитивность
+ Меняется знак при смене направления:  $ integral_(A B) P dif x + Q dif y = - integral_(B A) P dif x + Q dif y
$

#pagebreak()

*Иная запись:*

Запишем $arrow(dif s)$ в направлениях:

#image("images/im35.png",width: 40%)

$ |arrow(dif s)| = arrow(dif s) $
$ arrow(dif s) = (cos alpha dif s; cos beta dif s) = dif s dot underbrace((cos alpha; cos beta), "единичный вектор") $


$ limits(integral)_L (P, Q) (dif x, dif y) = limits(integral)_L (P,Q) (cos alpha; cos beta) dif s = underbrace(limits(integral)_L (P cos alpha + Q cos beta)  overbrace(dif s, "длина хорды (дуги)"), "интеграл I рода") $

#pagebreak()

=== Вычисление

#nota[
  Сводим к интегралу $integral_a^b y(x) dif x$
]

  1. $ limits(integral)_L f(x,y) dif l eqlong(top:"параметризация дуги", bottom: cases(x=x(t), y=y(t)) "," t in [alpha, beta]) limits(limits(integral)_(L:space x(t) comma y(t)))_(t in [alpha, beta]) f(x(t), y(t)) dif l eqlong(top: "дифференциал дуги", bottom: dif l = sqrt((x'(t))^2 + (y'(t))^2) |dif t|) \ = integral_alpha^beta tilde(f)(t) sqrt(x'_t^2 + y'_t^2) |dif t| $

  2. $ limits(integral)_L P(x,y) dif x + Q(x,y) dif y  eqlong(top: "параметризация", bottom: L: x(t)"," y(t)) limits(limits(integral)_(L:space x(t) comma y(t)))_(t in [alpha, beta]) tilde(P)(t) overbrace(dif x(t), x'(t)dif t) + tilde(Q)(t) overbrace(dif y(t), y'(t) dif t) = $
    $ =integral_alpha^beta (tilde(P)(t) x'(t) + tilde(Q)(t)y'(t)) dif t $

    Направление $alpha -> beta$ согласовано с $A -> B$.

    #image("images/im36.png")


#pagebreak()

#ex[
  $L = overline(A B), space A(1;1), space B(3,5) $
  \ $f(x,y) = x+y$

  $limits(integral)_L f(x,y) dif l$

  1. Параметризация $overline(A B)$

  #image("images/im37.png", width: 40%)


  $ (x-x_A)/m = (y-y_A)/n, space (m, n) = arrow(A B) = (2;4) $

  $ (x-1)/2 = (y-1)/4 <=> x-1 = (y-1)/2 <=> 2x - 2 = y-1 <=> y = 2x - 1 $
  $ cases(y= 2x -1, x=x)   space space - "параметризация." $ 

  2. $f(x,y)= tilde(f)(x) = x+ (2x-1)=3x - 1$

  3. $dif l = sqrt(1 + (y'(x)^2)) dif x = sqrt(1+4) dif x = sqrt(5) dif x $

  $limits(integral)_(overline(A B)) (x+y) dif l = integral_1^3 (3x-1) sqrt(5) dif x = ...$ 
]
