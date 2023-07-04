\def\fileversion{1.0}
\def\filedate{2023/06/05}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{evalua}[2023/01/20 Plantilla Evaluación RDS]
\LoadClass{exam}
\DeclareOption{addpoints}{\addpoints}
\DeclareOption{answers}{\printanswers}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax\ProcessOptions\relax

%%%% Paquete colores %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{rdscolors}
%%%% Paquete idioma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}
\arrayrulecolor{rdsdark!50}
%%%% Paquete texto %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem} % customize enumerate and item
\RequirePackage{mytcolorboxes}
% \RequirePackage{myboxes}
\RequirePackage{xfrac}
\RequirePackage{cancel}
\RequirePackage{bohr}
\RequirePackage{chemfig}
\RequirePackage[version=4]{mhchem}
\RequirePackage{array}
\RequirePackage{forest}
% \RequirePackage{ragged2e}
\RequirePackage{physics}

\tikzset{>=latex} % for LaTeX arrow head

\@ifpackageloaded{lipsum}{}{\RequirePackage{lipsum}}
\@ifpackageloaded{tikz}{}{\RequirePackage{tikz}}
\RequirePackage{tkz-euclide}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\RequirePackage{lscape}
\input{insbox}
\usetikzlibrary{fit,shadows,shadows.blur,shapes, calc, arrows}
\RequirePackage{fontawesome5}
\RequirePackage{bbold}% se usa como \bbfamily [outlined]
\RequirePackage{comfortaa}% se usa en el nombre de la escuela \comfortaa [sand serif]
\RequirePackage{foekfont}% se usa en el numero de repaso \foekfamily [handwriting]
%\RequirePackage[rf]{electrum} %% lf option gives lining figures as default; 
%% remove option to get oldstyle figures as default
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\newcommand*\alterfont{\fontfamily{lmtt}\selectfont}%% se usa en la palabra guia \alterfont [typewriting]
\RequirePackage{shadowtext}
\shadowoffsetx{0.75pt}
\shadowoffsety{0.5pt}
\shadowrgb{0.3, 0.3, 0.3}
\RequirePackage[
    % showframe,
    letterpaper,
    includehead,
    left=20mm,
    right=20mm,
    top=5mm,
    bottom=25mm,
    headheight=10mm,% Set \headheight to 10mm
]{geometry} % Custom margins
\RequirePackage{anyfontsize}
\newcommand{\HUGE}{\fontsize{50}{60}}
\RequirePackage{graphicx}
%\graphicspath{{../images}} %Setting the graphicspath
\RequirePackage{xparse,xpatch}
\RequirePackage[colorlinks = true,urlcolor=colorrds, linkcolor = colorrds]{hyperref}
\RequirePackage{caption,subcaption,capt-of}
\RequirePackage{float}
\RequirePackage{adjustbox}
\RequirePackage{wrapfig}
\RequirePackage{multicol}
\RequirePackage{bookmark,booktabs}
%%%% MATH
\RequirePackage{amssymb,amsmath}
\decimalpoint
%%%% EXTERNAL SOURCES
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble
% \usepackage[overload,debug]{exam-randomizechoices}
\renewcommand{\arraystretch}{1.4}
\AtBeginEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.8\baselineskip}}
%\AtBeginEnvironment{oneparchoices}{\vspace{0.3\baselineskip}}
%\AtEndEnvironment{oneparchoices}{\vspace{-0.8\baselineskip}}
\AtBeginEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtBeginEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparcheckboxes}{\vspace{0.8\baselineskip}}
\newcommand\comillas[1]{``#1''}
\newcommand{\midmatch}{\hspace{0.75in}\underline{\hspace{0.5in}     }}
\newcommand{\tf}[1][{}]{%
    \fillin[#1][1cm]%
}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
        \node[shape=circle, draw, fill=Goldenrod!10, minimum size=1.8em, inner sep=0pt, thick] (char) {#1};}}

\renewcommand\choicelabel{\color{DarkOliveGreen}\bfseries\thechoice.}
\renewcommand\questionlabel{\color{Sepia}\circled{\thequestion}}
\renewcommand{\thepartno}{\alph{partno}}
\renewcommand{\partlabel}{\color{Sepia!60}\circled{{\thequestion\thepartno}}}
\renewcommand{\solutiontitle}{\noindent\textbf{Soluci\'on:}\par\noindent}

\checkboxchar{\faIcon[regular]{square}}
\CorrectChoiceEmphasis{\color{red!50!gray}\bf}
\checkedchar{\faIcon[regular]{check-square}}
\pointformat{\textcolor{SubjectColor}{[\thepoints]}}
\pointpoints{punto}{puntos}

%%%%%%%%%% Document Info %%%%%%%%%%%%%%%%%
%%%% INPUTS
\newcommand{\themateria}{1}
\newcommand{\materia}[1]{\renewcommand{\themateria}{#1}}
\newcommand{\thegrado}{1}
\newcommand{\grado}[1]{\renewcommand{\thegrado}{#1}}
\newcommand{\theguia}{1}
\newcommand{\guia}[1]{\renewcommand{\theguia}{#1}}
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
\newcommand{\thereglas}{1}
\newcommand{\reglas}[1]{\renewcommand{\thereglas}{%
        \small Al comenzar este examen, aceptas las siguientes reglas:
        \begin{itemize}[topsep=1pt, partopsep=0pt,itemsep=1pt,parsep=0pt,label=\color{red!70!black}\faTimes]%
            #1
        \end{itemize}
        Si no consideraste alguna de estas reglas,
        comunícalo a tu profesor.
    }}
\reglas{
    \item No se permite \textbf{salir} del sal\'on de clases. %\faToiletPaperSlash
    \item No se permite \textbf{intercambiar o prestar} ningún tipo de material.
    \item No se permite el uso de \textbf{celular} o cualquier \textbf{otro dispositivo}.
    \item No se permite el uso de \textbf{apuntes}, \textbf{libros}, notas o formularios.
    \item No se permite \textbf{mirar} el examen de otros alumnos.
    \item No se permite la \textbf{comunicaci\'on} oral o escrita con otros alumnos.
}
\newcommand\thecontrol[1][yshift=-4cm,xshift=-0.55\textwidth]{%
    \ifprintanswers%
        {\begin{tikzpicture}[remember picture, overlay,shift=(current page.north east)]%
            \node[#1]{\autocontrol{\color{red}\alterfont\shadowtext{Soluciones propuestas}}};
        \end{tikzpicture}}%
    \else{}%
    \fi%
}
\tikzset{
    instructionbox/.style={%dashed,
            draw=colorrds,fill=white, rectangle,
            inner sep=10pt, style=rounded corners,
            %drop shadow={fill=black, opacity=1}
            blur shadow={
                    shadow opacity=40,
                    shadow yshift=-1mm,
                    shadow xshift=-1mm,
                    %shadow blur steps=30,
                    %shadow blur extra rounding=5pt
                }
        },
    instructiontitle/.style={
            fill=white,
            style=rounded corners},
    gradesbox/.style={
            xshift=-.2\textwidth,
            draw=none,
            fill=white,
            rectangle,
            inner xsep=1pt,
            inner ysep=2pt,
            style=rounded corners
        },
    gradestitle/.style={fill=white,
            style=rounded corners},
    objetivobox/.style={
            anchor=north,
            xshift=-.86\textwidth,
            draw=colorrds, dashed,fill=white, rectangle,
            inner sep=10pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    objetivotitle/.style={ fill=white,
            style=rounded corners,
            % drop shadow,
        }
}
\newcommand{\objetivobox}[3][fill=white]{%
    \begin{tikzpicture}
        \node[objetivobox,#1] (box)
        {%
            \adjustbox{minipage=.95\linewidth}{%
                \normalfont #3
            }%
        };
        \node[objetivotitle,right=10pt,yshift=2pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}%
}
\newcommand{\gradesbox}[3][fill=white]{%
    \begin{tikzpicture}%
        \node[gradesbox, #1] (box) {%
            % \begin{minipage}[t][][t]{0.25\textwidth}
            \adjustbox{%
                % minipage=.9\linewidth
                % min size={0.1\textwidth}{150pt},
                max size={.98\linewidth}{250pt}
            }{%
                \normalfont #3
            }%
            % \end{minipage}
        };
        \node[gradestitle, right=30pt,yshift=1mm] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}%
}
\newcommand{\instructionbox}[3][fill=white]{%
    \begin{tikzpicture}%
        \node [instructionbox, #1] (box)
        {%
            \adjustbox{minipage=.98\linewidth}{%
                \normalfont #3
            }%
        };
        \node[instructiontitle, right=10pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}%
}

%%%% LOGO
\def\LOGO{%
    \begin{picture}(0,0)\unitlength=1cm
        \put (3,-1.5) {\includegraphics[width=2.2cm]{logo.png}}
    \end{picture}
}
\makeatletter
\AtBeginDocument{
\setlength{\columnsep}{10pt}
\setlength\linefillheight{.2in}
% \setlength{\columnseprule}{5pt}
\setlength{\parindent}{0pt}
\addpoints
\pagestyle{headandfoot}
\extraheadheight[2cm]{0.5cm}
\firstpageheader{}{
{\LARGE\color{colorrds}  Escuela Rafael D\'iaz Serd\'an}\LOGO\\
{\bfseries\large\color{SubjectColor}\themateria} \\
{\large\color{MainColor}\thegrado \ (\thecicloescolar)}\\
\textbf{\@title \ \theunidad}\\
{\small \@author}
\thecontrol[yshift=-4cm,xshift=-0.6\textwidth,scale=1.5]
}{}
\firstpagefooter{}{
    \color{colorrds}\thepage \ de \numpages
}{}
\ifprintanswers
    \runningheader{\color{SubjectColor}\themateria}{\@title \ \theunidad {\thecontrol[yshift=-1.7cm,xshift=-0.8\textwidth]}}{\hfill\color{MainColor}\thegrado \ (\thecicloescolar)}
\else
    \runningheader{\color{SubjectColor}\themateria}{\@title \ \theunidad }{\hfill\color{MainColor}\thegrado \ (\thecicloescolar)}
\fi
\runningfooter{}{  \color{colorrds}\thepage \ de \numpages}{}
\runningheadrule
\vspace{1cm}
\begin{minipage}{\textwidth}
    \makebox[0.73\linewidth]{\textbf{\comfortaa \color{Sepia} Nombre del alumno: } \DrawLine[9cm]}
    \makebox[0.25\linewidth]{\textbf{ \comfortaa \color{Sepia} Fecha: } \ \DrawLine[3.6cm]}
\end{minipage}

\vspace{0.2cm}

\begin{minipage}{\textwidth}
    \hspace{0.1cm}\begin{minipage}[t][][b]{.33\textwidth}
        \instructionbox{Instrucciones:}{%\large%
            Lee con atenci\'on cada pregunta y realiza lo que se te pide.
            Desarrolla tus respuestas en el espacio determinado para cada solución.
            De ser necesario, utiliza una hoja en blanco por separado, anotando en ella tu nombre
            completo, el n\'umero del problema y la soluci\'on propuesta.
        }%
    \end{minipage}\hspace{0.9cm}%
    \begin{minipage}[t][][b]{.58\textwidth}
        \instructionbox{Reglas:}{%
            \thereglas
        }
    \end{minipage}
\end{minipage}

\vspace{0.2cm}

\begin{minipage}{\textwidth}
    \begin{minipage}[t][][b]{.68\textwidth}
        \objetivobox{Aprendizajes a evaluar:}{%\small%
            \theaprendizajes
        }
    \end{minipage}\hfill%
    \begin{minipage}[t][][b]{.3\textwidth}
        \gradesbox{Calificación:}{%
            \cellwidth{0.8em}%
            \gradetablestretch{1.2}%
            \hqword{Pregunta}%
            \hpgword{P\'gina}%
            \hpword{Puntos}%
            \hsword{Obtenidos}%
            \htword{Total}%
            \vqword{Pregunta}%
            \vpgword{P\'gina}%
            \vpword{Puntos}%
            \vsword{Obtenidos}%
            \vtword{Total}%
            \gradetable[v][questions]%
        }%
    \end{minipage}
\end{minipage}%
}
\makeatother