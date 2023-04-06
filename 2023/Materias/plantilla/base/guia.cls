\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guia}[2023/01/20 Plantilla Guía RDS]

\LoadClass{exam}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\RequirePackage{rdscolors}
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}
\arrayrulecolor{rdsdark!80}
\renewcommand{\arraystretch}{1.4}
\newcommand{\minitab}[2][l]{\begin{tabular}{#1}#2\end{tabular}}
% \newcommand{\answerAngleBox}[2][]{
%   \definecolor{#2}{HTML}{0DBE80}
%   \begin{center}
%     {
%       \color{pasto}
%       \textbf{$\angle #1 ^\circ =$}
%     }
%     \fbox{
%       \begin{minipage}{2cm}
%         \hfill\vspace{0.5cm}
%       \end{minipage}
%     }
%   \end{center}
% }
\RequirePackage{enumitem}

\RequirePackage{tikz}
\input{insbox}
\usetikzlibrary{
    arrows,
    positioning,
    matrix,
    calc,
    decorations.pathreplacing,
    decorations.pathmorphing,
    decorations.markings,
    decorations.text,
    shapes,
    shapes.symbols,
    backgrounds,
    shadows,
    shadows.blur,
    trees,
    fit,
    snakes,
    patterns,
    mindmap,
    intersections,
    calendar,
    plotmarks,
    spy,
    tikzmark}

\RequirePackage{addfont}
\RequirePackage{fetamont}
\RequirePackage{bbold}% se usa como \bbfamily [outlined]
\RequirePackage{comfortaa}% se usa en el nombre de la escuela \comfortaa [sand serif]
\RequirePackage{foekfont}% se usa en el numero de guia \foekfamily [handwriting]
%\RequirePackage[rf]{electrum} %% lf option gives lining figures as default; 
%% remove option to get oldstyle figures as default
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\newcommand*\alterfont{\fontfamily{lmtt}\selectfont}%% se usa en la palabra guia \alterfont [typewriting]
\RequirePackage{fontawesome5}

% \input Acorn.fd
% \newcommand*\initfamily{\usefont{U}{Acorn}{xl}{n}}
%\addfont{OT1}{cmgray}{\cmgray}
%\input GotIn.fd
%\newcommand*\initfamily{\usefont{U}{GotIn}{xl}{n}}
% \input Carrickc.fd
% \newcommand*\initfamily{\usefont{U}{Carrickc}{m}{n}}
% \input Elzevier.fd
% \newcommand*\initfamily{\usefont{U}{Elzevier}{xl}{n}}
%\def\tfont{\usefont{T1}{fve}{m}{n}\selectfont}
\RequirePackage[
    %showframe=true,
    letterpaper,
    includehead,
    left=15mm,
    right=15mm,
    top=5mm,
    bottom=25mm,
    headheight=10mm,% Set \headheight to 10mm
]{geometry} % Custom margins
\RequirePackage{anyfontsize}
\newcommand{\HUGE}{\fontsize{50}{60}}
\RequirePackage{graphicx}
\graphicspath{{../images}} %Setting the graphicspath
\RequirePackage{calc}
\RequirePackage{xparse,xpatch}
\RequirePackage[colorlinks = true,urlcolor=colorrds, linkcolor = colorrds]{hyperref}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
        \node[shape=circle, draw, minimum size=1.5em, inner sep=0pt, thick] (char) {#1};}}
\renewcommand\choicelabel{\circled{\thechoice}}
\setlength\linefillheight{.2in}
%\patchcmd{\questions}{1.}{\thequestion.}{}{}% fix left margin
%\patchcmd{\questions}{\question}{\begin{qbox}\question\end{qbox}}{}{}% fix left margin
\AtBeginEnvironment{solutionbox}{\vspace{-0.2\baselineskip}}
\AtEndEnvironment{solutionbox}{\vspace{0.2\baselineskip}}
\AtBeginEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.8\baselineskip}}
\AtBeginEnvironment{oneparchoices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparchoices}{\vspace{-0.5\baselineskip}}
\AtBeginEnvironment{checkboxes}{\vspace{0.8\baselineskip}}
\AtEndEnvironment{checkboxes}{\vspace{0.8\baselineskip}}
\AtBeginEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparcheckboxes}{\vspace{0.8\baselineskip}}
\renewcommand{\solutiontitle}{\noindent\textbf{Soluci\'on:}\par\noindent}
%\renewcommand\questionlabel{\color{Sepia}\bfseries\comfortaa\fbox{\thequestion}}
\renewcommand\questionlabel{}
\pointsinmargin
\pointformat{}
%\bracketedpoints
%\pointformat{\textcolor{DarkOliveGreen}{[\thepoints]}}
\pointpoints{punto}{puntos}
% Custom formatting for problem parts.
\newcommand{\midmatch}{\hspace{0.75in}\underline{\hspace{0.5in}     }}
\renewcommand{\thepartno}{\alph{partno}}
\renewcommand{\partlabel}{\color{Sepia}\bfseries\sffamily\comfortaa\colorbox{gray!20}{{\thequestion\small\thepartno}}}
\newcommand{\tf}[1][{}]{%
    \fillin[#1][1cm]%
}
\checkboxchar{$\Box$}
\newcommand\questionboxed[1][0]{
    \question[#1] \tcbitem[title={\color{Sepia}\bfseries\sffamily\comfortaa Ejercicio \thequestion} \hfill {\color{colorrds}\totalpoints \ \points}]
}
\AtBeginEnvironment{questions}{
    %\setcounter{question}{1}
    \begin{tcbitemize}[raster columns=1, raster equal height=rows,
            enhanced,arc=10mm,sharpish corners, % better drop shadow
            % raster width=16cm,raster column skip=8mm,raster halign=center,
            raster force size=false,
            colframe=DarkOliveGreen!50!white,colbacktitle=DarkOliveGreen!20!white,
            fonttitle=\bfseries,]
        %\addtocounter{question}{1}
        %\setcounter{question}{1}
        }
        \AtEndEnvironment{questions}{\end{tcbitemize}
}
%%%%%%%%%% HOOKS (questions, parts and choices)
\renewcommand{\questionshook}{%
    \setlength{\leftmargin}{0pt}%
    \labelwidth\leftmargin\advance\labelwidth-\labelsep%
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
\setlength{\parindent}{0pt}
%%%% LOGO
\def\LOGO{%
    \begin{picture}(0,0)\unitlength=1cm
        \put (4.5,-1.5) {\includegraphics[width=2.2cm]{logo.png}}
    \end{picture}
}
%%%% INPUTS
\newcommand{\themateria}{1}
\newcommand{\materia}[1]{\renewcommand{\themateria}{#1}}
\newcommand{\thegrado}{1}
\newcommand{\grado}[1]{\renewcommand{\thegrado}{#1}}
\newcommand{\theguia}{1}
\newcommand{\guia}[1]{\renewcommand{\theguia}{#1}}
\newcommand{\thecicloescolar}{1}
\newcommand{\cicloescolar}[1]{\renewcommand{\thecicloescolar}{#1}}
\newcommand{\theaprendizajes}{1}
\newcommand{\aprendizajes}[1]{\renewcommand{\theaprendizajes}{#1}}
\newcommand{\therequisitos}{1}
\newcommand{\requisitos}[1]{\renewcommand{\therequisitos}{#1}}
% These commands set up the running header on the top of the exam pages
\pagestyle{headandfoot}
\firstpageheader{}{{\ifprintanswers\color{red}\Huge Autocontrol\fi}}{}
\firstpagefooter{}{  \color{colorrds}\thepage \ de \numpages}{}
\runningheader{\themateria}{Guía \# \theguia \ {\ifprintanswers\color{red} (Autocontrol)\fi}}{\hfill\thegrado \ (\thecicloescolar)}
\runningfooter{}{  \color{colorrds}\thepage \ de \numpages}{}
\runningheadrule
% \renewcommand{\questionlabel}{\colorbox{red} {\huge{\textbf{\color{white}~\thequestion.}}}}
% \renewcommand{\partlabel}{\colorbox{red} {\large{\textbf{\color{white}(\thepartno)}}}}
\renewenvironment{TheSolution}{
    \begin{mdframed}[skipabove=\baselineskip,innertopmargin=\baselineskip,innerbottommargin=\baselineskip, linewidth=3pt,
            linecolor=ao(english),  topline=false,
            rightline=false,
            bottomline=false]
        \textbf{\color{Sepia}Solución:}\enspace\ignorespaces}{\end{mdframed}}
% \newcommand{\puntuacion}{
%   \centering
%   \begin{mybox}{0.20\linewidth}{
%     \fontsize{24}{32}\selectfont \ffmwfamily \color{colorrds} Calificación}
% %\cellwidth{0.2em}
% %\gradetablestretch{1}
% %\multirowgradetable{2}
% %\gradetable[h][questions]
% %\GradeTable
% \end{mybox}
% }
%%%% STYLES
\tikzset{
    aprendizajebox/.style={anchor=north,xshift=-.98\textwidth,
            yshift=-1.3cm,
            draw=colorrds, dashed,fill=white, rectangle,
            inner sep=15pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    aprendizajetitle/.style={
            fill=white,
            style=rounded corners,
            % drop shadow,
        },
    requisitobox/.style={anchor=north,xshift=-.5\textwidth,
            yshift=-1.2cm,
            draw=none, fill=white, rectangle,
            inner xsep=1pt,inner ysep=2pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    requisitotitle/.style={
            fill=white,
            style=rounded corners,
            % drop shadow,
        },
    instructionbox/.style={xshift=-.7\textwidth,
            yshift=-4.6cm,
            draw=gray, fill=white, rectangle,
            inner sep=15pt,style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
            blur shadow={
                    shadow opacity=40,
                    shadow yshift=-1mm,
                    %shadow blur steps=30,
                    shadow blur extra rounding=5pt
                }},
    instructiontitle/.style={
            fill=white,
            style=rounded corners,
            % drop shadow,
        }
}
%%%% COMMAND
\newcommand{\INFO}{%
    \begin{tikzpicture}[remember picture]
        \draw[colorrds,ultra thick,xshift=-1.2\textwidth ,yshift=0cm,
            rounded corners=5pt] (0,0)
        rectangle
        (\textwidth,3.1cm);
        %%%% TITULO
        \node[yshift=0cm,xshift=-.65\textwidth,
            rectangle,
            rounded corners=2pt,inner xsep=20pt,inner ysep=10pt,
            blur shadow={
                    shadow opacity=40,
                    shadow yshift=-2mm,
                    %shadow blur steps=30,
                    shadow blur extra rounding=5pt
                },
            fill=colorrds]
        {
            \adjustbox{
                stack,
                color=white,
                min size={0.1\textwidth}{20pt},
                max size={0.65\textwidth}{20pt}
            }{
                \centering \bfseries \comfortaa
                \color{white} \fontsize{14}{21}\selectfont\@title
            }%
        };
        %%%% BOLA
        \node[xshift=-.27\textwidth ,circle,inner xsep=5pt,inner ysep=5pt,
            blur shadow={
                    shadow opacity=40,
                    shadow yshift=-1mm,
                    %shadow blur steps=30,
                    %shadow blur extra rounding=5pt
                },
            fill=MainColor!50]
        {
            \begin{minipage}{1cm}
                \centering
                {\fontsize{9}{12}\selectfont \color{Sepia} \alterfont Guía}\\
                {\fontsize{28}{1}\selectfont \color{white} \bfseries \foekfamily \theguia}
            \end{minipage}
        };
        %%%% APRENDIZAJES
        \node[aprendizajebox] (box)
        {
            \begin{minipage}[t][][t]{.35\textwidth}
                \normalfont  \theaprendizajes
            \end{minipage}
        };
        \node[aprendizajetitle,right=5pt,yshift=2pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Aprendizajes};
        \node[draw=none, fit=(box)] {};
        %%%% GRADESTABLE
        \node[requisitobox] (box)
        {
            \begin{minipage}[t][][t]{.5\textwidth}
                %\begin{minipage}[t][][b]{.22\textwidth}
                % \makebox[.22\textwidth]{
                \footnotesize
                \cellwidth{0.3em}
                \gradetablestretch{1.8}
                \vqword{Pregunta}
                \vpgword{P\'gina}
                \vpword{Puntos}
                \vsword{Obtenidos}
                \vtword{Total}
                \hqword{Pregunta}
                \hpgword{P\'gina}
                \hpword{Puntos}
                \hsword{Obtenidos}
                \htword{Total}
                \ifnum\numquestions > 10
                    \multirowgradetable{2}[questions]
                \else
                    \gradetable[h][questions]
                \fi
            \end{minipage}%
        };
        \node[requisitotitle,right=5pt,yshift=2pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Puntuación   };
        \node[draw=none, fit=(box)] {};
    \end{tikzpicture}
    \begin{tikzpicture}[remember picture, overlay,shift=(current page.north west)]
        %%%% LOGO
        \node[yshift=-3.5cm,xshift=-2.5cm]{\LOGO};
        %%%% SCHOOL TITLE
        \node[anchor=west, rectangle,yshift=-3.5cm,xshift=4cm,
        rounded corners=2pt,inner xsep=20pt,inner ysep=0pt]
        {
        \parbox{0.8\textwidth}{%
        {\color{colorrds}\fontsize{20}{20}\selectfont \comfortaa  \textbf{Escuela Rafael D\'iaz Serd\'an}}\\[1ex]
        { \fontsize{16}{20}\selectfont \textbf{\color{SubjectColor}\themateria} \hfill {\color{MainColor}\thegrado} }\\
        { \@author \hfill \thecicloescolar}\\
        }%
        };
        \node[draw=none, fit=(box)] {};
    \end{tikzpicture}
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
    \end{tikzpicture}
}
\makeatother
%%%% CAPTIONS
\RequirePackage{caption,capt-of}
\RequirePackage{subcaption}
%%%% LINKS
\RequirePackage{float}
\RequirePackage{bookmark}
\RequirePackage{xparse}
\RequirePackage{wrapfig}
\RequirePackage{multicol,multirow,booktabs}
%%%% MATH
\RequirePackage{amssymb,amsmath}
\decimalpoint
\RequirePackage{adjustbox}
\RequirePackage{mytcolorboxes}
\RequirePackage{myboxes}
%%%% EXTERNAL SOURCES
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble