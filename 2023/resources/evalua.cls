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
% \RequirePackage{bohr}
% \RequirePackage{chemfig}
\@ifpackageloaded{lipsum}{}{\RequirePackage{lipsum}}
\@ifpackageloaded{tikz}{}{\RequirePackage{tikz}}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\RequirePackage{lscape}
\input{insbox}
\usetikzlibrary{fit,shadows,shadows.blur,shapes,calc}
\RequirePackage{fontawesome5}
\RequirePackage{bbold}% se usa como \bbfamily [outlined]
\RequirePackage{comfortaa}% se usa en el nombre de la escuela \comfortaa [sand serif]
\RequirePackage{foekfont}% se usa en el numero de repaso \foekfamily [handwriting]
%\RequirePackage[rf]{electrum} %% lf option gives lining figures as default; 
%% remove option to get oldstyle figures as default
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[
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
\graphicspath{{../images}} %Setting the graphicspath
\RequirePackage{xparse,xpatch}
\RequirePackage[colorlinks = true,urlcolor=colorrds, linkcolor = colorrds]{hyperref}
\RequirePackage[font=normalsize]{caption}
\RequirePackage{capt-of}
\RequirePackage{float}
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
\AtEndEnvironment{checkboxes}{\vspace{0.8\baselineskip}}
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

\checkboxchar{$\Box$}
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
\newcommand\thecontrol[1][yshift=-4cm,xshift=-0.55\textwidth]{%
    \ifprintanswers%
        {\begin{tikzpicture}[remember picture, overlay,shift=(current page.north east)]%
            \node[#1]{\autocontrol{\color{red}\alterfont\shadowtext{Autocontrol}}};
        \end{tikzpicture}}%
    \else{}%
    \fi%
}
\tikzset{
    instructionbox/.style={%dashed,
            draw=colorrds,fill=white, rectangle,
            inner sep=12pt, style=rounded corners,
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
            inner sep=15pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    objetivotitle/.style={ fill=white,
            style=rounded corners,
            % drop shadow,
        }
}
\newcommand{\objetivobox}[3][fill=white]{
    \begin{tikzpicture}
        \node[objetivobox,#1] (box)
        {
            \begin{minipage}[t][][t]{\linewidth}
                \normalfont #3
            \end{minipage}
        };
        \node[objetivotitle,right=5pt,yshift=2pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}
}
\newcommand{\gradesbox}[3][fill=white]{
    \begin{tikzpicture}
        \node[gradesbox, #1] (box) {
            \begin{minipage}[t][][t]{0.35\textwidth}
                \normalfont #3
            \end{minipage}
        };
        \node[gradestitle,  right=10pt,yshift=1mm] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}
}
\newcommand{\instructionbox}[3][fill=white]{
    \begin{tikzpicture}
        \node [instructionbox, #1] (box)
        {
            \vspace{-0.5cm}
            \begin{minipage}{.95\linewidth}
                \setlength{\parindent}{2mm} % Indentar.
                \normalfont #3
            \end{minipage}
        };
        \node[instructiontitle, right=10pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}
}

%%%% LOGO
\def\LOGO{%
    \begin{picture}(0,0)\unitlength=1cm
        \put (3,-1.5) {\includegraphics[width=2.2cm]{logo.png}}
    \end{picture}
}
\makeatletter
\AtBeginDocument{
\setlength\linefillheight{.2in}
% \setlength{\columnseprule}{5pt}
\setlength{\columnsep}{20pt}
\setlength{\parindent}{0pt}
\addpoints
\pagestyle{headandfoot}
\extraheadheight[2cm]{0.5cm}
\firstpageheader{}{
%\vspace{2.5cm}
{\LARGE\color{colorrds}  Escuela Rafael D\'iaz Serd\'an}\LOGO\\
{\bfseries\large\color{SubjectColor}\themateria} \\
{\large\color{MainColor}\thegrado \ (\thecicloescolar)}\\
\textbf{\@title \ \theunidad}\\
\small \@author
}{}
\firstpagefooter{}{
    \color{colorrds}\thepage \ de \numpages
}{}
\runningheader{\color{SubjectColor}\themateria}{\@title \ \theunidad}{\hfill\color{MainColor}\thegrado \ (\thecicloescolar)}
\runningfooter{}{  \color{colorrds}\thepage \ de \numpages}{}
\runningheadrule

\makebox[0.73\linewidth]{\textbf{\comfortaa \color{Sepia} Nombre del alumno: } \DrawLine[9cm]}
\makebox[0.25\linewidth]{\textbf{ \comfortaa \color{Sepia} Fecha: } \ \DrawLine[3.6cm]}\\

\instructionbox{Instrucciones:}{
    Lee con atenci\'on cada pregunta y realiza lo que se te pide.
    De ser necesario, desarrolla tus respuestas en el espacio
    determinado para cada pregunta o
    en una hoja en blanco por separado, anotando en ella tu nombre
    completo, el n\'umero del problema y la soluci\'on propuesta.
}

\begin{minipage}{\textwidth}
    \begin{minipage}[t][][b]{.6\textwidth}
        \objetivobox{Aprendizajes a evaluar:}{
            \theaprendizajes
        }
    \end{minipage}\hfill
    \begin{minipage}[t][][b]{.32\textwidth}
        \gradesbox{Calificación:}{
            %\scriptsize
            \cellwidth{0.8em}
            \gradetablestretch{1.3}
            \hqword{Pregunta}
            \hpgword{P\'gina}
            \hpword{Puntos}
            \hsword{Obtenidos}
            \htword{Total}
            \vqword{Pregunta}
            \vpgword{P\'gina}
            \vpword{Puntos}
            \vsword{Obtenidos}
            \vtword{Total}
            % \ifnum\numquestions > 9
            % \multirowgradetable{2}[questions]
            % \else
            % \gradetable[h][questions]
            % \fi
            \gradetable[v][questions]
        }
    \end{minipage}
\end{minipage}
% \begin{minipage}[t][][t]{0.3\textwidth}

% \end{minipage}


% \end{minipage}


% \tikzset{
%     gradesbox/.style={anchor=north,xshift=-.25\textwidth,
%             yshift=-1.2cm,
%             draw=none, fill=white, rectangle,
%             inner xsep=1pt,inner ysep=2pt, style=rounded corners,
%             %drop  shadow={fill=lightgray, opacity=0.7}
%         },
%     gradestitle/.style={
%             fill=white,
%             style=rounded corners,
%         }
% }
% \begin{tikzpicture}[remember picture, overlay]
%     %%%% GRADESTABLE
%     \node[gradesbox] (box)
%     {
%         %\begin{minipage}[t][][t]{.42\textwidth}
%             %\begin{minipage}[t][][b]{.22\textwidth}
%             % \makebox[.22\textwidth]{

%         \end{minipage}%
%     };
%     \node[gradestitle,right=5pt,yshift=2pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Puntuación };
%     \node[draw=none, fit=(box)] {};
% \end{tikzpicture}
% \end{center}

}
\makeatother