\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{evaluation}[2023/01/20 Plantilla Guía RDS]
\LoadClass{exam}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax

%%%% Paquete colores %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{rdscolors}
%%%% Paquete idioma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}
\arrayrulecolor{rdsdark!50}
%%%% Paquete texto %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem} % customize enumerate and item
\RequirePackage{mytcolorboxes}
\@ifpackageloaded{lipsum}{}{\RequirePackage{lipsum}}
\@ifpackageloaded{tikz}{}{\RequirePackage{tikz}}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\RequirePackage{pdflscape}
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
\RequirePackage{multicol}
\RequirePackage{bookmark}
%%%% MATH
\RequirePackage{amssymb,amsmath}
\decimalpoint
%%%% EXTERNAL SOURCES
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble

\AtBeginEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.8\baselineskip}}
%\AtBeginEnvironment{oneparchoices}{\vspace{0.3\baselineskip}}
%\AtEndEnvironment{oneparchoices}{\vspace{-0.8\baselineskip}}
\AtBeginEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{checkboxes}{\vspace{0.8\baselineskip}}
\AtBeginEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparcheckboxes}{\vspace{0.8\baselineskip}}

\newcommand{\midmatch}{\hspace{0.75in}\underline{\hspace{0.5in}     }}
\newcommand{\tf}[1][{}]{%
    \fillin[#1][1cm]%
}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
        \node[shape=circle, draw, fill=Goldenrod!5, minimum size=1.8em, inner sep=0pt, thick] (char) {#1};}}

\renewcommand\choicelabel{\thechoice.}
\renewcommand\questionlabel{\color{Sepia}\circled{\thequestion}}
\renewcommand{\thepartno}{\alph{partno}}
\renewcommand{\partlabel}{\color{Sepia!60}\circled{{\thequestion\thepartno}}}
\renewcommand{\solutiontitle}{\noindent\textbf{Soluci\'on:}\par\noindent}

\checkboxchar{$\Box$}
\pointformat{\textcolor{DarkOliveGreen}{[\thepoints]}}
\pointpoints{punto}{puntos}

%%%%%%%%%% Document Info %%%%%%%%%%%%%%%%%
%%%% INPUTS
\newcommand{\thesubject}{1}
\newcommand{\materia}[1]{\renewcommand{\thesubject}{#1}}
\newcommand{\thegrade}{1}
\newcommand{\grado}[1]{\renewcommand{\thegrade}{#1}}
\newcommand{\theguide}{1}
\newcommand{\guide}[1]{\renewcommand{\theguide}{#1}}
\newcommand{\thecycle}{1}
\newcommand{\cicloescolar}[1]{\renewcommand{\thecycle}{#1}}
\newcommand{\theaprendizajes}{1}
\newcommand{\aprendizajes}[1]{\renewcommand{\theaprendizajes}{#1}}

\tikzset{
    instructionbox/.style={
            draw=black, fill=white, rectangle,
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
    instructiontitle/.style={fill=white},
    gradesbox/.style={
            draw=none,
            fill=white,
            rectangle,
            inner xsep=1pt,
            inner ysep=2pt,
            style=rounded corners
        },
    gradestitle/.style={fill=white,
            style=rounded corners}
}
\newcommand{\instructionbox}[2][fill=white]{
    \begin{tikzpicture}
        \node [instructionbox, #1] (box)
        {\begin{minipage}{0.9\linewidth}
                \setlength{\parindent}{2mm} % Indentar.
                \normalfont #2
            \end{minipage}};
        \node[instructiontitle, right=10pt] at (box.north west) {Instrucciones};
        \node[draw=none, fit=(box)] {};
    \end{tikzpicture}
}
\newcommand{\gradesbox}[2][fill=white]{
    \begin{tikzpicture}
        \node[gradesbox, #1] (box) {\normalfont #2};
        \node[gradestitle, #1] at (box.north) {Calificaciones:};
        \node[draw=none, fit=(box)] {};
    \end{tikzpicture}
}
%%%% LOGO
\def\LOGO{%
    \begin{picture}(0,0)\unitlength=1cm
        \put (4.5,-1.5) {\includegraphics[width=2.2cm]{logo.png}}
    \end{picture}
}
\makeatletter
\AtBeginDocument{
\setlength\linefillheight{.2in}
\setlength{\parindent}{0pt}
\addpoints
\pagestyle{headandfoot}
\extraheadheight[2cm]{0.5cm}
\firstpageheader{}{
%\vspace{2.5cm}
{\LARGE\color{colorrds}  Escuela Rafael D\'iaz Serd\'an}\LOGO\\
{\bfseries\large\color{DarkOliveGreen}\thesubject} \quad {\large\color{Sepia}\thegrade \ (\thecycle)}\\
\textbf{\@title \ \theguide}\\
\small \@author
}{}
\firstpagefooter{}{
    \color{colorrds}\thepage \ de \numpages
}{}
\runningheader{\thesubject}{\@title \theguide}{\hfill\thegrade \ (\thecycle)}
\runningfooter{}{  \color{colorrds}\thepage \ de \numpages}{}
\runningheadrule
\makebox[0.7\textwidth]{Nombre del alumno:\enspace\hrulefill}
\makebox[0.3\textwidth]{Fecha:\enspace\hrulefill}
\begin{center}
    \instructionbox{
        Lee con atenci\'on cada pregunta y realiza lo que se te pide.
        De ser necesario, desarrolla tus respuestas en el espacio
        determinado para cada pregunta o
        en una hoja en blanco por separado, anotando en ella tu nombre
        completo, el n\'umero del problema y la soluci\'on propuesta.
    }

    \gradesbox{
        %\scriptsize
        \cellwidth{0.5em}
        \gradetablestretch{1.5}
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
        \gradetable[h][questions]
    }
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
\end{center}

}
\makeatother
