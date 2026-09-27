#set text(lang: "ru")
#set text(lang: "ru", font: "Liberation Serif", size: 14pt)
#import "theme.typ": term, def, th, proof, ex, eqlong, ash, ach, nota, mem, letsym, sh, ch


#set outline.entry(fill: repeat([.]))

#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true) 
  strong(it)         
}

#outline()
#pagebreak() 



=  7. #underline[Евклидово пространство]


#mem[
  #def(title: "Линейное пространство")[
    Множество $V$ называется #term[линейным пространством] над полем скаляров $F$ (обычно, $F = RR$), если на $V$ введены следующие аксиомы: \ \
    1. Коммутативность  
    $ x + y = y + x, space forall x, y in V $
    2. Ассоциативность 
    $ (x + y) + c = x + (y + c), space forall x, y, z in V $
    3. Существование нулевого вектора
    $ exists theta in V: x + theta = x space forall x in V $
    4. Существование противоположного вектора
    $ x + (-x) = theta space forall x in V $
    5. Унитарность (свойство единицы)
    $ 1 dot x = x dot 1 = x space forall x in V $
    6. Ассоциативность умножения
    $ (alpha beta) x = alpha (beta x) space forall alpha, beta in F, x in V $
    7. Дистрибутивность относительно сложения векторов
    $ (x + y) alpha = x alpha + y alpha space forall alpha in F, x, y in V $
    8. Дистрибутивность относительно сложения скаляров
    $ (alpha + beta) x = alpha x + beta x space forall alpha, beta in F, x in V $
  ]
]

#def(title: "Скалярное произведение (вещественно-значное)")[
  Отображение вида
  $ S(x, y):V times V -> RR $ называется #term[скалярным произведением], если выполнены следующие аксиомы:
  1. $ lambda (x; y) = (lambda x; y)$
  2. $ (x + z; y) = (x; y) + (z; y)$
  3. $ (x; y) = (y; x)$
  4. $ (x; x) eqlong(top: "об.") x^2 >=0, space x^2 = 0 => x = 0$
]

#def(title: "Норма вектора")[
  Отображение вида $ ||x||: V -> RR $ называется #term[нормой вектора], если выполнены следующие аксиомы:
  1. $||lambda x|| = |lambda| dot ||x||$
  2. $||x|| >= 0; space ||x||=0 => x= 0$
  3. $||x + y|| <= ||x|| + ||y||$
]

#def(title: "Евклидово пространство")[
  Линейное пространство со скалярным произведением называется #term[евклидовым].
]

#def(title: "Нормированное пространство")[
  Пространство с нормой называется #term[нормированным].
]

#th[
  $ E^n - "евклидово линейное пространство." \ "Тогда" E^n "нормировано, если" ||x|| = sqrt((x;x)). $
]
#proof[
  Проверка аксиомы нормы для $sqrt((x;x)).$
]

#ex[
  1. Линейное пространство геометрических векторов
  $ cases(delim:"[", 
  (arrow(a), arrow(b)) = |arrow(a)| dot |arrow(b)| dot cos phi ", если " arrow(a) "," arrow(b) !=0,
  (arrow(a), arrow(b)) = 0 ", при" arrow(a) = 0 "или" arrow(b) = 0
) $

  2. Линейное пространство числовых строк
  $ arrow(a) = (a_1, a_2, ... , a_n) \
  arrow(b) = (b_1, b_2, ..., b_n) \
  (arrow(a), arrow(b)) = a_1 dot b_1 + a_2 dot b_2 + ... + a_n dot b_n
  $

  3. Линейное пространство функций, непрерывных на $[a;b] space (C_[a;b])$
  $ (f(x);g(x)) = integral_a^b f(x) g(x) dif x, \
  ||f|| = sqrt(integral_a^b f^2 (x) dif x)
  $
]

#th(title: "Неравенство Коши-Буняковского")[
  $ forall x, y in E^n &==> (x, y)^2 <= (x,x) dot (y, y) $
]
#proof[
  Рассмотрим $(lambda x - y)(lambda x - y) >= 0, lambda in RR:$
  $ lambda^2 (x,x) - lambda (x, y) - lambda (y, x) + (y,y) >=0 \
  lambda^2 (x, x) - 2lambda(x,y) + (y,y) >= 0 $
  1. Выражение слева равно $0$
  $ lambda^2 (x, x) - 2lambda(x,y) + (y,y) = 0 \
  (lambda x - y)^2 = 0 \
  lambda x - y = 0 \
  y = lambda x, " подстановка:" \
  (x, y) = (x, lambda x) = (x, x) lambda \
  (x, x)(y,y) = (x,x)(lambda x, lambda x) = lambda^2 (x,x)(x,x) \
  (x, y)^2 = lambda^2 (x,x)(x,x) <= lambda^2(x,x)(x,x)
  $
  2. Выражение слева больше $0$
  $ "Тогда" D < 0: \
  D = (2(x,y))^2 - 4 (x,x)(y,y) < 0 \
  (x,y)^2 <  (x,x)(y,y) $
]

#mem[
  *"Угол" между векторами*
  $ cos phi eqlong(top: "def") ((x,y)) / (||x|| dot ||y||) $
  $ phi - "необязательно геометрический угол" $
]

#nota[
  Можно определить проекцию вектора $x$ на вектор $y$ в общем смысле.
  Геометрически:
  $ "пр"_y x = ||x|| cos phi = ||x|| dot ((x,y)) / (||x|| dot ||y||) = ((x,y)) / (||y||)  $
]

#mem[
  #def(title: "Ортонормированный базис в ЛП")[
    $ cal(E) = {e_1, e_2, ..., e_n} ", такой что" \
      e_i dot e_j = cases(delim:"[", 1 "," i = j, 0 "," i != j)
    $
  ]
  Геометрически: попарно перпендикулярные единичные векторы.
]

#nota[
  В $forall E^n$ с нормой можно выделить о/н базис. Базис выделяется в любом $V^n$. Теперь ортонормируем.
]
\
#th[
  $(E^n, ||dot||) - $ нормированное евклидово пространство. Тогда \ $exists cal(E) = {e_1, e_2, ..., e_n} - $ о/н базис в $E^n$.
]
#proof[
  Возьмем какой-либо базис $V^n: cal(B) = {b_1, b_2, ..., b_n}.$ \
  Нормировать легко: $forall x: x/(||x||) = "ед. вектор."$ \
  Дальше будем ортогонализировать $cal(B)$. \
  В качестве $e_1$ возьмем $b_1$: 
  $e_1 = b_1$. \
  Будем искать $e_2 = b_2 + lambda e_1$ так, что
  $(e_2, e_1) = 0$ (то есть $e_1 perp e_2$). \
  $(e_2, e_1) = (b_2 + lambda b_1, e_1) = (b_2, e_1) + lambda (e_1, e_1) = 0$ \
  $ lambda = - ((b_2, e_1)) / ((e_1, e_1)) $ 
  То есть $ e_2 = b_2 - ((b_2, e_1)) / ((e_1, e_1)) e_1 $
  Дальше индукция: \
  Пусть построены ${e_1, e_2, ..., e_k}$ ортогональных векторов. Найдем $e_k$ в виде \
  $ e_k = b_k + lambda_1 e_(k-1) + lambda_2 e_(k-2) + ... + lambda_(k-1) e_1 $
  Потребуем условия на $lambda_i$, чтобы все скалярные произведения \ $(e_k, e_i) = 0.$ То есть 
  $ (e_k, e_1) = (b_k,e_1) + lambda_1 (e_(k-1),e_1) + lambda_2 (e_(k-2),e_1) + ... + lambda_(k-1) (e_1,e_1) = 0. $
  $ lambda_(k-1) = ((b_k, e_1))/((e_1, e_1)) $
  И так далее для всех $lambda_i$. \ Такой процесс называется *процессом ортогонализации базиса (Грамма-Шмидта)*.
]

#nota[
  По аналогии с изоморфизмом ЛП определяется изоморфизм евклидовых пространств: биекция, сохранение линейной комбинации и значение скалярного произведения. То есть
  $ f: E->E' - "изоморфны. Тогда" \ f(lambda x + mu y) = lambda f(x) + mu f(y) "и" (x,y) = (f(x), f(y)). $
Если $E, E' -$ изоморфны, то $dim E = dim E'$. \
Можно также говорить о подпространствах $E^n$ (аналог подпространства $V^n$).
]

#def(title: "Ортогональный вектор к пространству")[
  $G - $ подпространство $E_n$. Вектор $h$ называется \ #term[ортогональным] к $G$ ($h perp G$), если $forall x in G ==> h perp x.$
]

#def(title: "Ортогональное дополнение")[
  $G - $ подпространство $E_n$. #term[Ортогональным дополнением] к $G$ называется множество $cal(F) = {h in E^n | h perp G}$.
]

#th[
Следствие: 
$ h perp e_i space forall e_i in G &==> h perp x = sum_(i=1)^k lambda_i e_i, \ e_i - "базисные векторы". $
]
#proof[
  $(h,x) = (h, sum_(i=1)^n lambda_i e_i) = lambda_1(h, e_1) + lambda_2(h,e_2) + ... + lambda_k (h, e_k) = 0$
]

#th[
  Пусть $cal(F)$ — ортогональное дополнение к подпространству $G$. 
  Тогда любая линейная комбинация векторов из $cal(F)$ также принадлежит $cal(F)$ 
  (то есть является ортогональной к подпространству $G$).
]
#proof[
  Возьмем вектор $ v: v = sum_(i=1)^k lambda_i h_i, "где" h_i perp G. "Тогда" $ 
   $ (v,x) = (sum_(i=1)^k lambda_i h_i, space x) = sum_(i=1)^k lambda_i (h_i, x_i) = 0 $ 
  $ v perp x => v in cal(F). $
]


#mem[
  #def(title: "Прямая сумма")[
    $W, U -$ подпространства $V^n$. \
    $ V^n = W plus.o U <=> cases(dim W + dim U = dim V = n, W inter U = {0}) $
  ]
  Отсюда для базисов $U, W$ следует, что их объединение - базис $V$, их пересечение - $emptyset$. 
]
#th[
  Пусть $G$ — подпространство в евклидовом пространстве $E^n$. 
  Тогда существует ортогональное дополнение $cal(F)$ к подпространству $G$, такое что $cal(F) plus.o G = E^n$.
]
#proof[
  Пусть $cal(B)_G = {e_1, e_2, ..., e_k}$ — ортонормированный базис $G$. \
  Дополним его до ортонормированного базиса всего пространства $E^n$: \
  $cal(B)_(E^n) = {e_1, ..., e_k, e_(k+1), ..., e_n}$. \
  Определим $cal(F)$ как линейную оболочку добавленных векторов: \
  $cal(F) = <e_(k+1), ..., e_n>$, при этом $dim cal(F) = n - k$. \
  
  Любой вектор $x in E^n$ можно разложить по этому базису: \ 
  $x = underbrace((x_1 e_1 + ... + x_k e_k), X' in G) + underbrace((x_(k+1) e_(k+1) + ... + x_n e_n), X'' in cal(F)) = X' + X''.$ \
  
  Эта сумма является прямой, так как: \
  $ cases(dim G + dim cal(F) = k + (n-k) = n, cal(B)_G inter cal(B)_cal(F) = emptyset => G inter cal(F) = {0} ) $
   Следовательно, $cal(F) plus.o G = E^n$. \
  
  Докажем ортогональность: так как общая система векторов ортонормирована, каждый базисный вектор $e_j in cal(B)_cal(F)$ ортогонален каждому $e_i in cal(B)_G$. \
  Тогда любая линейная комбинация $X'' in cal(F)$ ортогональна всем базисным $e_i in G$, а значит, ортогональна и любому вектору $X' in G$. \
  Таким образом, $forall X'' in cal(F) ==> X'' perp G$, что и требовалось доказать.
]


#nota[
  Об изоморфных евклидовых пространствах.
]

#th[
  $E_1$ изоморфно $E_2 <=> dim E_1 = dim E_2$.
]
#proof[
  *=> (Необходимость)* \
  Пусть пространства изоморфны, тогда существует евклидов изоморфизм $f: E_1 -> E_2$ (линейная биекция). \
  Пусть $dim E_1 = n$, а ${e_i}_(i=1)^n$ — базис в $E_1$. Любой вектор $x in E_1$ раскладывается как:
  $ f(x) = f(x_1 e_1 + x_2 e_2 + ... + x_n e_n) = x_1 f(e_1) + x_2 f(e_2) + ... + x_n f(e_n) = \
  eqlong(top: f(e_i) eqlong(top:"обозн.") e'_i) x_1 e'_1 + ... + x_n e'_n. $
  Поскольку $f$ — биективное линейное отображение, образ линейно независимой системы ${e_i}$ также является линейно независимой системой ${e'_i}_(i=1)^n$ в $E_2$. \
  Размерность $E_2$ не может быть больше $n$, иначе в силу биективности $f$ в пространстве $E_1$ нашлась бы ЛНЗ система из $m > n$ векторов, что противоречит $dim E_1 = n$. Значит, $dim E_2 = n$. \

  *<= (Достаточность)* \
  Пусть $dim E_1 = dim E_2 = n$. Возьмем в $E_1$ о/н базис ${e_i}_(i=1)^n$, а в $E_2$ — о/н базис ${e'_i}_(i=1)^n$. \
  Зададим отображение $f: E_1 -> E_2$ по правилу равенства координат:
  $ f(x) = f(x_1 e_1 + ... + x_n e_n) = x_1 e'_1 + x_2 e'_2 + ... + x_n e'_n = y in E_2. $
  Такое отображение очевидно является линейным изоморфизмом. Докажем, что оно сохраняет скалярное произведение (евклидов изоморфизм). \
  В пространстве $E_1$ для любых векторов $x'$ и $x''$:
  $ (x', x'') eqlong(top:{e_i} - "о/н", bottom: "базис") (x'_1 e_1 + ... + x'_n e_n, x''_1 e_1 + ... + x''_n e_n) = x'_1 x''_1 + ... + x'_n x''_n $
  Так как $f$ — линейный изоморфизм, то для образов векторов имеем: \
  $f(x') = x'_1 e'_1 + x'_2 e'_2 + ... + x'_n e'_n$ и \
  $f(x'') = x''_1 e'_1 + x''_2 e'_2 + ... + x''_n e'_n.$ \
  Поскольку базис ${e'_i}$ в $E_2$ также является ортонормированным, получим: \
  $ (f(x'), f(x'')) = x'_1 x''_1 + ... + x'_n x''_n = (x', x''). $ \
  Следовательно, $f$ — евклидов изоморфизм. Теорема доказана.
]


#ex[
  $E_1 = cal(P_2) -$ пространство многочленом степени $n<=2$. \
  $cal(P)_2 = {cal(P)_2(t) = a t^2 + b t + c | a,b,c in RR, t in [0,1]}$. \
  Изоморфизм между $cal(P)_2$ и $RR^3 = {(x,y,z) | x,y,z in RR}$ \
  Скалярное произведение $P_2(t) dot Q_2(t) = integral_0^1 P_2(t) Q_2(t) dif t$ \
  Вместо этого можно считать скалярное произведение в $RR^3$ (как обычно).

#nota[
  Обычное покомпонентное скалярное произведение в $RR^3$ совпадет с интегралом только в том случае, если координаты $(x, y, z)$ берутся в *ортонормированном* базисе. 

  Стандартный базис из мономов ${1, t, t^2}$ не является ортонормированным относительно заданного интеграла (например, $integral_0^1 1 dot t dif t = 1/2 != 0$). Чтобы изоморфизм работал корректно, в качестве базиса $cal(P)_2$ нужно использовать сдвинутые многочлены Лежандра, полученные процессом ортогонализации Грама-Шмидта:
  $ e_1(t) = 1, quad e_2(t) = sqrt(3)(2t - 1), quad e_3(t) = sqrt(5)(6t^2 - 6t + 1) $
  ]
]
\ 
*Задача о перпендикуляре* (проекция вектора на подпространство)

Вектор $x in E^n$ проектируется на $G subset E^n$. \ При этом $x = x_0 + h_0, "где "x_0 - "проекция," h_0 - "перпендикуляр."$ \
Задача состоит в том, чтобы найти кратчайшее расстояние от $x$ до $G$, или проекцию $x$ на $G$, которая соответствует наименьшему расстоянию. Сводится к построению перпендикуляра.

#ex[
  Пусть $E^n = C_[-pi, pi].$ Подпространство $G-$ пространство тригонометрических многочленов вида $ T(t) = a_0 + a_1 cos t + b_1 sin t + ... + a_m cos m t + b_m sin m t $
  Тогда задача сводится к поиску многочлена $T$ с такими коэффициентами, чтобы функция $f in C_[-pi;pi]$ менее всего отличалась от $T(t),$ то есть $f(t)$ наилучшим образом приближается многочленом $T(t)$.
]
\ \ \ \
#nota[
  $h_0$ будет наименьшим, если $ forall x' in G, x' != x_0 ==> underbrace(||x-x'||, ||h'||) > underbrace(||x-x_0||, ||h_0||) $
  Докажем, что это выполнится для $h_0 perp G$.
]

#th(title: "Пифагора")[
  $x, y in E^n$. Тогда $ x perp y ==> ||x+y||^2 = ||x||^2 + ||y||^2$
]
#proof[
  $ ||x+y||^2 = (x+y, x+y) = (x,x) + 2(x,y) + (y,y) = \ = (x,x) + (y,y) = ||x||^2 + ||y||^2 $
]


#def(title: "Гипотенуза")[
  Если  $x perp y$, то $x+y = cal(g)$ называется #term[гипотенузой] треугольника с катетами $x, y$.
]

#th[
  $h_0 perp G, space x_0, x' in G, x = h_0 + x_0 in E^n, space x = h' + x'.$ Тогда $ forall x' in G ==> ||x-x'|| > ||x-x_0|| = ||h_0|| $
]
#proof[
  $||x-x'||^2 = ||underbrace(x-x_0, =h) + underbrace(x_0 -x', in G)||^2 eqlong(top:h_0 perp G, bottom:"Th Пиф") \ =||x-x_0||^2 + ||x_0-x'||^2 > ||x-x_0||^2$ 
]
\ \ \
#nota[
  Наименее отстоящей от вектора из всех проекций является ортогональная. \
  Как вычислить $x_0$ (проекцию $x$ на $G$)?
]

*Вычисление $x_0:$*

$ cal(B)_G = {e_1, e_2, ..., e_k} "(не обязательно о/н)" $
$ "В базисе " cal(B)_G "разложение" x_0 = lambda_1 e_1 + ... + lambda_k e_k $
$ "Нужно найти " lambda_1, ..., lambda_k. $
$ h_0 perp G, h_0 = x-x_0 <=> (h_0, e_i) = 0 <=> (x-x_0, e_i) = 0 $
$ (x,e_i) - (x_0, e_i) = 0 $
$ (x,e_i) = (x_0, e_i)-"проекции" x "и" x_0 "на векторы" e_i "равны." $
$ "Спроектируем" x_0 "последовательно на все" e_i. $
$ (x_0,e_i) = (lambda_1 e_1 + ... + lambda_k e_k, e_i) = lambda_1 (e_1, e_i) + ... + lambda_k (e_k, e_i) = (underbrace(x, "дан"), underbrace(e_i, "выбран")) $
$ "При" i = 1,...,k "получим" k "уравнений с" k "неизвестными" lambda_i. $
$ "СЛАУ:" cases(
  (e_1, e_1) lambda_1 + ... + (e_k, e_1) lambda_k = (x, e_1),
  (e_1, e_2) lambda_1 + ... + (e_k, e_2) lambda_k = (x, e_2),
  ...,
  (e_1, e_k) lambda_1 + ... + (e_k, e_k) lambda_k = (x, e_k)
  
) <=> $
$ <=> "Существует единственное решение " {lambda_i}_(i=1)^k: $
$ mat((e_1, e_1), ..., (e_k, e_1);
dots.v, dots.v, dots.v;
(e_1, e_k), ..., (e_k, e_k)
) mat(lambda_1;lambda_2; dots.v; lambda_k) = mat((x, e_1); (x, e_2); dots.v; (x, e_k)) $
\ \
#def(title:"Матрица Грама")[
  $ cal(G) = mat((e_1, e_1), ..., (e_k, e_1);
dots.v, dots.v, dots.v;
(e_1, e_k), ..., (e_k, e_k)
) - "матрица Грама." $  
]

#nota[
  Если базис - о/н, то $cal(G) = I$.
]
#nota[
  Если $det cal(G) != 0,$ то $x_0$ находится однозначно (как разложение по базису $G$, а отсюда находим $h_0$.)
]

*Приложение*

$ E^m = C_[-pi, pi] $
$ G = {T(t) - "пространство триг. многочленов"} $
$ T(t) = a_0 + a_1 cos t + b_1 sin t + ... + a_m cos m t + b_m sin m t $
$ "Вектор" x - "функция" f(t):[-pi; pi] -> RR $
$ "Найти многочлен" T(t) "(то есть найти коэфф." a_i, b_i ") такой, что"  $
$ ||f(t) - T(t)|| = "наименьшая для всех многочленов из " G. $
$ "Ищем многочлен наилучшего приближения." $
1. Выделим базис $cal(B)_G$
Рассмотрим систему функций ${1, cos t, sin t, ..., cos m t, sin m t}$

Покажем, что эта система - о/н, то есть любые две функции в скалярном произведении дают $0$.
$ (f, g) = integral_(-pi)^pi f(t) g(t) dif t $
$ (sin k t, cos m t) = integral_(-pi)^pi sin k t cos m t dif t = \ = 1/2 integral_(-pi)^pi (sin(k+m) t  + sin(k-m) t) dif t = \ = 1/2 ((-1)/(k+m) cos(k+m) t - 1/(k+m) cos(k-m) t)|_(-pi)^pi = 0 $
Аналогично:
$ (sin k t, sin n t) = 0 $
$ (cos k t, cos m t) = 0 $
$ (1, sin k t) = 0 $
$ (1, cos k t) = 0 $
Но система не нормирована.

2) Нормируем и строим базис $cal(B)_G$.
$ ||1||^2 = integral_(-pi)^pi 1^2 dif t = pi - (-pi) = 2pi $
$ ||1||= sqrt(pi) $
$||sin k t||^2 = integral_(-pi)^pi sin^2 k t dif t = integral_(-pi)^pi (1-cos k t)/2 dif t = 1/2 t |_(-pi)^pi + 0 $
$ ||sin k t|| = sqrt(pi) $
Аналогично:
$ ||cos k t|| = sqrt(pi) $

Итак, о/н базис $ cal(B)_G = {1/sqrt(2pi), (cos t)/sqrt(pi),  (sin t)/sqrt(pi), ..., (cos n t)/sqrt(pi),  (sin n t)/sqrt(pi) } $

3) Проектируем $f(t)$ на $G$, то есть ищем о/н проекцию $x_0 = T(t)$. Так как $cal(B)_G-$ о/н, то $cal(G) = I.$ Тогда СЛАУ для определения координат $x_0$ будет:
$ I dot mat(lambda_1; dots.v; lambda_k) = mat((x, e_1); dots.v; (x, e_k)), " то есть" lambda_i = (x, e_i) $
Здесь $lambda_i = (f(t), e_i)$, где $e_i in cal(B)_G = {1/sqrt(2pi), (cos t)/sqrt(pi),  (sin t)/sqrt(pi), ..., (cos n t)/sqrt(pi),  (sin n t)/sqrt(pi)}. $
Таким образом, $T(t)$, как о/н проекция $f(t)$ на $G$ будет иметь вид:
$ T(t) = (f(t), 1/sqrt(2pi) ) 1/sqrt(2pi) + (f(t), (cos t)/sqrt(pi)) (cos t)/sqrt(pi) + (f(t), (sin t)/sqrt(pi)) (sin t)/sqrt(pi) + \ + ... + (f(t), (cos n t)/sqrt(pi)) (cos n t)/sqrt(pi) + (f(t), (sin n t)/sqrt(pi)) (sin n t)/sqrt(pi) = \ = (integral_(-pi)^pi f(t) 1/sqrt(2pi) dif t) 1/sqrt(2pi) + (integral_(-pi)^pi f(t) 1/sqrt(pi) dif t) (cos t)/sqrt(pi) + (integral_(-pi)^pi f(t) 1/sqrt(pi) dif t) (sin t)/sqrt(pi) + \ + ... + (integral_(-pi)^pi f(t) 1/sqrt(pi) dif t) (cos n t)/sqrt(pi) + (integral_(-pi)^pi f(t) 1/sqrt(pi) dif t) (sin n t)/sqrt(pi) = \ = 1/(2pi) integral_(-pi)^pi f(t) dif t + 1/pi integral_(-pi)^pi f(t) cos t dif t cos t + 1/pi integral_(-pi)^pi f(t) sin t dif t sin t + \ +...+ 1/pi integral_(-pi)^pi f(t) cos n t dif t cos n t + 1/pi integral_(-pi)^pi f(t) sin n t dif t sin n t $
Итого:
$ T(t) = a_0/2 + sum_(i=1)^n (a_i cos i t + b_i sin i t), "где" $
$ a_0 = 1/(2pi) integral_(-pi)^pi f(t) dif t $
$ a_i = 1/pi integral_(-pi)^pi f(t) cos i t dif t $
$ b_i = 1/pi integral_(-pi)^pi f(t) sin i t dif t $
$ T(t) -  "тригонометрический многочлен Фурье." $
\
#nota[
  Эта же задача (о перпендикуляре) является основой для метода наименьших квадратов.

  Задача: предполагается, что есть линейная зависимость $ y = lambda_1 x_1 + lambda_2 x_2 + ... + lambda_n x_n $
  Из эксперимента получают набор данных: \
  $k-$ое испытание: $y_k = lambda_1_k x_1_k + lambda_2_k x_2_k + ... + lambda_n_k x_n_k $

  Все уравнения дают несовместную СЛАУ. Поэтому ищем прямую $ y = sum_(i=1)^n lambda_i x_i, "наименее отстоящую от данных эксперимента." $
  Для этого вводят расстояние $ h^2 = sum_(i=1)^k (lambda_i x_i - y_i)^2 eqlong(top:"об.") sigma^2 - \ "средне-квадратичное отклонение (минимизируем)." $ 

]

#pagebreak()

= 8. #underline[Линейные операторы]
== 8.1 Отображение в линейном пространстве
\
Будем работать в $V, W$ -- линейных пространствах.

$x, y...-$ векторы ЛП.

$e_i, ...-$ базисы ЛП.

#def(title: "Линейная форма")[
  Функция $f:V->RR$, которая всякому $x in V$ сопоставляет $c in RR$ и:
  1. $f(x + y) = f(x) + f(y)$
  2. $f(lambda x) = lambda f(x)$
  называется #term[линейной формой].
]

#ex[
  $ f(x) eqlong(top:x=x(t), bottom:"ф-ция, непр. на " [a;b]) integral_a^b x(t) dif t = F(t)|_a^b $
]

#def(title: "Билинейная форма")[
  Функция $cal(B):V times V->RR$, которая каждой паре векторов $x, y in V$ сопоставляет число $c in RR$, и $cal(B)$ линейна по 1му и 2му аргументам, называется #term[билинейной формой]. 
]

#nota[
  Аналогично определяется полилинейная форма. Пример такой формы - определитель матрицы.
]

#def(title: "Линейное отображение")[
  $cal(A):V->U$ такое, что 
  1. $cal(A)(x+y) eqlong(top:forall x in V, bottom:forall y in V) cal(A)x + cal(A)y$
  2. $cal(A)(lambda x) = lambda cal(A)x $

  ($cal(A)x, cal(A)y in U$)
]

#def(title: "Линейный оператор")[
  Линейное отображение $cal(A)$ называется #term[линейным оператором], если действует из $V$ в (подмножество) $V$.
]

#pagebreak()

== 8.2 Линейные операторы. Основные понятия и свойства

#def(title: "Образ оператора")[
  $ Im_m cal(A) = {y in V | y = cal(A)x} $
]

#def(title: "Ядро оператора")[
  $ ker cal(A) = {x in V | cal(A) x = zero.slashed} $
]

#ex[
  $cal(A):RR^2->RR^2, cal(A) = R_0^phi$ -- оператор поворота.
  
  $cal(A)x = cal(A)(lambda e_1 + mu e_2) = lambda cal(A)e_1 + mu cal(A) e_2 = lambda e'_1 + mu e'_2$

  Таким образом сохраняется ЛК при переходе:
  ${e_1, e_2} -> {e'_1, e'_2}$

  $ker cal(A) = {emptyset}, \ Im_m cal(A) = RR^2$
]

#ex[
  $cal(A): RR^k -> RR^n, cal(A) x = A x, A - "матрица"$.
  
  $cal(A)(lambda x) = A(lambda x) = lambda (A x) = lambda cal(A) x; $
  
  $cal(A)(x_1 + x_2) = A (x_1 + x_2) = A x_1 + A x_2 = cal(A) x_1 + cal(A) x_2$
  
  $ker cal(A) = ? A x = 0  - "решение СЛАУ - ядро." \ Im_m cal(A) "можно найти, пользуясь теоремой ниже."$
]

#ex[
  $ cal(A): C_[a;b]^2 -> C_[a;b]^1 $ 
  $ cal(A)x = (dif x (t))/(dif t) eqlong(top:"об.") cal(D)(x) $
  В частности $C_[a;b]^n = cal(P)_n (t)$
  $ cal(D)(cal(P)_n (t)) = (cal(P)_n (t))' = (a_0 t^n + a_1 t^(n-1) + ... + a_n)' = \ = a_0 (t^n)' + a_1 (t^(n-1))' + ... + a_n (1)'  $

  
  $ker cal(A) = {cal(P)_0 (t)}, \ Im_m cal(A) = {cal(P)_(n-1) (t), n>=1}$
]

#th[
  $cal(A):V->V$. \ Тогда $ker cal(A), space Im_m cal(A) -$ подпространства $V$.
]
#proof[
  $ x_1, x_2 in ker cal(A) \ cal(A)(lambda x_1 + mu x_2) = lambda cal(A) x_1 + mu cal(A) x_2 = lambda zero.slashed + mu zero.slashed = zero.slashed \ zero.slashed in ker cal(A) $
  $ y_1, y_2 in Im_m cal(A) \ lambda y_1 + mu y_2 = lambda cal(A) x_1 + mu cal(A) x_2 = cal(A)(underbrace(lambda x_1 + mu x_2, x in V)) = cal(A)x = y in Im_m cal(A) $
]

#th[
  $ cal(A): V^n -> V^n. "Тогда" $  
  $ dim ker cal(A) + dim ker Im_m cal(A) = dim V = n $
]
#proof[
  Так как $ker cal(A)$ - подпространство, то в нем можно выделить базис ${e_1, ..., e_k}$. Дополним до базиса $V$: \ 
  ${e_1, e_2, ..., e_k, e_(k+1), ..., e_n} = cal(E)_V$ \ 
  Применим $cal(A)$ к базисным векторам:
  $ cal(A) e_1 = zero.slashed, cal(A) e_2 = zero.slashed, ... , cal(A) e_k = zero.slashed, ... , cal(A) e_(k+1) != zero.slashed,...,  cal(A) e_n != zero.slashed  $
  (так как иначе $e_(k+1), ... e_n in ker cal(A)$ и раскладывается по $e_1, ..., e_k$).

  Докажем, что ${cal(A) e_(k+1), ..., cal(A) e_n} - $ ЛНЗ.

  Составим ЛК: $ lambda_1 cal(A) e_(k+1) + lambda_2 cal(A) e_(k+2) + ... + lambda_(n-k)cal(A)e_n = zero.slashed  $
  $ "Свойство линейности:" cal(A)underbrace((lambda_1 e_(k+1) + lambda_2 e_(k+2) + ... + lambda_(n-k)e_n), x in V) = zero.slashed  $
  $ cal(A)x = zero.slashed <=> x in ker cal(A) $
  Значит, что в разложении $x$ по $cal(E)_V$ ненулевая часть - разложение по базису ядра:
  $ X = underbrace(c_1 e_1 + c_2 e_2 + ... + c_k e_k, "подозрительная на тривиальность ЛК") + underbrace(zero.slashed, lambda_1) e_(k+1) + underbrace(zero.slashed, lambda_2) e_(k+2) + ... + underbrace(zero.slashed, lambda_(n-k)) e_n $
  $ forall lambda_i = 0 ==> "ЛК" lambda_1 cal(A) e_(k+1) + ... + lambda_(n-k)cal(A) e_n - "тривиальна." => $
  $ => {cal(A) e_(k+1), ..., cal(A) e_n} - "ЛНЗ и максимальная. Тогда это базис образа." $
  $ "Таким образом " dim ker cal(A) = k, space dim Im_m cal(A) = n-k, space k + (n-k) = n. $
]















#pagebreak()

== 8.3 Матрица линейного оператора


#nota[
  Если $cal(A):V->U$ (лин. отображение, не оператор), то выделим в $V$ и $U$ базисы $ cal(E)_V = {e_1, ..., e_n}, space cal(E)_U = {f_1, ..., f_m}. $
  $ forall e_i in V space exists y_j in U: cal(A) e_i = y_j = lambda_1 f_1 + ... + lambda_n f_n $
  $ cal(A)e_1 = a_11 f_1 + a_12 f_2 + ... + a_1m f_m $
  $ cal(A)e_2 = a_21 f_1 + a_22 f_2 + ... + a_2m f_m $
  $ dots.v $
  $ cal(A)e_n = a_(n 1) f_1 + a_(n 2) f_2 + ... + a_(n m) f_m $
  Коэффициенты $a_(i j)$ образуют матрицу линейного отображения $cal(A)$ -- #term[матрицу перехода] $cal(E)_V -> cal(E)_U$.
]

#def(title: "Матрица линейного оператора")[
  $ cal(A):V->V, space cal(E) = {e_1, e_2, ..., e_n} $
  $ cal(A) e_1 = e'_1 eqlong(top:e'_1 in V, bottom:"в том же пр-ве") a_11 e_1 + a_21 e_2 + ... + a_(n 1) e_n $
  $ dots.v $
  $ cal(A)e_n = e'_n = a_(1 n) e_1 + a_(2 n)e_n + ... + e_(n n) e_n $
  Коэффициенты $a_(i j)$ образуют квадратную матрицу в базисе $cal(E)$:
  $ mat(a_11, a_12, ..., a_(1 n); a_21, a_22, ..., a_(2 n); dots.v; a_(n 1), a_(n 2), ..., a_(n n)) mat(e_11, ...; e_12, ...; dots.v, ...; e_(1 n), ...) = mat(a_11 e_1 + a_12 e_12 + ... + a_(1 n) e_(1 n); dots.v) = mat(e'_1; dots.v; e'_n) $
]

#ex[
  $cal(A) = S_(O X) -$ осевая симметрия плоскости. \
  $e_1 = (1;0), e_2 = (0;1)$ \
  $e'_1 = (1;0) = 1 e_1 + zero.slashed e_2$ \
  $e'_2 = (0; -1) = -1 e_2 + zero.slashed e_1$ \
  $ cal(A) = mat(1, 0; 0, -1) $
  $arrow(x) = (1;1)$ \
  $cal(A) arrow(x) = mat(1,0;0,-1) mat(1;1) = mat(1;-1) = y'$
]
#nota[
  *Смена базиса и матрица линейного оператора* \ \
  В пространстве $V$ выбраны два базиса:
  - Старый базис: $cal(B) = {e_i}_(i=1)^n$
  - Новый базис: $cal(B)' = {e'_i}_(i=1)^n$
  
  Переход от старого базиса к новому задается матрицей перехода $cal(C)$ (то есть $cal(B)' = cal(B) dot cal(C)$). \
  Линейный оператор $cal(A)$ в старом базисе имеет матрицу $A_cal(B)$, а в новом — $A_(cal(B)')$. \
  Найдем формулу связи этих матриц: $A_cal(B) -> A_(cal(B)')$.

  #proof[
    *Шаг 1:*\
    Пусть оператор переводит вектор $x$ в вектор $y$: $cal(A)x = y$. \
    - В старом базисе $cal(B)$ векторы $x$ и $y$ имеют столбцы координат $X_cal(B)$ и $Y_cal(B)$.
    - В новом базисе $cal(B)'$ векторы $x$ и $y$ имеют столбцы координат $X_(cal(B)')$ и $Y_(cal(B)')$.
    
    *Шаг 2: Связь координат векторов* \
    Числовые координаты преобразуются в сторону, противоположную изменению базиса:
    $ X_cal(B) = cal(C) dot X_(cal(B)') quad "и" quad Y_cal(B) = cal(C) dot Y_(cal(B)') $
    
    *Шаг 3: Подстановка в уравнение оператора* \
    Запишем действие оператора в старом базисе $cal(B)$:
    $ A_cal(B) dot X_cal(B) = Y_cal(B) $
    
    Подставим вместо старых координат выражения через новые из Шага 2:
    $ A_cal(B) dot (cal(C) dot X_(cal(B)')) = cal(C) dot Y_(cal(B)') $
    
    *Шаг 4: Вывод* \
    Избавимся от матрицы $cal(C)$ перед $Y$ в правой части. Для этого умножим все уравнение слева на обратную матрицу $cal(C)^(-1)$:
    $ cal(C)^(-1) dot A_cal(B) dot cal(C) dot X_(cal(B)') = underbrace(cal(C)^(-1) dot cal(C), I) dot Y_(cal(B)') $
    $ (cal(C)^(-1) dot A_cal(B) dot cal(C)) dot X_(cal(B)') = Y_(cal(B)') $
    
    С другой стороны, в новом базисе $cal(B)'$ то же самое действие оператора по определению записывается через матрицу $A_(cal(B)')$:
    $ A_(cal(B)') dot X_(cal(B)') = Y_(cal(B)') $
    
    Из двух последних равенств:
    $ A_(cal(B)') = cal(C)^(-1) dot A_cal(B) dot cal(C) $
  ]
]

#pagebreak()

== 8.4 Действия с операторами


#def(title: "Действия с операторами")[
  $ cal(A), cal(B):V->V $
  
  1. Сумма операторов
  $ cal(A) + cal(B) <=> (cal(A) + cal(B))x = cal(A)x + cal(B)x $
  2. Умножение на число
  $ lambda cal(A) <=> (lambda cal(A))x = lambda (cal(A)x) $
  3. Нулевой оператор
  $ cal(O) <=> forall x in V ==> cal(O) x = zero.slashed $
  4. Противоположный оператор
  $ - cal(A) = (-1) cal(A) $
  5. Композиция операторов
  $ (cal(A) cal(B)) x = cal(A) (cal(B)x) $
  6. Тождественный оператор
  $ cal(J) <=> forall x in V ==> cal(J) x = x $
]

#th(title: "Свойства")[
  1. $ lambda (cal(A) cal(B)) = (lambda cal(A)) cal(B) $
  2. $ (cal(A) + cal(B)) cal(C) = cal(A) cal(C) + cal(B) cal(C) $
  3. $ cal(A) (cal(B) + cal(C)) = cal(A) cal(B) + cal(A) cal(C) $
  4. $ cal(A)(cal(B) cal(C)) = (cal(A) cal(B)) cal(C) $
]
#proof[
  Докажем равенство операторов, показав совпадение их результатов на произвольном векторе $x in V$: \ \
  
  *Доказательство свойства 1:*
  $ (lambda (cal(A) cal(B))) x 
  eqlong(top: "Опр. 2", bottom: "(число)") lambda ((cal(A) cal(B)) x) 
  eqlong(top: "Опр. 5", bottom: "(композ.)") lambda (cal(A) (cal(B) x)) = \
  eqlong(top: "Опр. 2", bottom: "(число)") (lambda cal(A)) (cal(B) x) 
  eqlong(top: "Опр. 5", bottom: "(композ.)") ((lambda cal(A)) cal(B)) x $
  
  *Доказательство свойства 2:*
  $ ((cal(A) + cal(B)) cal(C)) x 
  eqlong(top: "Опр. 5", bottom: "(композ.)") (cal(A) + cal(B)) (cal(C) x) 
  eqlong(top: "Опр. 1", bottom: "(сумма)") cal(A) (cal(C) x) + cal(B) (cal(C) x) = \
  eqlong(top: "Опр. 5", bottom: "(композ.)") (cal(A) cal(C)) x + (cal(B) cal(C)) x 
  eqlong(top: "Опр. 1", bottom: "(сумма)") (cal(A) cal(C) + cal(B) cal(C)) x $
  
  *Доказательство свойства 3:*
  $ (cal(A) (cal(B) + cal(C))) x 
  eqlong(top: "Опр. 5", bottom: "(композ.)") cal(A) ((cal(B) + cal(C)) x) 
  eqlong(top: "Опр. 1", bottom: "(сумма)") cal(A) (cal(B) x + cal(C) x) = \
  eqlong(top: "лин-сть", bottom: "оператора") cal(A) (cal(B) x) + cal(A) (cal(C) x)
  eqlong(top: "Опр. 5", bottom: "(композ.)") (cal(A) cal(B)) x + (cal(A) cal(C)) x 
  eqlong(top: "Опр. 1", bottom: "(сумма)") (cal(A) cal(B) + cal(A) cal(C)) x $
  
  *Доказательство свойства 4:*
  $ (cal(A) (cal(B) cal(C))) x 
  eqlong(top: "Опр. 5", bottom: "(композ.)") cal(A) ((cal(B) cal(C)) x) 
  eqlong(top: "Опр. 5", bottom: "(композ.)") cal(A) (cal(B) (cal(C) x)) = \
  eqlong(top: "Опр. 5", bottom: "(композ.)") (cal(A) cal(B)) (cal(C) x) 
  eqlong(top: "Опр. 5", bottom: "(композ.)") ((cal(A) cal(B)) cal(C)) x $ 
  
]


#def(title: "Обратный оператор")[
  $W - $ подпространство $V$ \
  $cal(A):V->W$\
  Оператор $cal(B):W->V$ называется #term[обратным оператором] для $cal(A)$, если $ cal(B)cal(A) =cal(A)cal(B) = cal(J) $
]

#th[
  Пусть $exists cal(A)^(-1) -$ обратный оператор для $cal(A)$, $cal(A)x = zero.slashed.$ Тогда $x = zero.slashed.$
]
#proof[
  Во-первых, покажем, что образ $zero.slashed$ при действии линейного оператора - ноль-вектор.
  $ cal(A)(zero.slashed) = cal(A)(sum_(i=1)^n 0 dot e_i) = sum_(i=1)^n 0 dot cal(A)(e_i) = zero.slashed $
  Здесь $cal(A) -$ обратимый:
  $ cal(A)x = zero.slashed | cal(A)^(-1) $
  $ cal(A)^(-1) cal(A) x = cal(A)^(-1) zero.slashed $
  $ cal(J) x = zero.slashed $
  $ x = zero.slashed $
]

#nota[
  Таким образом, ядро обратимого оператора $ker cal(A) = {zero.slashed}.$

  Тогда $dim Im_m cal(A) = dim V,$ если $cal(A):V->V$.
]
Этому утверждению эквивалентно следующее:
#th[
  Пусть $W$ — подпространство $V$, и $cal(A): V -> W$. \
  Оператор $cal(A)$ обратим тогда и только тогда, когда он является линейным изоморфизмом между пространствами $V$ и $W$:
  $ exists cal(A)^(-1) <=> cal(A) — "линейный изоморфизм" V "и" W $
]
#proof[
  Напомним, что $cal(A)$ является изоморфизмом, если оно одновременно сюръективно ($cal(A)V = W$) и инъективно ($forall x_1, x_2 in V: x_1 != x_2 => cal(A)x_1 != cal(A)x_2$).

  *(=>) Необходимость:* \
  Пусть существует обратный оператор $cal(A)^(-1)$. Докажем оба свойства изоморфизма:
  1. *Сюръективность* ($cal(A)V = W$): Возьмем любой вектор $y in W$. Для него существует вектор $x = cal(A)^(-1)y in V$. Тогда $cal(A)x = cal(A)(cal(A)^(-1)y) = cal(J)_W y = y$. Значит, каждый вектор из $W$ имеет прообраз, то есть $cal(A)V = W$.
  2. *Инъективность:* Предположим от противного, что существуют такие векторы $x_1 != x_2$, для которых их образы совпали: $cal(A)x_1 = cal(A)x_2$. \
  Тогда: $cal(A)x_2 - cal(A)x_1 = 0 ==> cal(A)(x_2 - x_1) = 0$. \
  Применим слева оператор $cal(A)^(-1)$: \
  $cal(A)^(-1) cal(A)(x_2 - x_1) = cal(A)^(-1)(0) ==> cal(J)_V (x_2 - x_1) = 0 ==> x_2 - x_1 = 0 ==> x_1 = x_2$. \
  Получили противоречие с условием $x_1 != x_2$. Значит, отображение инъективно. \
  Следовательно, $cal(A)$ — изоморфизм.

  *(<=) Достаточность:* \
  Пусть $cal(A)$ — изоморфизм (биекция). Тогда по определению биекции существует обратное отображение $cal(A)^(-1)$. Нам осталось доказать, что это отображение является *линейным* оператором.
  
  1. *Докажем свойство суммы:* Пусть $cal(A)x_1 = y_1$ и $cal(A)x_2 = y_2$, откуда $x_1 = cal(A)^(-1)y_1$ и $x_2 = cal(A)^(-1)y_2$. \
  Используя линейность исходного оператора $cal(A)$, сложим эти равенства:
  $ cal(A)x_2 + cal(A)x_1 = y_2 + y_1 ==> cal(A)(x_2 + x_1) = y_2 + y_1 $
  Применим к обеим частям отображение $cal(A)^(-1)$:
  $ cal(A)^(-1) cal(A)(x_2 + x_1) = cal(A)^(-1)(y_2 + y_1) $
  $ cal(J)_V (x_2 + x_1) = cal(A)^(-1)(y_2 + y_1) ==> x_2 + x_1 = cal(A)^(-1)(y_2 + y_1) $
  Подставим вместо $x_1$ и $x_2$ их выражения через обратный оператор:
  $ cal(A)^(-1)y_2 + cal(A)^(-1)y_1 = cal(A)^(-1)(y_2 + y_1) $
  
  2. *Докажем свойство скаляра:* Пусть $cal(A)x_1 = y_1 ==> x_1 = cal(A)^(-1)y_1$. Умножим на число $lambda$:
  $ lambda (cal(A)x_1) = lambda y_1 ==> cal(A)(lambda x_1) = lambda y_1 $
  Применим к обеим частям отображение $cal(A)^(-1)$:
  $ cal(A)^(-1) cal(A)(lambda x_1) = cal(A)^(-1)(lambda y_1) $
  $ cal(J)_V (lambda x_1) = cal(A)^(-1)(lambda y_1) ==> lambda x_1 = cal(A)^(-1)(lambda y_1) $
  Подставим выражение для $x_1$:
  $ lambda cal(A)^(-1)y_1 = cal(A)^(-1)(lambda y_1) $ \
  
  Оба свойства линейности доказаны. Значит, $cal(A)^(-1)$ — линейный оператор.
]

#nota[
  Часто используют термин #term["взаимно-однозначный оператор" линейного изоморфизма].
]

#ex[
  $ cal(A) = R_0^phi, space V = RR^2 $
  $ forall y in RR^2 space exists! x in RR^2: y = R_0^phi (x) "и" $
  $ y_1 = y_2 <=> R_0^phi (x_1) = R_0^phi (x_2) => x_1 = x_2 $
  $ ker R_0^phi = {zero.slashed}. "Тогда" exists cal(A)^(-1) = R_0^(-phi) $
  Матрица:
  $ cal(A)x = A x = mat(cos phi, - sin phi; sin phi, cos phi) x $
  $ det A = 1 != 0, "то есть" A - "невырожденная." $
]

#nota[
  Заметим, что 
  $ A^T dot A = mat(cos phi,  sin phi; -sin phi, cos phi) mat(cos phi, - sin phi; sin phi, cos phi) = mat(1,0;0,1) $
  $ A^T dot A = I $
  $ "Таким образом" A^(-1) = A^T. $
]

#def(title: "Ортогональный оператор")[
  Оператор $cal(T):V->V$ называется #term[ортогональным], если для его матрицы верно: $T^(-1) = T^T$.
]

#nota[
  Из предыдущего примера можно получить свойство матрицы $T$: 
  $ T^(-1) T = T^T T = I $
  При умножении столбца $T$ на себя: 1 \
  При умножении разных столбцов $T$: 0 \
  По определению: столбцы $T-$ о/н базис. \
  Применение такого оператора сохраняет расстояние и углы.
]


#pagebreak()

== 8.5 Собственные числа, собственные векторы

#def(title: "Инвариантное подпространство")[
  Инвариантное подпространство $U subset V-$ такое подпространство $V$, что $forall x in U ==> cal(A)x in U.$
]

#ex[
  $cal(A) = S_l -$ симметрия относительно прямой $l$.

  Здесь $l = <arrow(x)> - $ инвариантное подпространство неподвижных точек.
]

#nota[
  У $cal(A) = R_0^phi space U = {zero.slashed} -$ тривиальное инвариантное подпространство. 
]

#def(title: "Собственное число (значение), собственный вектор")[
  Если $ exists lambda in CC "и" x in V, x!=zero.slashed: cal(A)x = lambda x,$ то \ $lambda$ называется #term[собственным значением (числом)] оператора $cal(A)$, а \ $x$ - #term[собственным вектором] оператора $cal(A)$.
]

#ex[
  1. $cal(A) = cal(J). space forall x in V => cal(A)x = 1 dot x$
  2. $cal(A) = cal(O). space forall x in V => cal(A)x = zero.slashed = 0 dot x$
  3. $cal(A)x = mat(2,0;0,2)x = 2 dot x$
]

#def(title: "Собственное подпространство оператора")[
  Множество
  $ U_lambda = {x in V | cal(A)x = lambda x}, $
  где $lambda$ — собственное значение оператора $cal(A): V -> V$, называется #term[собственным подпространством] оператора $cal(A)$, соответствующим данному $lambda$.
]

#def(title: "Геометрическая кратность собственного числа")[
  $dim U_lambda eqlong(top:"об.") beta$ называют #term[геометрической кратностью] собственного числа $lambda$.
]

#th[
  $lambda - $ собственное число $cal(A) <=> lambda -$ корень многочлена $det(A - lambda I),$ где $A -$ матрица $cal(A)$.
]

#nota[
  Многочлен $det(A- lambda I)$ называется #term[характеристическим].
]

#def(title: "Вековое уравнение")[
  Уравнение $cal(A) - lambda cal(J) = 0$ называется #term[вековым].
]

Таким образом, найти $lambda$ можно, если решить уравнение $det(A-lambda I) = 0.$
#proof[
  *Необходимость:*
  $ lambda - "с.ч." cal(A) <=> cal(A)x = lambda x, x!= zero.slashed $
  Запишем в матричном виде $ A x = lambda x = lambda I x, space I - "единичная матрица соответсвующей размерности." $
  $ underbrace((A-lambda I), "м-ца некоторого оператора" chi ) x = zero.slashed <=> chi x  =zero.slashed $
  Таким образом $x = zero.slashed$ попадает в $ker chi$, причем $dim ker chi >= 1$, тогда $dim Im_m chi < n$. То есть в подпространстве $Im_m chi$ меньше $n$ базисных векторов. Любая система из $n$ векторов пространства $Im_m chi$ будет иметь ранг меньше $n$.
  Матрица $A-lambda I$ составлена из $chi(e_1), chi(e_2), ..., chi(e_n),$ где ${e_i}_(i=1)^n -$ базис $V$. Следовательно, $A-lambda I-$ вырождена, то есть $|A-lambda I|=0.$ Иначе говоря, $lambda -$ корень $|A-lambda I|=0$.

  *Достаточность:*
  $lambda -$ корень $|A - lambda I| = 0$.
  $ r(A - lambda I) < n $
  $ dim Im_m (A-lambda I) < n $
  $ dim ker (A - lambda I) >= 1 $
  $ exists x!=zero.slashed: x in ker (cal(A) - lambda cal(J)) <=> (cal(A) - lambda cal(J))x = 0 <=> (A-lambda I) x = zero.slashed <=> A x = lambda x $
]

#nota[
  Далее эквивалентное определение #term[ранга оператора]:
  $ r(cal(A)) = dim Im_m cal(A) $
]

#nota[
  Характеристический многочлен не зависит от выбора базиса.
  $ cal(E)->cal(B): A_cal(B) = C^(-1) A_cal(E) C $
  $ |A_cal(B)|= |C^(-1) A_cal(E) C| = |C^(-1)| dot |A_cal(E)|dot|C| = |A_cal(E)| dot |C^(-1) dot C| = |A_cal(E)| $
  Таким образом $det(A)$ в любом базисе один и тот же (инвариант оператора относительно преобразования базиса).

  Тогда $ det(A-lambda I) = mat(delim:"|", a_11 - lambda, ..., ...; ..., a_22 - lambda, ...; ..., ..., a_(n n) - lambda) = P_n (lambda) $ имеет одни значения в разных базисах. То есть значение $lambda$ не зависит от выбора базиса.
]

#nota[
  По основной теореме алгебры, $|A-lambda I| = P_n (lambda)$ имеет $n$ корней (в $CC$), но не обязательно вещественных и различных. 

  Важным случаем является наличие вещественных попарно различных собственных чисел.
]

#th[
  Различным собственным числам соответствуют ЛНЗ собственные векторы.
]
#proof[
  Докажем для $lambda_1 != lambda_2$ при $dim V = 2$. \
  Нужно доказать, что если $A x_1 = lambda_1 x_1$ и $A x_2 = lambda_2 x_2$, то $lambda_1 != lambda_2$.
  $=> {x_1, x_2} -$ ЛНЗ, то есть $c_1 x_1 + c_2 x_2 = 0$ должна быть тривиальна.

  Применим $cal(A)$ к ЛК:
  $cal(A)(c_1 x_1 + c_2 x_2) = zero.slashed$
  $ c_1 cal(A) x_1 + x_2 cal(A) x_2 = c_1 lambda_1 x_1 + c_2 lambda_2 x_2 = zero.slashed space (1) $
  Домножим ЛК на $lambda_1$:
  $ lambda_1 (c_1 x_1 + c_2 x_2) = zero.slashed space (2) $
  Из (1) вычтем (2):
  $ c_1 lambda_1 x_1 + c_2 lambda_2 x_2 - lambda_1 c_1 x_1 - lambda_1 c_2 x_2 = zero.slashed $
  $ (lambda_2-lambda_1) c_2 x_2 = zero.slashed $
  Но $x_2 != 0, lambda_1 != lambda_2.$ Значит $c_2 = 0, c_1 = 0.$

  Для $k$ чисел $lambda_1, lambda_2, ..., lambda_k$ -- индукционный переход: ${x_1, x_2, ..., x_k} - $ ЛНЗ $=> {x_1, x_2, ..., x_k, x_(k+1)} -$ ЛНЗ.
]

#nota[
  Если у $cal(A):V^n -> V^n$ $n$ различных собственных чисел $lambda_i$, то им соответствуют $n$ ЛНЗ собственных инвариантных подпространств $U_lambda_i$.
  При этом размерность каждого $U_lambda_i$ равна 1 (можно доказать, что объединение базисов всех $U_lambda_i-$ ЛНЗ система, то есть базис). \ То есть из собственных векторов складывается базис $V$.
]

Сделаем вывод о кратностях $lambda_i$.

#def(title: "Алгебраическая кратность")[
  Кратность $lambda_i$ как корня $|A-lambda I|$ называется #term[алгебраической кратностью]. \
  Обозн.: $alpha$.
]

#nota[
  Геометрическая кратность $beta_lambda <= alpha_lambda$.
]

#ex[
  $ cal(J) x = lambda x $
  $ |I - lambda I| = 0 $
  $ mat(delim:"|", 1-lambda, ..., 0; dots.v, ...; 0, ..., 1- lambda) = 0 $
  $ (1-lambda)^n  = 0 $
  $ lambda_i = 1, alpha_lambda = n. $
  $ forall lambda_i = 1: (I - lambda I)x = zero.slashed $
  $ 0 x = zero.slashed => x-"любой вектор из" V $
  $ U_lambda = V $
  $ dim U_lambda = n = beta_lambda $
  $ "Здесь" alpha = beta. $
  В качестве базиса из собственных векторов можно взять стандартный базис в $V$.
]

#nota[
  В качестве различных $lambda_i$ все $U_lambda_i-$ одномерны и $V=plus.big U_lambda_i -$ прямая сумма.
]

#th[
  $cal(A): V^n -> V^n, cal(E) = {e_i}_(i=1)^n -$ базис $V^n$ и $A -$ матрица $cal(A)$ в $cal(E)$. \ 
  Причем, $e_i -$ собственные векторы $cal(A)$. Тогда $A -$ диагональна.
]
#proof[
  Пусть все базисные векторы $e_j$ являются собственными векторами оператора $cal(A)$ с соответствующими собственными числами $lambda_j$. По определению:
  $ cal(A)e_j = lambda_j e_j, quad forall j = 1, ..., n $
  Разложим образ каждого базисного вектора по элементам этого же базиса:
  $ cal(A)e_1 = lambda_1 e_1 + 0 dot e_2 + ... + 0 dot e_n \
  cal(A)e_2 = 0 dot e_1 + lambda_2 e_2 + ... + 0 dot e_n \
  ... \
  cal(A)e_n = 0 dot e_1 + 0 dot e_2 + ... + lambda_n e_n $
  
  Поскольку $j$-й столбец матрицы оператора составляется из коэффициентов разложения вектора $cal(A)e_j$, получаем, что на главной диагонали стоят числа $lambda_j$, а все внедиагональные элементы равны нулю. Матрица принимает диагональный вид:
  $ A = mat(lambda_1, 0, ..., 0; 0, lambda_2, ..., 0; dots.v, dots.v, dots, dots.v; 0, 0, ..., lambda_n) $
]

Обратно тоже верно.

#th[
  Матрица $A$ в $cal(E) = {e_i}_(i=1)^n$ имеет вид $A = mat(a_11, 0, ..., 0; 0, a_22, ..., 0; dots.v, dots.v, dots, dots.v; 0, 0, ..., a_(n n))$. Тогда ${e_i}_(i=1)^n -$ собственные векторы $cal(A)$.
]
#proof[
  Чтобы найти образ $i$-го базисного вектора, умножим матрицу оператора на вектор-столбец координат $e_i$ (у которого на $i$-м месте стоит $1$, а на остальных — $0$). Мы можем расписать это умножение как выделение $i$-го столбца матрицы $A$:
  
  $ cal(A)e_i = A e_i = mat(a_11, 0, ..., 0; 0, a_22, ..., 0; dots.v, dots.v, dots, dots.v; 0, 0, ..., a_(n n)) mat(0; dots.v; 1; dots.v; 0) = \ = 
  mat(0; dots.v; 0; dots.v; 0) + ... + mat(0; dots.v; a_(i i); dots.v; 0) + ... + mat(0; dots.v; 0; dots.v; 0) = mat(0; dots.v; a_(i i); dots.v; 0) $
  
  Перейдем от полученного столбца координат обратно к разложению по векторам базиса $cal(E)$:
  $ cal(A)e_i = 0 dot e_1 + ... + a_(i i) e_i + ... + 0 dot e_n = a_(i i) e_i $
  
  Поскольку по определению базиса вектор $e_i != 0$, полученное равенство $cal(A)e_i = a_(i i) e_i$ (выполняющееся для каждого $i = 1, ..., n$) доказывает, что все базисные векторы $e_i$ являются собственными векторами оператора $cal(A)$.
]

#pagebreak()

== 8.6 Сопряженные операторы


#nota[
  Дальше будем работать только в евклидовом пространстве над полем $RR$. То есть оператор $cal(A)$ будет действовать $cal(A): E_RR^n->E_RR^n$.
]

#def(title: "Сопряженный оператор")[
  Оператор $cal(A)^* : E_RR^n -> E_RR^n$ называется 
  #term[сопряженным к оператору] $cal(A)$, если 
  в любом ортонормированном базисе его матрица 
  равна $A^top$ — транспонированной матрице 
  оператора $cal(A)$.
]

#def(title: "Сопряженный оператор")[
  $cal(A)^*-$ оператор, #term[сопряженный к оператору] $cal(A),$ если $(cal(A)x, y) = (x, cal(A)^* y)$. $x,y-$ векторы $E^n$, $(x, y)-$ скалярное произведение.
]

#th[
  def1 $<=>$ def2
]
#proof[
   В о/н базисе скалярное произведение имеет вид $(x,y) = X^T Y$. \ 
  
  Столбец координат вектора $cal(A)x$ равен $A X$. \
  Столбец координат вектора $cal(A)^* y$ равен $A^* Y$. \ 
  
  Тогда:
  $ (cal(A)x, y) = (A X)^T Y = X^T A^T Y = X^T (A^T Y) $
  
  1) *Переход (def1 => def2):* Если нам дано $A^* = A^T$, то подставляя это в цепочку, получаем:
  $ X^T (A^T Y) = X^T (A^* Y) = (x, cal(A)^* y) $
  Равенство $(cal(A)x, y) = (x, cal(A)^* y)$ доказано. \ \
  
  2) *Переход (def2 => def1):* Если нам изначально дано равенство $(cal(A)x, y) = (x, cal(A)^* y)$, это означает, что для любых столбцов координат $X$ и $Y$ выполняется:
  $ X^T A^T Y = X^T A^* Y $
  В силу произвольности выбора векторов $x$ и $y$, матрицы внутри этой формы обязаны совпадать, следовательно: $A^* = A^T$.
]


*Свойства:*
1. $cal(J)^* = cal(J) $
2. $(cal(A) + cal(B))^* = cal(A)^* + cal(B)^* $
3. $(cal(A) cal(B))^* = cal(B)^* cal(A)^* $
4. $(lambda cal(A)^*) = lambda cal(A)^* $
5. $(cal(A)^*)^* = cal(A)$


#def(title: "Самосопряженный оператор")[
  Самосопряженный оператор -- оператор, равный своему сопряженному. $ cal(A) = cal(A)^*. $
]

#mem[
  $ cal(A)^*:E_RR^n->E_RR^n <=> cases(delim:"[", "def1:" A^* = A^T, "def2:" (cal(A)x, y) = (x, cal(A)y)) $
  $ cal(A) - "самосопряженный" <=> cal(A) = cal(A)^* => A^* = A^T = A - "м-ца симметричная," $
  (оператор тоже называется симметричным).
]
\
*Свойства самосопряженных операторов*

1. 
#th[
  Собственные числа самосопряженного оператора - вещественны.
]
#proof[
  #nota[
    Раньше скалярное произведение -- это $(x,y) in R,$ такое что:
    1. $(x+y,z) = (x,z) +(y,z)$
    2. $(lambda x, y) = lambda (x, y)$
    3. $(x, y) = (y,x)$
    4. $(x,x)>=0; space (x,x) = 0 => x= zero.slashed$
    Обобщим на $CC$:
    скалярное произведение -- это $(x,y) in CC,$ такое что:
    1. $(x+y,z) = (x,z) +(y,z)$
    2. $(lambda x, y) = lambda (x, y)$
    3. $(x, y) = overline((y,x))$
    4. $(x,x)>=0; space (x,x) = 0 => x= zero.slashed$
  
  Тогда 2. в применении ко второму аргументу:
  $ (x, lambda y) = overline((lambda y, x)) = overline(lambda) dot overline((y,x)) = overline(lambda) (x, y) $
  Используем это для доказательства.
  ]

  $cal(A)-$ самосопряженный оператор $<=> (cal(A)x, y) = (x, cal(A) y)$ \
  Пусть $lambda in CC-$собственное число $cal(A)$. \
  $(cal(A)x, x) = (x, cal(A)x) eqlong(top:cal(A)x = lambda x) (x, lambda x)= overline(lambda) (x,x) = overline(lambda) x^2$ \
  $(cal(A)x, x) = lambda(x,x) = lambda x^2$ \
  Получили, что $lambda = overline(lambda) => lambda in RR.$
]


2. 
#th[
  Различным собственным числам самосопряженного оператора $cal(A)$ соответствуют ортогональные собственные векторы. То есть \
  $cal(A)x_1 = lambda_1 x_1, space cal(A)x_2 = lambda_2 x_2, space lambda_1 != lambda_2 ==> x_1 perp x_2 $
]
#proof[
  $(cal(A)x, y) = (x, cal(A)y)$ \
  Причем, если $lambda-$ собственное число, то 
  $ (cal(A)x, x) = (lambda x, x) = lambda (x,x) = (x, lambda x) = (x, cal(A) x) $
  Рассмотрим $ (cal(A)x_1, x_2) = (lambda_1 x_1, x_2) = lambda_1 (x_1, x_2) $
  $ (x_1, cal(A) x_2) = (x_1, lambda_2 x_2) = lambda_2 (x_1, x_2) $
  Так как $cal(A)-$ самосопряженный оператор, то $ (cal(A)x_1, x_2) = (x_1,cal(A) x_2) ==> lambda_1 (x_1, x_2) = lambda_2 (x_1, x_2). $
  Тогда $ (lambda_1 - lambda_2)(x_1-x_2) = zero.slashed $
  $ (x_1, x_2) = zero.slashed <=> x_1 perp x_2 $  
]

#nota[
  Докажем лемму об инвариантных подпространствах самосопряженного оператора, она поможет при доказательстве теоремы ниже.
]
#th[
  $cal(A): V^n -> V^n, cal(A)-$ самосопряженный оператор, $e-$ собственный вектор $cal(A)$. Тогда подпространство $U_1 = {x in V | x perp e}$ является инвариантным для $cal(A)$ и $dim U_1 = n-1$.   
]
#proof[
  $e$ порождает линейную оболочку, \ $U_1-$ ортогональное дополнение к $<e>$. \
  Причем $<e> plus.o U_1 = U^n$ \
  По th о размерностях: $dim U_1 = n-1.$ \
  Докажем, что $cal(A) x in U_1$ (инвариантность), то есть $cal(A) x perp e$. \
  Рассмотрим $(cal(A)x, e) = (x, cal(A) e) = (x, lambda e) = lambda (x, e) = 0$ \
  $ cal(A)x perp e $
]

3. 
#th[
  $cal(A):V^n -> V^n, space cal(A)-$самосопряженный оператор. Тогда собственные векторы $cal(A):x_1, x_2, ..., x_n$ образуют ортогональный базис $V$.
]
#proof[
  Доказательство проведем методом математической индукции по размерности пространства $n$.
  
  1) *База индукции:* При $n=1$ утверждение тривиально, так как любой ненулевой вектор является собственным и образует базис.
  
  2) *Шаг индукции:* Пусть утверждение верно для всех пространств размерности $n-1$. Докажем для размерности $n$. \
  Характеристический многочлен оператора $cal(A)$ по основной теореме алгебры гарантированно имеет хотя бы один комплексный корень $lambda_1$. (Для самосопряженного оператора все корни вещественны). Ему соответствует собственный вектор $e_1 != 0$.
  
  Натянем на $e_1$ линейную оболочку $<e_1>$. По доказанной выше лемме, её ортогональное дополнение $U_1$ имеет размерность $n-1$ и является инвариантным подпространством для $cal(A)$. \
  
  Рассмотрим сужение (ограничение) оператора $cal(A)$ на это подпространство: $cal(A): U_1 -> U_1$. На этом подпространстве оператор по-прежнему остается самосопряженным. \
  
  По предположению индукции, для пространства $U_1$ размерности $n-1$ существует ортогональный базис из собственных векторов ${e_2, e_3, ..., e_n}$. \
  
  Поскольку все эти векторы ${e_2, ..., e_n}$ лежат внутри $U_1$, а $U_1$ по определению ортогонально вектору $e_1$, то вектор $e_1$ автоматически перпендикулярен всем остальным векторам:
  $ e_1 perp e_2, quad e_1 perp e_3, quad ..., quad e_1 perp e_n $
  
  Объединяя вектор $e_1$ и ортогональный базис подпространства $U_1$, мы получаем систему из $n$ собственных векторов ${e_1, e_2, ..., e_n}$, которые попарно ортогональны друг другу. По свойству ортогональных систем, они линейно независимы и образуют ортогональный базис всего пространства $V^n$. Шаг индукции доказан.
]

#nota[
  Даже у самосопряженного оператора собственные числа не обязаны быть различными, но их алгебраическая кратность всегда равна геометрической кратности. В свою очередь, составление базиса из собственных векторов позволяет диагонализировать матрицу.
]

#ex[
  $ cal(J) x = x, space I = mat(1,0,0;0,1,0;0,0,1) $
  $ cal(J) - "самосопряженный оператор" $
  $ |I - lambda I| = mat(delim:"|", 1-lambda, 0, 0; 0,1-lambda, 0; 0, 0, 1-lambda) = (1-lambda)^3 = 0 $
  $ lambda_(1,2,3) = 0 $ 
  $ e_(1,2,3) = ? $
  $ mat((1-1),0,0,0; 0, (1-1),0,0; 0, 0, (1-1), 0; augment: #3) "3 свободные переменные." $
  $ "Размерность пространства решений равна 3." $
]

#nota[
  Если алгебраическая кратность $alpha$ превышает геометрическую $beta$ ($alpha > beta$), то матрицу оператора можно привести не к диагональной, а к ленточной (жордановой) форме. \ Базис, в котором матрица имеет жорданову форму называется жордановым базисом.
]

4.
#th(title: "Спектральное разложение образа")[
   $ cal(A) = cal(A)^*, space cal(A):V^n->V^n $
   $ {e_1, ..., e_n} - "о/н базис" V^n "из собственных векторов. Тогда" $
   $ Im_m cal(A) = {y in V^n| y = sum_(i=1)^n lambda_i (x, e_i)e_i} $
]
#proof[
  Докажем для $dim V = 2$: \
  $ y = cal(A)x eqlong(top:"в" Im_m cal(A)) y_1 e_1 + y_2 e_2 = (y, e_1)e_1 + (y, e_2)e_2 = \ = (cal(A)x, e_1)e_1 + (cal(A)x, e_2)e_2 = (x, cal(A)e_1)e_1 + (x, cal(A)e_2)e_2 = \ = (x, lambda_1 e_1)e_1 + (x, lambda_2 e_2)e_2 = lambda_1(x, e_1)e_1 + lambda_2(x, e_2)e_2 $
]

#def(title: "Проектор")[
  Оператор $cal(P)_i:V^n->V^1: cal(P)_i x = (x, e_i) e_i$ называется #term[проектором] на пространство $<e_i>$.
]

#nota[
  $cal(P)_i = cal(P)^*_i$ 
  #proof[
    $ (cal(P)_i x, y) = ((x, e_i)e_i, y) = (x,e_i)(e_i,y) = (x, e_i (e_i, y)) = (x, cal(P)_i y) $
  ]
]

Итак, согласно теореме о спектральном разложении образа самосопряженного оператора, действие $cal(A)$ равносильно сумме действий проекторов и растяжений:
$ cal(A)x = sum_(i=1)^n lambda_i cal(P)_i x $

#nota[
  Итак, спектральные теоремы:
  1. Собственные числа самосопряженного оператора - вещественны.
  2. Из собственных векторов составляется о/н базис $V^n$.
  3. Действие $A$ раскладывается (спектрально) в сумму $lambda_i cal(P)_i$.
  #def(title: "Спектр")[
    #term[Спектр] -- набор собственных чисел.
  ]
    4. Спектральное разложение произвольной матрицы $A$ (представление в виде произведения):
  $ A = cal(C) dot Lambda dot cal(C)^(-1) $
  где $Lambda = mat(lambda_1, 0, ..., 0; 0, lambda_2, ..., 0; dots.v, dots.v, dots, dots.v; 0, 0, ..., lambda_n)$ — диагональная матрица собственных чисел, а столбцы матрицы перехода $cal(C)$ составлены из координат собственных векторов оператора.

] 


#pagebreak()

== 8.7 Ортогональные операторы

#mem[
  #def(title: "Ортогональный оператор")[
    #term[Ортогональный оператор] $cal(U)$ с матрицей $U$: $U^T = U^(-1)$. 
  ]
]

#nota[
  Дадим эквивалентные определения:
  1. $(cal(U)x, cal(U)y) = (x,y)$
  2. Матрица сопр. оператора $U^*$ равна $U^(-1)$ (в любом о/н базисе).
  3. ${e_1, e_2, ..., e_n}-$ о/н базис $E^n$. Тогда ${cal(U)e_1,cal(U) e_2, ..., cal(U)e_n}-$ о/н базис $E^n$.
]

#nota[
  Ортогональный оператор сохраняет расстояния:
  $ (cal(U)x, cal(U)x) = ||cal(U)x||^2 = (x,x) = ||x||^2 \ ||cal(U)x||=||x|| $
]

#nota[
  Можно доказать эквивалентность def1 и def2:
  #proof[
    *Необходимость:*
    $ (cal(U)x, cal(U)y) = (x,y) eqlong(top: ?)> cal(U)^* = cal(U)^(-1) $
    $ (cal(U)x, cal(U)y) eqlong(top: "сопр. оп.") (x, cal(U)^* (cal(U)y) ) = (x,y) $
    $ (cal(U)x, cal(U)y) - (x,y) = 0 <=> (x, cal(U)^* (cal(U)y) ) - (x,y) = (x, (cal(U)^*cal(U) - cal(J))y) = 0 $
        $ (x, (cal(U)^*cal(U) - cal(J))y) = 0 $
    Поскольку это равенство должно выполняться для *любого* вектора $x in V^n$ (в силу его произвольности), единственный вектор, ортогональный всему пространству — это ноль-вектор:
    $ (cal(U)^*cal(U) - cal(J))y = 0 $
    Так как вектор $y$ также является произвольным, данный оператор переводит любой вектор пространства в ноль, а значит, сам оператор является нулевым:
    $ cal(U)^*cal(U) - cal(J) = cal(O) $
    $ cal(U)^*cal(U) = cal(J) $

    $ => (cal(U)^*cal(U) - cal(J))y = 0 $
    $ cal(U)^*cal(U) - cal(J) = cal(O) $
    $ cal(U)^*cal(U) = cal(J) $
    $ "Для матриц:" U^*U=I $
    $ U^* = U^(-1) $

    *Достаточность:*
    $ cal(U)^* = cal(U)^(-1) eqlong(top: ?)> (cal(U)x, cal(U)y) = (x,y) $
    $ (cal(U)x, cal(U)y) = (x, cal(U)^*cal(U)y) = (x,y) $
  ]
]

#nota[
  Заметим, что для симметричных и ортогональных операторов выполняется:
  1. $cal(A)cal(A)^* = cal(A)^*cal(A)$
  2. $cal(U)cal(U)^* = cal(U) cal(U)^(-1) = cal(J) = cal(U)^(-1)cal(U) = cal(U)^*cal(U) $
]

#def(title: "Нормальный оператор")[
  Оператор $cal(A)$ такой, что $cal(A)cal(A)^* = cal(A)^*cal(A)$ называется #term[нормальным].
]

#th(title: "Свойство нормального оператора")[
  Собственные векторы нормального оператора образуют о/н базис $E^n$.
]

\
#nota[
  *Доказательство $U^T dot U = I$ для размерности $n$ через элементы матрицы:* \ \
  Пусть задана ортогональная матрица $U$ размера $n times n$ и её транспонированная копия $U^T$:
  $ U = mat(
    a_11, a_12, ..., a_(1n);
    a_21, a_22, ..., a_(2n);
    dots.v, dots.v, dots, dots.v;
    a_(n 1), a_(n 2), ..., a_(n n)
  ), quad
  U^T = mat(
    a_11, a_21, ..., a_(n 1);
    a_12, a_22, ..., a_(n 2);
    dots.v, dots.v, dots, dots.v;
    a_(1n), a_(2n), ..., a_(n n)
  ) $

  Произведем матричное умножение по правилу «строка на столбец»:
  $ U^T dot U = mat(
    a_11^2 + a_21^2 + ... + a_(n 1)^2, ...;
    a_12 a_11 + a_22 a_21 + ... + a_(n 2) a_(n 1), ...;
    dots.v;
    a_(1n) a_11 + a_(2n) a_21 + ... + a_(n n) a_(n 1), ...) = $



  Так как столбцы матрицы $U$ образуют ортонормированный базис, выполняются условия:
  $ cases(
    a_(1i) a_(1j) + a_(2i) a_(2j) + ... + a_(n i) a_(n j) = 1 "," &"при" i = j,
    a_(1i) a_(1j) + a_(2i) a_(2j) + ... + a_(n i) a_(n j) = 0 "," &"при" i != j
  ) $

  Подставляем эти свойства в элементы результирующей матрицы:
  $ = mat(
    1, 0, ..., 0;
    0, 1, ..., 0;
    dots.v, dots.v, dots, dots.v;
    0, 0, ..., 1
  ) = I $

  Таким образом: $U^T dot U = I ==> U^T = U^(-1)$.
]


#pagebreak()

= 9. #underline[Билинейные и квадратичные формы]
== 9.1 Основные понятия


#mem[
  #def(title: "Билинейная форма")[
    Функция $cal(B):V times V->RR$, которая каждой паре векторов $x,y$ сопоставляет число $c in RR$ и линейна по 1му и 2му аргументу, называется #term[билинейной формой].
  ]
]

#th[
  $cal(E) = {e_1,...,e_n}-$ базис $V^n$ (не обязательно о/н). Тогда $ cal(B)(x,y) = sum_(i=1)^n sum_(j=1)^n b_(i j) x_i y_j, \ "где" {b_(i j)}_(i,j=1,...,n)-  "матрица билинейной формы." $
]
#proof[
  $ x = x_1 e_1 + x_2 e_2 $
  $ y = y_1 e_1 + y_2 e_2 $
  $ cal(B)(x,y) = cal(B)(x_1 e_1 + x_2 e_2, space y_1 e_1 + y_2 e_2) eqlong(top:"линейность", bottom:"из def") \ = cal(B)(x_1 e_1, space y_1 e_1 + y_2 e_2) + cal(B)(x_2 e_2, space y_1 e_1 + y_2 e_2) = \ = x_1 cal(B)(e_1, space y_1 e_1 + y_2 e_2) + x_2 cal(B)(e_2, space y_1 e_1 + y_2 e_2) = \ = x_1 cal(B)(e_1, y_1 e_1) + x_1 cal(B)(e_1, y_2 e_2) + x_2 cal(B)(e_2, y_1 e_1) + x_2 cal(B)(e_2, y_2 e_2) = \ = x_1 y_1 cal(B)(e_1, e_1) + x_1 y_2 cal(B)(e_1,e_2) + x_2 y_1 cal(B)(e_2,e_1) + x_2 y_2 cal(B)(e_2, e_2) = \ eqlong(top:"об.", bottom:b_(i j) = cal(B)(e_i, e_j))  x_1 y_1 b_11 + x_1 y_2 b_12 + x_2 y_1 b_21 + x_2 y_2 b_22 = \ = sum_(i,j=1)^n b_(i j) x_i y_j $ 
]

Итак, 
#def(title: "Матрица билинейной формы")[
  $ B = mat(b_11, b_12, ..., b_(1 n); dots.v; b_(n 1), b_(n 2), ..., b_(n n)) = mat(cal(B)(e_1,e_1), cal(B)(e_1,e_2),...;dots.v;cal(B)(e_n, e_1), cal(B)(e_n,e_2), ...) - $
  $ #term[матрица билинейной формы]. $
]

#ex[
  Скалярное произведение $(x,y)-$ билинейная форма. \
  Тогда $ B=mat((e_1,e_1), (e_1,e_2),...;dots.v;(e_n, e_1), (e_n,e_2), ...) = cal(G) - "матрица Грама." $
  Тогда скалярное произведение оформляется в матричном виде:
  $ (x,y) eqlong(top:(x,y)=cal(B)(x,y), bottom:x=sum x_i e_i "," y = sum y_i e_i) (x_1,x_2,...,x_n) dot cal(G) dot mat(y_1;y_2;dots.v;y_n) = x^T B y - \ "скалярное произведение через матрицу билинейной формы." $
]

#ex[
  $ E^2 = cal(P)_1 (t) = {a_0 + a_1 t | a_i in RR, t in [-1;1]} $
  $ cal(E) = {e_1, e_2} = {1,t} $
  $ "Ск. произв." (x(t),y(t)) = integral_(-1)^1 x(t) y(t) dif t $
  $ x(t) = 1+3t = 1 dot e_1 + 3 dot e_2 $
  $ y(t) = 2-t = 2 dot e_1 -1 dot e_2 $
  Найдем в матричном виде:
  $ (e_1, e_1) = integral_(-1)^1 1^2 dif t = t |_(-1)^1 = 2 $
  $ (e_1, e_2) = integral_(-1)^1 1 dot t dif t = 0 $
  $ (e_2, e_2) = integral_(-1)^1 t^2 dif t = lr(1/3 t^3 |)_(-1)^1 = 2/3 $
  $ cal(G) = mat(2,0; 0, 2/3) $
  $ (x,y) = (1,3) cal(G) mat(2;-1) = (1,3) mat(2,0; 0, 2/3) mat(2;-1) = 2 $
  2й способ:
  $ (x,y) = integral_(-1)^1 x(t) y(t) dif t = integral_(-1)^1 (1+3t)(2-t) dif t = 2 $
]


#def(title: "Виды билинейной формы")[
  Билинейная форма $cal(B)(x,y)$ называется
  1. #term[симметричной], если $cal(B)(x,y)=cal(B)(y,x)$
  
  2. #term[антисимметричной], если $cal(B)(x,y)=-cal(B)(y,x)$
  3. #term[кососимметричной], если $cal(B)(x,y)=overline(cal(B)(y,x))$ (комплексное сопряжение)
]
\
*Термины и свойства*

1. #term[Ранг билинейной формы] -- ранг ее матрицы.

2. $r(cal(B)(x,y)) eqlong(top:cal(B):V^n->RR) n,$ то $cal(B)$ -- #term[невырожденная].
3. $r(cal(B)_cal(E)) = r(cal(B)_cal(E)'), space cal(E), cal(E')-$ базисы $V^n$.
4. Переход от базиса $cal(E)$ к $cal(E')$: 
  
  $ B_(cal(E)') = P_(cal(E)->cal(E'))^T dot B_cal(E) dot P_(cal(E)->cal(E')) $
#nota[
  Если $P_(cal(E)->cal(E'))-$ ортогонален, то $P^T B_cal(E) P = P^(-1) B_cal(E) P $
]

#def(title: "Квадратичная билинейная форма")[
  Билинейная форма, примененная к $y=x$, называется #term[квадратичной].
  $ cal(B)(x,y) eqlong(top:y=x) cal(B)(x,x) $
]

#def(title: "Полярная квадратичная форма")[
  Симметричная билинейная форма $cal(B)(x,y)$, порождающая квадратичную форму при совпадении аргументов ($cal(B)(x,x)$), называется #term[полярной] для неё.
]

#ex[
  Рассмотрим вектор $u = (x,y,z) in RR^3$ \
  Квадратичная форма $ cal(B)(u,u) = sum_(i,j=1)^n u_i u_j b_(i j) = \ = u_1 u_1 b_11 + u_1 u_2 b_12 + u_1 u_3 b_13 + \ + u_2 u_1 b_21 + u_2 u_2 b_22 + u_2 u_3 b_23 + \ + u_3 u_1 b_31 + u_3 u_2 b_32 + u_3 u_3 b_33 = \ = b_11 x^2 + b_12 x y + b_13 x z + b_21 x y + b_22 y^2 + b_23 y z + b_31 x z + b_32 y z + b_33 z^2 $
  Квадратичная форма в $RR^3$ задает поверхность 2го порядка, а квадратичная форма в $RR^2$: $cal(B)(u,u)=a_11 x^2 + a_12 x y + a_22 y^2 -$ старшая группа в общем уравнении кривой 2го порядка.
]

#nota[
  Так как $x_i y_j eqlong(top:"в кв. форме") y_j x_i$, то матрица $B$ квадратичной формы симметрична. \
  Можно считать, что это матрица симметричного оператора.
]

#pagebreak()

== 9.2 Геометрия квадратичных форм. Поверхности II порядка.

#nota[
  В геометрии множества с уравнениями 2го порядка называют #term[квадриками].
]

*Понятие поверхности.*

Будем рассматривать поверхности, полученные непрерывной деформацией плоскости или ее части.

#image("images/photo_6.jpg", width: 50%)

\ 
*Построение. Кинематический метод.*

Поверхность получается непрерывным движением образующей по направляющей.

#image("images/photo_7.jpg", width: 50%)
\
#ex[
  Цилиндр получен движение образующей $p$ (прямой) по направляющей $d$ (окружности), причем $p perp D, d subset D$ (плоскость).
]

#def(title: "Линейчатая поверхность")[
  Поверхность, образованная прямыми, называется #term[линейчатой].
]

#image("images/photo_8.jpg")

#image("images/photo_9.jpg") седло (гиперболический параболоид)

#nota[
  Можно доказать, что общее уравнение поверхности 2го порядка
  $ A x^2 + B y^2 + C z^2 + D x y + E x z + F y z + G x + H y + I z + L = 0 $
  описывает только такие (невырожденные) поверхности:
]

*1. Цилиндры*

- Параболический: $y^2 = 2 p x$

- Гиперболический: $x^2/a^2 - y^2/b^2 = 1$
- Эллиптический: $x^2/a^2 + y^2/b^2 = 1$

#image("images/photo_10.jpg")
\
*2. Конус *

- $x^2/a^2 + y^2/b^2 - z^2/c^2 = 0 -$ вытянут вдоль оси $O z$

- $x^2/a^2 - y^2/b^2 - z^2/c^2 = 0 -$ вытянут вдоль оси $O x$
- $x^2/a^2 - y^2/b^2 + z^2/c^2 = 0 -$ вытянут вдоль оси $O y$

#image("images/photo_11.jpg")
\

*3. Эллипсоид*

 - $x^2/a^2 + y^2/b^2 + z^2/c^2 = 1$
 
 - $x^2 + y^2 + z^2 = a^2 -$ сфера

#image("images/photo_12.jpg")
#image("images/photo_13.jpg") 
\

*4. Параболоиды*

- Эллиптический: $x^2/a^2 + y^2/b^2 = z/c$

- Гиперболический: $x^2/p - y^2/q = 2z, space p q >0$

#image("images/photo_15.jpg")

#image("images/photo_14.jpg")

#image("images/photo_16.jpg")
\

*5. Гиперболоиды*

- Однополосный: $x^2/a^2 + y^2/b^2 - z^2/c^2 = 1$

- Двуполосный: $x^2/a^2 + y^2/b^2 - z^2/c^2 = -1$

#image("images/photo_17.jpg") 

#image("images/photo_18.jpg")


#nota[
  Как по уравнению определить тип поверхности?
]

*Метод сечений* (на примерах)

1. $x^2 + y^2 - z^2 = 0$
Сечение плоскостью $x=c, space x=0:$
$ z^2-y^2=c^2 $
$ z^2 - y^2 = 0 $
$ z = plus.minus y $

Сечение плоскостью $y=c, space y=0$:
$ x^2 + c^2 - z^2 = 0 $
$ x^2 - z^2 = 0 $
$ x = plus.minus z $

Сечение плоскостью $z=c, space z=0$:
$ x^2 + y^2 - c^2 = 0 $
$ x^2 + y^2 = 0 $

#image("images/photo_19.jpg")


\ 

2. $x^2 + y^2 = z$
Сечения $ x=0: y^2 = z \ 
y=0: x^2 = z \
z=0: x^2 + y^2=0
$

#image("images/photo_20.jpg") 
#pagebreak()

*Алгебраическое исследование*

#nota[
  Все поверхности заданы каноническими уравнениями. \
  Левая часть: $lambda_1 x^2 + lambda_2 y^2 + lambda_3 z^2, lambda_i in RR$ \
  Эта сумма задает квадратичную форму
  $ cal(B)(u,u) eqlong(top:u=(x,y,z)in RR^3) lambda_1 x^2 + lambda_2 y^2 + lambda^3 z^2 = (x,y,z) underbrace(mat(lambda_1,0,0;0,lambda_2,0;0,0,lambda_3), "диаг. м-ца кв. формы") mat(x;y;z) $
]

#def(title: "Канонические вид и базис квадратичной формы")[
  $ cal(B)(u,u) = sum_(i=1)^n lambda_i x^2_i "называется" #term[каноническим].$ \
  Базис, в котором $cal(B)(u,u)$ имеет диагональную матрицу $mat(lambda_1, 0, ...; dots.v, dots.v, ...; 0, ..., lambda_n)$ называется #term[каноническим].
]

#mem[
  Матрица билинейной формы $ B = mat(b_11, b_12, ..., b_(1 n); dots.v; b_(n 1), b_(n 2), ..., b_(n n)) = mat(cal(B)(e_1,e_1), cal(B)(e_1,e_2),...;dots.v;cal(B)(e_n, e_1), cal(B)(e_n,e_2), ...) $
]
Матрица квадратичной формы всегда симметрична ($B = B^T$), поэтому её можно рассматривать как матрицу некоторого самосопряженного оператора. Отсюда следует, что любая квадратичная форма может быть приведена к каноническому виду с помощью ортогонального преобразования базиса:
$ B_(cal(E)') = cal(P)^T dot B_cal(E) dot cal(P) $
где $cal(P) = P_(cal(E)->cal(E'))$ — матрица перехода, составленная из ортонормированных собственных векторов. Поскольку для ортогональной матрицы $cal(P)^T = cal(P)^(-1)$, закон преобразования формы совпадает с законом для операторов:
$ B_(cal(E)') = cal(P)^(-1) dot B_cal(E) dot cal(P) = mat(lambda_1, 0, ..., 0; 0, lambda_2, ..., 0; dots.v, dots.v, dots, dots.v; 0, 0, ..., lambda_n) $

#nota[
  Существуют и другие способы диагонализации квадратичных форм, не требующие поиска собственных чисел (например, метод Лагранжа и метод Якоби).
]



#th(title: "Метод Якоби")[
  Пусть $cal(B)(u,u)$ — невырожденная квадратичная форма в базисе $cal(E) = {e_1, e_2, ..., e_n}$. \
  Если все главные угловые миноры её матрицы отличны от нуля ($Delta_i != 0$), то существует и притом единственная матрица перехода к каноническому базису $cal(F) = {f_1, f_2, ..., f_n}$ треугольного вида:
  $ cases(f_1 = e_1, f_2 = alpha_12 e_1 + e_2, f_3 = alpha_13 e_1 + alpha_23 e_2 + e_3, ..., f_i = sum_(k=1)^(i-1) alpha_(k i) e_k + e_i) $
]
#proof[
  Матрица перехода $cal(P)$ от старого базиса $cal(E)$ к новому базису $cal(F)$ имеет верхнетреугольный вид:
  $ cal(P) = mat(
    1, alpha_12, alpha_13, ..., alpha_(1n);
    0, 1,        alpha_23, ..., alpha_(2n);
    0, 0,        1,        ..., alpha_(3n);
    dots.v, dots.v, dots.v, dots, dots.v;
    0, 0,        0,        ..., 1
  ) $
  
  Мы хотим, чтобы в новом базисе матрица $B_cal(F) = cal(P)^T B_cal(E) cal(P)$ стала диагональной. Это означает, что для любых различных индексов $i != j$:
  $ cal(B)(f_i, f_j) = 0 $
  
  Пусть для определенности $i < j$. Распишем вектор $f_j$ по условию теоремы через сумму и подставим во второй аргумент формы:
  $ cal(B)(f_i, f_j) = cal(B)(f_i, space sum_(k=1)^(j-1) alpha_(k j) e_k + e_j) $
  
  Используя свойство линейности билинейной формы по второму аргументу, вынесем знак суммы и коэффициенты $alpha$ за скобки:
  $ cal(B)(f_i, f_j) = sum_(k=1)^(j-1) alpha_(k j) cal(B)(f_i, e_k) + cal(B)(f_i, e_j) $
  
  Чтобы это выражение гарантированно равнялось нулю для любого $j$, достаточно потребовать, чтобы каждый вектор $f_i$ был «ортогонален» в смысле формы всем предыдущим старым базисным векторам $e_k$ (при $k < i$):
  $ cal(B)(f_i, e_k) = 0, quad text("для всех") k = 1, 2, ..., i-1 $
  
  Распишем это требование, подставив разложение для самого вектора $f_i$:
  $ cal(B)(alpha_(1 i) e_1 + alpha_(2 i) e_2 + ... + e_i, space e_k) = 0 $
  
  Пользуясь теперь линейностью формы по первому аргументу, раскрываем скобки:
  $ alpha_(1 i) cal(B)(e_1, e_k) + alpha_(2 i) cal(B)(e_2, e_k) + ... + alpha_(i-1, i) cal(B)(e_(i-1), e_k) + cal(B)(e_i, e_k) = 0 $
  
  Варьируя индекс $k$ от $1$ до $i-1$, мы получаем систему из $i-1$ линейных уравнений относительно $i-1$ неизвестных коэффициентов $alpha_(1 i), ..., alpha_(i-1, i)$:
  $ cases(
    alpha_(1 i) cal(B)(e_1, e_1) + alpha_(2 i) cal(B)(e_2, e_1) + ... + alpha_(i-1, i) cal(B)(e_(i-1), e_1) = -cal(B)(e_i, e_1),
    alpha_(1 i) cal(B)(e_1, e_2) + alpha_(2 i) cal(B)(e_2, e_2) + ... + alpha_(i-1, i) cal(B)(e_(i-1), e_2) = -cal(B)(e_i, e_2),
    ...
    alpha_(1 i) cal(B)(e_1, e_(i-1)) + alpha_(2 i) cal(B)(e_2, e_(i-1)) + ... + alpha_(i-1, i) cal(B)(e_(i-1), e_(i-1)) = -cal(B)(e_i, e_(i-1))
  ) $
  
  Матрицей коэффициентов этой СЛАУ является главный угловой минор матрицы $B_cal(E)$ порядка $i-1$. По условию теоремы Якоби, этот определитель отличен от нуля ($Delta_(i-1) != 0$). \
  Следовательно, по теореме Крамера, данная система имеет единственное решение. Это гарантирует существование и единственность всех коэффициентов $alpha_(k i)$ матрицы перехода. Теорема доказана.
]


#th(title: "Следствие из метода Якоби")[
  Если $cal(B)_cal(F)-$ диагональна и ее матрица $B_cal(F) = mat(lambda_1, 0, ..., 0; 0, lambda_2, ..., 0; dots.v, dots.v, dots, dots.v; 0, 0, ..., lambda_n)$, то \ $ lambda_i = Delta_i / Delta_(i-1), "где" Delta_i- "угловые миноры" B_cal(E) $
]

#proof[
  $ cal(B)_cal(F) = P^T B_cal(E)P eqlong(top: P - "верхнетр. м-ца,", bottom: det P = 1) |P^T|dot |B_cal(E)|dot|P| = 1 dot |B_cal(E)| dot 1 = |B_cal(E)| $
  $ underbrace(lambda_1 dot lambda_2 dot ... dot lambda_n, |B_cal(F)|) = underbrace(Delta_n, |B_cal(E)|) $
  Эта формула верна $forall i = 1,...,n$, то есть $ lambda_1 = Delta_1, lambda_2 = Delta_2/lambda_1 = Delta_2/Delta_1, \ lambda_3 = Delta_3/ (lambda_1 lambda_2) = Delta_3 / Delta_2, "и так далее." $
]
#pagebreak()

*Лирическое отступление*

Треугольные матрицы позволяют быстро найти $det$, решить СЛАУ, умножить матрицу на другую матрицу. \ Поэтому часто используют *$L U$ разложение матриц* $A = P L U$, где:
- $L$ — нижнетреугольная матрица (lower) с единицами на главной диагонали,
- $U$ — верхнетреугольная матрица (upper),
- $P$ — перестановочная матрица (permutation), учитывающая перестановку строк.

Для #term[регулярной] матрицы (у которой все главные угловые миноры $Delta_i != 0$) перестановочная матрица не требуется ($P = cal(I)$), и для неё $exists! space L U-$разложение вида $A = L U$.

#ex[
  Решим систему линейных уравнений $A X = B$ с помощью регулярного $L U$-разложения:
  $ A X = B quad <=> quad (L U) X = B quad <=> quad L(U X) = B $
  
  *Шаг 1. Прямая подстановка (Нахождение промежуточного вектора $Y$):* \
  Обозначим $U X = Y$ и решим систему $L Y = B$ относительно столбца $Y = mat(y_1; y_2; dots.v; y_n)$. \
  Поскольку матрица $L$ является нижнетреугольной, система имеет вид:
  $ mat(
    1,       0,       0,       ..., 0;
    l_21,    1,       0,       ..., 0;
    l_31,    l_32,    1,       ..., 0;
    dots.v,  dots.v,  dots.v,  dots, dots.v;
    l_(n 1), l_(n 2), l_(n 3), ..., 1
  ) mat(y_1; y_2; y_3; dots.v; y_n) = mat(b_1; b_2; b_3; dots.v; b_n) $
  Эта система легко решается сверху вниз: из первой строки сразу находим $y_1 = b_1$, из второй строки выражаем $y_2 = b_2 - l_21 y_1$, и так далее.
  
  *Шаг 2. Обратная подстановка (Нахождение итогового вектора $X$):* \
  Зная найденный столбец $Y$, переходим к решению исходной треугольной системы $U X = Y$ относительно столбца неизвестных $X = mat(x_1; x_2; dots.v; x_n)$:
  $ mat(
    u_11,   u_12,   u_13,   ..., u_(1n);
    0,      u_22,   u_23,   ..., u_(2n);
    0,      0,      u_33,   ..., u_(3n);
    dots.v, dots.v, dots.v, dots, dots.v;
    0,      0,      0,      ..., u_(n n)
  ) mat(x_1; x_2; x_3; dots.v; x_n) = mat(y_1; y_2; y_3; dots.v; y_n) $
  Эта система решается снизу вверх (обратным ходом): из последней строки находим $x_n = y_n / u_(n n)$, подставляем результат в строку выше, находим $x_(n-1)$, и так доходим до первой переменной $x_1$.
]


#pagebreak()


Вернемся к квадратичным формам.

#def(title: "Положительно определенная квадратичная форма")[
  $ forall u = (x_1, x_2, ..., x_n) != 0 ==> cal(B)(u,u) >0 $
]

#def(title: "Отрицательно определенная квадратичная форма")[
 $ forall u = (x_1, x_2, ..., x_n) != 0 ==> cal(B)(u,u) <0 $
]

#def(title: "Знакопеременная квадратичная форма")[
 $ exists u, v != 0: cal(B)(u,u)>0, space cal(B)(v,v)<0 $
]

#ex[
  $ "Эллипсоид: " underbrace(x^2/4 + y^2/9 + z^2/1, "полож. опред.") = 1 $
  $ "Гиперболоид: " underbrace(x^2 + y^2 - z^2, "знакоперем.") = 1 $
  $ "Параболоид (эллиптический): " x^2/4 + y^2/9 = -z/3 <=> \ <=> -(x^2/4 + y^2/9) = z/3, z < 0 $
]

#def(title: "Инерция квадратичной формы")[
  #term[Инерцией квадратичной формы] называется тройка чисел $(p,q,s)$, где \ $p-$ число положительных коэффициентов в каноническом виде квадратичной формы, \
  $q-$ число отрицательных, \
  $s-$ число нулевых. \ \
  $p-$ положительный индекс инерции, $q-$ отрицательный.
]
\ \
#th(title: "Закон инерции")[
  Инерция квадратичной формы не зависит от способа приведения к каноническому виду. \
]
Пояснение: \
Так как квадратичная форма задает поверхность (геом. смысл), а поверхность, как геометрический объект, не меняет свою форму и размеры при смене базиса (выборе системы координат), то и знаки собственных чисел $lambda_i$ (то есть индексы $p$ и $q$) сохраняются в разных системах координат.

#th(title: "Критерий знакоопределенности")[
  $cal(B)(u,u)- $ положительно определенная кв. форма $<=> p = n = dim V^n$
  $cal(B)(u,u)- $ отрицательно определенная кв. форма $<=> q = n = dim V^n$
]

#th(title: "Критерий Сильвестра о полож. опр. кв. форме")[
  $cal(B)(u,u)-$ положительно определенная кв. форма. $<=> forall Delta_k > 0, "где" Delta_k-"угловой минор матрицы" B.$
]
#proof[
  Доказательство на методе Якоби:
  $ lambda_k = Delta_k / Delta_(k-1) $
  *Достаточность:* \
  Если $forall Delta_k > 0$, то $forall lambda_k>0$. По критерию знакоопределенности: $cal(B)(u,u)-$ полож. опр. \
  *Необходимость:* \
   Покажем, что формула $lambda_k = Delta_k / Delta_(k-1)$ всегда применима, если $cal(B)(u,u)-$ полож. опр., то есть $forall Delta_k != 0.$ \
   Пусть $exists Delta_k = 0$
   $ Delta_k = mat(delim:"|", b_11, b_12, ..., b_(1 k); dots.v, dots; b_(1 k), b_(2 k), ..., b(k k )) = 0 => $
   $ => mat(b_11, b_12, ..., b_(1 k); dots.v, dots; b_(1 k), b_(2 k), ..., b(k k )) dot u = 0, space u-"к-л ненул. вектор" $
   Найдется нетривиальное решение $A X = 0$ с $|A| = 0$.
   Преобразуем СЛАУ:
   $ cases(
    b_11 u_1 + ... + b_(1 k) u_k = 0 | dot u_1,
    b_12 u_1 + ... + b_(2 k) u_k = 0 | dot u_2,
    dots.v,
    b_(1 k) u_1 + ... + b_(k k) u_k = 0 | dot u_k,
   ), "сложим строки:" $
   $ sum_(i,j=1)^k b_(i j) u_(i j) - "квадратичная форма k-го измерения" cal(B)(u,u) $
   Но $cal(B)(u,u)=0$ при $u!=0 => cal(B)(u,u)-$ не полож. опр. !? \
   Следовательно $cancel(exists) Delta_k !=0.$ Тогда справедлива формула $lambda_k = Delta_k/Delta_(k-1)$ и так как $forall lambda_k > 0 "(критерий выше)" => forall Delta_k >0$  
]

#nota[
  Аналогично можно доказать, что $ Delta_1 < 0, space Delta_k dot Delta_(k-1) < 0 <=> cal(B)(u,u) < 0 forall u != 0 $
]

#ex[
  Эллипсоид:
  $ x^2/4 + y^2/9 + z^2/1 = 1 <=> 9 x^2 + 4 y^2 + 36 z^2 = 36 $
  $ B = mat(9,0,0;0,4,0;0,0,36) $
  $ Delta_1 = 9 > 0 $
  $ Delta_2 = mat(delim:"|", 9,0;0,4) = 36 > 0 $
  $ Delta_3 = mat(delim:"|", 9,0,0;0,4,0;0,0,36) = 36^2 > 0  $
]

#ex[
  $ B_1 = mat(1,2,8;2,1,-5;8,-5,-3) $
  $ Delta_1 = 1 > 0 $
  $ Delta_2 = mat(delim:"|", 1,2;2,1) = 1-4 < 0 - "знакопеременная форма." $

  $ B_2 = mat(5,1,-1;1,5,0;-1,0,6) $
  $ Delta_1 = 5 >0 $
  $ Delta_2 = mat(delim:"|", 5,1;1,5) = 24 >0 $
  $ Delta_3 = mat(delim:"|",5,1,-1;1,5,0;-1,0,6) =139 >0 $

  $ lambda_1 = 5, space lambda_2 = 24/5, space lambda_3 = 139/24 $
  Канонический вид:
  $ 5x^2 + 24/5 y^2 + 139/24 z^2 = cal(B)(u,u) $
]
#pagebreak()#nota[
  *Об экстремуме функции нескольких переменных (ФНП)* \ \
  
  #mem[
    *Необходимое условие (НУ) экстремума $z=f(x,y)$:* \
    Если $M_0 (x_0, y_0)$ — точка экстремума, то:
    $ cases((partial z) / (partial x) (x_0, y_0) = 0, (partial z) / (partial y) (x_0, y_0) = 0) $
    Отсюда точка $M_0$ называется стационарной (подозрительной на экстремум). \ \
    
    *Достаточное условие (ДУ) экстремума:* \
    Пусть $M_0$ — стационарная точка, то есть выполняются уравнения НУ, и функция $z = f(x,y)$ является дважды непрерывно дифференцируемой в окрестности $M_0$.
  ]
  
  Обозначим значения в точке $M_0$:
  $ A = (partial^2 z)/(partial x^2)|_(M_0), quad B = (partial^2 z)/(partial x partial y)|_(M_0), quad C = (partial^2 z)/(partial y^2)|_(M_0) $
  $ Delta = mat(delim:"|", A, B; B, C) = A C - B^2 $
  
  Тогда если:
  1. $Delta > 0$ и $A > 0$, то $M_0$ — точка строгого локального минимума.
  2. $Delta > 0$ и $A < 0$, то $M_0$ — точка строгого локального максимума.
  3. $Delta < 0$, то в точке $M_0$ экстремума нет (седловая точка). \ \

  Заметим, что наличие экстремума равносильно постоянству знака приращения функции $Delta z$ в окрестности точки:
  - Точка минимума: $forall M != M_0 ==> z(M) > z(M_0) , space "то есть" space Delta z > 0$
  - Точка максимума: $Delta z < 0$ \ \
  
  Для дважды дифференцируемой функции $z(x,y)$ разложение приращения по формуле Тейлора имеет вид:
  $ Delta z = underbrace((partial z)/(partial x) Delta x + (partial z)/(partial y) Delta y, "линейная часть (первый дифф.)") + 1/2 d^2 z + o(Delta rho^2) $
  В стационарной точке первый дифференциал равен нулю, поэтому знак приращения $Delta z$ полностью определяется знаком второго дифференциала $d^2 z$. \ \

  Второй дифференциал в общем виде записывается как:
  $ d^2 z = ((partial)/(partial x) Delta x + (partial)/(partial y) Delta y)^2 z = (partial^2 z)/(partial x^2) (Delta x)^2 + 2 (partial^2 z)/(partial x partial y) Delta x Delta y + (partial^2 z)/(partial y^2) (Delta y)^2 $
  
  Считая приращения аргументов вектором $u = (Delta x, Delta y)$ и фиксируя частные производные в точке $M_0(x_0, y_0)$, мы получаем чистую квадратичную форму:
  $ d^2 z |_(M_0) = b_11 (Delta x)^2 + 2 b_12 Delta x Delta y + b_22 (Delta y)^2 $
  где коэффициенты матрицы формы равны:
  $ b_11 = lr((partial^2 z)/(partial x^2)|)_(M_0) = A, quad b_12 = lr((partial^2 z)/(partial x partial y)|)_(M_0) = B, quad b_22 = lr((partial^2 z)/(partial y^2)|)_(M_0) = C $
  
  Итак, если второй дифференциал $d^2 z$ в любом направлении (для любых приращений) строго положителен, то соответствующая ему квадратичная форма $cal(B)(u,u)$ является положительно определенной. \
  Тогда признак минимума ($d^2 z > 0 space forall u != 0$) по критерию Сильвестра равносилен условию:
  $ cases(A > 0, mat(delim:"|", A, B; B, C) > 0) $
  Аналогично, для максимума квадратичная форма должна быть отрицательно определенной, что по критерию Сильвестра требует чередования знаков миноров: $A < 0$ и $Delta > 0$.
]





#pagebreak()

= 10. #underline[Дифференциальные уравнения]
== 10.1 Основные определения
== 10.2 Некоторые интегрируемые ДУ первого порядка
== 10.3 ДУ высших порядков
=== 1 Непосредственно инт
=== 2 Допускающие понижение порядка заменой
=== 3 ЛДУ_n
==== 3.1 Решение ЛОДУ_2
==== 3.2 свойства решений ЛОДУ_2 с пост коэфф
==== 3.3 ФСР ЛОДУ_n
==== 3.4 ЛНДУ_2 (свойства решений)
==== 3.5 Поиск частного решения ЛНДУ
== 10.4 Системы ДУ
== 10.5 Элементы теории устойчивости



