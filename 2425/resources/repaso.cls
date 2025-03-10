\def\fileversion{1.0}
\def\filedate{2023/06/14}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{repaso}[\filedate\space Plantilla Repaso RDS Version \fileversion\space by J.Melchor]
\LoadClass{exam}
\DeclareOption{addpoints}{\addpoints}
\DeclareOption{answers}{\printanswers}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\RequirePackage{rdscolors}
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}
\renewcommand{\baselinestretch}{1}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\newcommand{\minitab}[2][l]{\begin{tabular}{#1}#2\end{tabular}}
\RequirePackage{enumitem}
\RequirePackage{xpatch}
\RequirePackage{xfrac}
\RequirePackage{xlop}
\RequirePackage{calculator}
\RequirePackage{cancel}
\RequirePackage{bohr}
\RequirePackage{chemfig}
\RequirePackage[version=4]{mhchem}
\RequirePackage{array}
\RequirePackage{afterpage}
\newcommand\blankpage{%
   \clearpage%
    \thispagestyle{plain}%
    % \addtocounter{page}{-1}%
     \null%
     \newpage}
\arrayrulecolor{rdsdark!80}
\renewcommand{\arraystretch}{1}
\RequirePackage{mytcolorboxes}
\RequirePackage{forest}
\RequirePackage{tikz}
\RequirePackage[all]{xy}
\usepackage{physics}
\renewcommand{\div}{\divisionsymbol}
\RequirePackage{tkz-euclide}
\RequirePackage{longdivision}
% Styles
\tikzset{>=latex} % for LaTeX arrow head
\tikzset{axis/.style={black, thick,->}}
\tikzset{vector/.style={>=stealth,->}}
\tikzset{every text node part/.style={align=center}}
\RequirePackage{pgfplots}
% \pgfplotsset{compat=1.18}
\RequirePackage{lscape}
\RequirePackage{amssymb,amsmath}
\input{insbox}
\usetikzlibrary{
    angles,
    3d,
    arrows,
    positioning,
    matrix,
    calc,
    chains,
    cd,
    decorations.pathreplacing,
    decorations.pathmorphing,
    decorations.markings,
    decorations.text,
    graphs,
    shapes,
    shapes.symbols,
    shapes.geometric,
    shapes.multipart,
    backgrounds,
    shadows,
    shadows.blur,
    trees,
    through,
    fit,
    snakes,
    patterns,
    mindmap,
    intersections,
    calendar,
    plotmarks,
    spy,
    quotes
}
\RequirePackage{addfont}
\RequirePackage{fetamont}
\RequirePackage{bbold}% se usa como \bbfamily [outlined]
\RequirePackage{comfortaa}% se usa en el nombre de la escuela \comfortaa [sand serif]
\RequirePackage{foekfont}% se usa en el numero de repaso \foekfamily [handwriting]
%\RequirePackage[rf]{electrum} %% lf option gives lining figures as default; 
%% remove option to get oldstyle figures as default
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\newcommand*\alterfont{\fontfamily{lmtt}\selectfont}%% se usa en la palabra repaso \alterfont [typewriting]
\RequirePackage{fontawesome5}
\RequirePackage{shadowtext}
\shadowoffsetx{0.75pt}
\shadowoffsety{0.5pt}
\shadowrgb{0.3, 0.3, 0.3}
\RequirePackage{ifthen}
\RequirePackage[
    % showframe=true,
    letterpaper,
    includehead,
    left=15mm,
    right=15mm,
    top=5mm,
    bottom=25mm,
    headheight=10mm,% Set \headheight to 10mm
]{geometry} % Custom margins
\RequirePackage{anyfontsize}
\RequirePackage{ragged2e}
\RequirePackage{fp}% http://ctan.org/pkg/fp
\newcommand{\HUGE}{\fontsize{50}{60}}
\RequirePackage{graphicx}
\graphicspath{{../images}} %Setting the graphicspath
\RequirePackage{calc}
\RequirePackage{mathtools}
% \RequirePackage{xparse}
% \ExplSyntaxOn
% \cs_new_eq:NN \calc \fp_eval:n
% \ExplSyntaxOff
\RequirePackage{titlesec}
\titleformat{\section}
{\normalfont\fontsize{10}{5}\bfseries\color{gray}}{\thesection}{0.5em}{}
\titlespacing*{\section}{0pt}{0em}{0.3em}
\titleformat{\subsection}
{\normalfont\fontsize{10}{5}\bfseries\color{lightgray}}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{0.5em}{0.3em}
\RequirePackage[colorlinks = true,urlcolor=colorrds, linkcolor = colorrds]{hyperref}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
        \node[shape=circle, draw,  minimum size=1.2em, inner sep=0pt, thick] (char) {#1};}}
\renewcommand\choicelabel{\circled{\thechoice}}
\setlength\linefillheight{.2in}
\AtBeginEnvironment{solutionbox}{\vspace{-0.1\baselineskip}}
\AtEndEnvironment{solutionbox}{\vspace{0.1\baselineskip}}
\AtBeginEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtBeginEnvironment{oneparchoices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparchoices}{\vspace{0.1\baselineskip}}
\AtBeginEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtBeginEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\renewcommand{\solutiontitle}{\noindent\hspace{-0.2cm}}
%\renewcommand\questionlabel{\color{Sepia}\bfseries\comfortaa\fbox{\thequestion}}
\renewcommand\questionlabel{}
\pointsinmargin
\pointformat{}
%\bracketedpoints
%\pointformat{\textcolor{DarkOliveGreen}{[\thepoints]}}
\pointpoints{punto}{puntos}
% Custom formatting for problem parts.
\newcommand{\midmatch}{\hspace{0.75in}\underline{\hspace{0.5in}}}
\renewcommand{\thepartno}{\alph{partno}}
\renewcommand{\partlabel}{\colorbox{gray!20}{\color{Sepia}\bfseries\comfortaa\thepartno}}
\newcommand{\tf}[1][{}]{%
    \fillin[#1][1cm]%
}
\checkboxchar{\faIcon[regular]{square}}
\CorrectChoiceEmphasis{\color{red!50!gray}\bf}
\checkedchar{\faIcon[regular]{check-square}}
\newenvironment{partsolved}{
    \printanswers
    \bgroup
}{
    \noprintanswers
    \egroup
}

%%%% Custom question command %%%%%
\newcounter{preguntanum}
\setcounter{preguntanum}{0}
\newcommand\questionboxed[2][0]{%
    \question[#1]\begin{pregunta}[adjusted title={ Ejercicio \thequestion} \hfill {\color{colorrds}\rule[-1mm]{0.7cm}{0.2mm} de \totalpoints \ \points}]%
        #2%
    \end{pregunta}
}%
%%%%% Example command
\newcounter{ejemplonum}
\setcounter{ejemplonum}{0}
\newcommand\ejemplosboxed[1][0]{%
    \refstepcounter{ejemplonum}%
    \begin{porejemplo}[adjusted title={Ejemplo \theejemplonum}]%
        \printanswers #1%
    \end{porejemplo}
}%
%%%%%%%%%% HOOKS (questions, parts and choices)
\renewcommand{\questionshook}{%
    \setlength{\topsep}{-20mm}%
    \setlength{\leftmargin}{0pt}%
    \labelwidth\leftmargin\advance\labelwidth+\labelsep%
}


\DeclareDocumentCommand\iconNamed{ m m m g }{%       
    \vspace{5pt}
    \begin{minipage}{1.5cm}
        \centering\scriptsize\sffamily
        \adjustbox{min size={0.4cm}{0.6cm},max size={0.8cm}{0.8cm}}
        {\color{#1}$\text{\faIcon{#3}}$\IfNoValueF{#4}{$^{\text{\faIcon{#4}}}$}} \\[1em]
        #2
    \end{minipage}\nobreak%
    \vspace{5pt}%
}

\newcommand\comillas[1]{``#1''}

\newcommand\icondescription[2][home]{
    \begin{minipage}{\linewidth}
        \begin{minipage}{.1\linewidth}
            \color{colorrds}\LARGE\faIcon[regular]{#1}
        \end{minipage}\hfill
        \begin{minipage}{.85\linewidth}
            \begin{tcolorbox}[size=small,halign=left,colframe=rdsdark,arc=3mm, sharp corners=west]
                \sffamily#2
            \end{tcolorbox}
        \end{minipage}
    \end{minipage}
}
% % Dimensions tuned to be about right.
% \renewcommand{\partshook}{
%   \setlength{\topsep}{-0.02in}%
%   \setlength{\leftmargin}{\leftmargin+0.08in}%
%   \setlength{\labelsep}{0.22in}%
% }

% \newlength{\mcindent}
% \setlength{\mcindent}{0.55cm}
% \renewcommand{\choiceshook}{%
%   % The dimensions are tuned to be about right. I should figure out how to not have random numbers.
%   \settowidth{\leftmargin}{W\hspace{\labelsep}\hspace{0.18in}\hspace{\mcindent}}
% }
%%%% INFO
\makeatletter
%%%% LOGO
\def\LOGO{%
    \begin{picture}(0,0)\unitlength=1cm
        \put (4.51,-1.02) {\includegraphics[width=2cm]{logo_shadow.png}}
        \put (4.5,-1.) {\includegraphics[width=2cm]{logo.png}}
    \end{picture}
}
%%%% INPUTS
\newcommand{\themateria}{1}
\newcommand{\materia}[1]{\renewcommand{\themateria}{#1}}
\newcommand{\thegrado}{1}
\newcommand{\grado}[1]{\renewcommand{\thegrado}{#1}}
\newcommand{\thenivel}{1}
\newcommand{\nivel}[1]{\renewcommand{\thenivel}{#1}}
\newcommand{\thecicloescolar}{1}
\newcommand{\cicloescolar}[1]{\renewcommand{\thecicloescolar}{#1}}
\newcommand{\theunidad}{1}
\newcommand{\unidad}[1]{\renewcommand{\theunidad}{#1}}
\newcommand{\theaprendizajes}{1}
\newcommand{\aprendizajes}[1]{\renewcommand{\theaprendizajes}{
        \begin{itemize}[leftmargin=*,label=\small\color{colorrds}\faIcon{user-graduate}]%
            #1%
        \end{itemize}%
    }}
\newcommand\thecontrol[1][]{%
    \ifprintanswers%
        {\begin{tikzpicture}[remember picture, overlay,shift=(current page.north east)]%
            \node[#1]{\autocontrol{\color{red}\alterfont\shadowtext{Soluciones propuestas}}};
        \end{tikzpicture}}%
    \else{}%
    \fi%
}
% \renewcommand{\questionlabel}{\colorbox{red} {\huge{\textbf{\color{white}~\thequestion.}}}}
% \renewcommand{\partlabel}{\colorbox{red} {\large{\textbf{\color{white}(\thepartno)}}}}
%%%% STYLES
\tikzset{
    nombrebox/.style={xshift=-.7\textwidth-3pt,
            yshift=-1.1cm,
            draw=none, fill=white, rectangle,
            inner xsep=2pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    aprendizajebox/.style={anchor=north,xshift=-.89\textwidth-3pt,
            yshift=-2cm,
            draw=none,%=colorrds, dashed,
            fill=white, rectangle,
            inner sep=10pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    aprendizajetitle/.style={
            fill=white,
            inner xsep=2pt,inner ysep=2pt,
            style=rounded corners,
            % drop shadow,
        },
    gradetablebox/.style={anchor=north east,xshift=-.21\textwidth-1pt,
            yshift=-2cm,
            draw=none,%=colorrds, dashed,
            fill=white, rectangle,
            inner sep=5pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    gradetableboxtitle/.style={
            fill=white,
            inner xsep=2pt,inner ysep=2pt,
            style=rounded corners,
            % drop shadow,
        }
}
%%%% COMMAND
\newcommand\fracquestion[2]{%
    \begin{minipage}[c][][t]{0.8cm}\begin{solutionbox}{1.3cm}\large\fillin[#1][0in]\end{solutionbox} \end{minipage}\hfill\begin{minipage}[c][][t]{0.7\linewidth} #2 \end{minipage}%
}
\newcount\segmentsleft
\tikzset{pics/.cd,
    circle fraction/.style args={#1/#2}{code={%
                    \segmentsleft=#1\relax
                    \pgfmathloop
                    \ifnum\segmentsleft<1\else
                    \ifnum\segmentsleft<#2 \edef\n{\the\segmentsleft}\else\def\n{#2}\fi
                    \begin{scope}[shift={(\pgfmathcounter,0)}]
                        \foreach \i [evaluate={\a=360/#2*(\i-1)+90;}] in {1,...,\n}
                        \fill[fill=lightgray] (0,0) -- (\a:3/8) arc (\a:\a+360/#2:3/8) -- cycle;
                        \draw circle [radius=3/8];
                        \ifnum#2>1
                            \foreach \i [evaluate={\a=360/#2*(\i-1);}] in {1,...,#2}
                            \draw (0,0) -- (90+\a:3/8);
                        \fi
                    \end{scope}
                    \advance\segmentsleft by-#2
                    \repeatpgfmathloop
                }}
}
\newcommand{\circlefraction}[2]{
    \adjustbox{
        stack,
        min size={0.2\textwidth}{80pt},
        max size={0.5\textwidth}{180pt}
    }{
        \begin{tikzpicture}
            \pic  at (0, 0) {circle fraction={#1/#2}};
        \end{tikzpicture} }%
}
\newcommand\quadraticseries[3]{%
    \def\diff{\calc{#2-#1}}%
    \def\siff{\calc{#3-#2}}%
    \def\const{\calc{\siff-\diff}}%
    \def\fiff{\calc{\siff+\const}}%
    \def\giff{\calc{\fiff+\const}}%
    \def\hiff{\calc{\giff+\const}}%
    \[ \lefteqn{\underbrace{\phantom{{#1},{#2}}}_{\diff}}{#1}, \overbrace{{#2},\lefteqn{\color{red}\underbrace{\phantom{{#3},\calc{#3+\fiff}}}_{\fiff}}{#3}}^{\siff}, \color{red}\overbrace{\calc{#3+\fiff},\lefteqn{\underbrace{\phantom{\calc{#3+\fiff}, \calc{#3+\fiff+\giff}}}_{\hiff}}\calc{#3+\fiff+\giff}}^{\giff}, \calc{#3+\fiff+\giff+\hiff}\]
}
\newcommand{\INFO}{%
    \begin{tikzpicture}[remember picture]
        \draw[colorrds,thin,xshift=-1.2\textwidth-5pt ,yshift=0cm,
            rounded corners=5pt] (0,0)
        rectangle
        (\textwidth-1pt,2.7cm);
        \node[xshift=-.95\textwidth , yshift=20pt] { \adjustbox{minipage=0.30\textwidth}{\fontsize{5}{1}\selectfont \comfortaa  \color{black!60} Última revisión del documento: \today} };
        %%%% TITULO
        \node[xshift=-.68\textwidth,
            rectangle,
            rounded corners=2pt,inner xsep=10pt,inner ysep=5pt,
            blur shadow={
                    shadow opacity=50,
                    shadow yshift=-1mm,
                    shadow blur steps=5,
                    shadow blur extra rounding=5pt
                }, fill=white]
        {
            \adjustbox{
                stack,
                color=MainColor,
                min size={0.4\textwidth}{10pt},
                max size={0.65\textwidth}{20pt}
            }{
                \centering \comfortaa %\sffamily \bfseries 
                \color{MainColor} \@title \ \theunidad
            }%
        };
        \node[nombrebox] (box) {
            \makebox[0.72\linewidth]{\textbf{\comfortaa \color{Sepia} Nombre del alumno: } \DrawLine[9.4cm]}
            \makebox[0.25\linewidth]{\textbf{ \comfortaa \color{Sepia} Fecha: } \ \DrawLine[3.6cm]}
        };
        %%%% APRENDIZAJES
        \node[aprendizajebox] (box) {\adjustbox{minipage=0.6\textwidth}{\theaprendizajes}};
        \node[aprendizajetitle,xshift=45pt,yshift=4pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Aprendizajes:};
        %%%% GRADESTABLE
        \node[gradetablebox] (box)
        {%
        \adjustbox{
        min size={0.05\textwidth}{50pt},
        max size={0.38\textwidth+3pt}{130pt}
        }{%
        \cellwidth{0.5em}\hqword{Pregunta}\hpgword{Página}\hpword{Puntos}\hsword{Obtenidos}\htword{Total}\vqword{Pregunta}\vpgword{P\'gina}\vpword{Puntos}\vsword{Obtenidos}\vtword{Total}%
        \arrayrulecolor{colorrds!30}%
        \ifnum\numquestions>7%
            {
            \ifnum\numquestions>20%
                {\ifthenelse{\isodd{\numquestions}}{\multirowgradetable{2}[questions]}{\multicolumngradetable{2}[questions]}}
                \else%
                {\multirowgradetable{2}[questions]}%\ifthenelse{\isodd{\numquestions}}{\multirowgradetable{2}[questions]}{\multicolumngradetable{2}[questions]}}
            \fi%
            }%
            \else{\gradetable[h][questions]}%
        \fi%
        }%
        };
        \node[gradetableboxtitle,xshift=-112pt,yshift=4pt] at (box.north east) {\bfseries \comfortaa \color{Sepia} Puntuación:};
    \end{tikzpicture}%
    \begin{tikzpicture}[remember picture, overlay,shift=(current page.north west)]
        %%%% LOGO
        \node[yshift=-3.5cm,xshift=-2.5cm]{\LOGO};
        %%%% SCHOOL TITLE
        \node[anchor=west, rectangle,yshift=-3cm,xshift=3.5cm,
            rounded corners=2pt,inner xsep=20pt,inner ysep=0pt]
        {
            \begin{minipage}{0.84\textwidth}
                \hspace{-0.4em}{\textbf{\color{colorrds}\fontsize{18}{14}\selectfont \comfortaa Escuela Rafael D\'iaz Serd\'an}}\\[0.1em]
                {\fontsize{14}{14}\selectfont {\color{SubjectColor}\themateria}  \hfill {\color{MainColor}\thegrado$^\circ$ de \thenivel} }\\[-0.2em]
                {\@author  \hfill Unidad \theunidad \hspace{2.4em} \thecicloescolar}
            \end{minipage}
        };
    \end{tikzpicture}%
    \thecontrol[yshift=-3.8cm,xshift=-0.5\textwidth,scale=1.5]
}
\newenvironment{mybox}[3][]{%
    \begin{tikzpicture}[#1]%
        \def\myboxname{#3}%
        % good options: minimum height, minimum width
        \node [draw, inner sep=0ex,  align=justify, draw=none]
        (BOXCONTENT) \bgroup\rule{0ex}{0ex}\ignorespaces
        }{%
        \egroup;
        \node [right, inner sep=3pt, outer sep=0pt,
            text height=2ex] (BOXNAME)
        at ([shift={(-1em,5pt)}]BOXCONTENT.north west) {\myboxname};
    \end{tikzpicture}%
}
\makeatother
\AtBeginDocument{
    % These commands set up the running header on the top of the exam pages
    \pagestyle{headandfoot}
    \firstpageheader{}{}{}
    \firstpagefooter{}{  \color{colorrds}\thepage \ de \numpages}{}
    \ifprintanswers
        \runningheader{{\color{SubjectColor}\themateria} }{Unidad \ \theunidad \quad {\thecontrol[yshift=-1.2cm,xshift=-0.42\textwidth,scale=0.75]}}{\color{MainColor}\thegrado$^\circ$ de \thenivel \ (\thecicloescolar)}
    \else
        \runningheader{{\color{SubjectColor}\themateria} }{Unidad \ \theunidad }{\color{MainColor}\thegrado$^\circ$ de \thenivel \ (\thecicloescolar)}
    \fi
    \runningfooter{}{\color{colorrds}\thepage \ de \numpages}{}
    \runningheadrule
}
%%%% CAPTIONS
\RequirePackage{caption,subcaption,capt-of}
%%%% LINKS
% \RequirePackage{pst-all}
\RequirePackage{float}
\RequirePackage{lipsum}
\RequirePackage{bookmark,booktabs}
\RequirePackage{xstring}
\RequirePackage{wrapfig}
\RequirePackage{multicol,multirow}
%%%% MATH
\decimalpoint
\RequirePackage{adjustbox}
\RequirePackage{myboxes}
\RequirePackage{card}
%%%% EXTERNAL SOURCES
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble