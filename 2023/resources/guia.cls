\def\fileversion{1.0}
\def\filedate{2023/04/07}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guia}[\filedate\space Plantilla Guía RDS Version \fileversion\space by J.Melchor]
\LoadClass{exam}
\DeclareOption{addpoints}{\addpoints}
\DeclareOption{answers}{\printanswers}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\RequirePackage{rdscolors}
% \RequirePackage{lineno}
% \pagewiselinenumbers
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}
\renewcommand{\baselinestretch}{1}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\setlength\linefillheight{.2in}
\newcommand{\minitab}[2][l]{\begin{tabular}{#1}#2\end{tabular}}
\RequirePackage{enumitem}
\RequirePackage[version=4]{mhchem}
\RequirePackage{array}
\arrayrulecolor{rdsdark!80}
\renewcommand{\arraystretch}{1.4}
\RequirePackage{forest}
\RequirePackage{tikz}
\RequirePackage{physics}
\tikzset{>=latex} % for LaTeX arrow head
% Styles
\tikzset{axis/.style={black, thick,->}}
\tikzset{vector/.style={>=stealth,->}}
\tikzset{every text node part/.style={align=center}}
\colorlet{myblue}{black!40!blue}
\colorlet{myred}{black!40!red}
\colorlet{vcol}{green!50!black}
\colorlet{Ecol}{orange!90!black}
\colorlet{EVcol}{orange!80!black!60}
\colorlet{Bcol}{violet!90}
\input{insbox}
\usetikzlibrary{
    3d,
    arrows,
    positioning,
    matrix,
    calc,
    decorations.pathreplacing,
    decorations.pathmorphing,
    decorations.markings,
    decorations.text,
    shapes,
    shapes.geometric,
    shapes.multipart,
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
    tikzmark
}
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
\RequirePackage{shadowtext}
\shadowoffsetx{0.75pt}
\shadowoffsety{0.5pt}
\shadowrgb{0.3, 0.3, 0.3}
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
\RequirePackage{xparse,xpatch}
\RequirePackage{setspace}
\RequirePackage[colorlinks = true,urlcolor=colorrds, linkcolor = colorrds]{hyperref}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
        \node[shape=circle, draw, minimum size=1.5em, inner sep=0pt, thick] (char) {#1};}}
\renewcommand\choicelabel{\circled{\thechoice}}
%\patchcmd{\questions}{1.}{\thequestion.}{}{}% fix left margin
%\patchcmd{\questions}{\question}{\begin{qbox}\question\end{qbox}}{}{}% fix left margin
\AtBeginEnvironment{solutionbox}{\vspace{-0.2\baselineskip}}
\AtEndEnvironment{solutionbox}{\vspace{0.2\baselineskip}}
\AtBeginEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.8\baselineskip}}
\AtBeginEnvironment{oneparchoices}{\vspace{0.5\baselineskip}}
\AtEndEnvironment{oneparchoices}{\vspace{0.5\baselineskip}}
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
    \question[#1]\begin{pregunta}[adjusted title={ Ejercicio \thequestion} \hfill {\color{colorrds}\totalpoints \ \points}]%
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
        \put (4.51,-1.52) {\includegraphics[width=2.4cm]{logo_shadow.png}}
        \put (4.5,-1.5) {\includegraphics[width=2.4cm]{logo.png}}
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
    aprendizajebox/.style={anchor=north,xshift=-.96\textwidth-3pt,
            yshift=-1.7cm,
            draw=colorrds, dashed,fill=white, rectangle,
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
            yshift=-1.7cm,
            draw=colorrds, dashed,fill=white, rectangle,
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
\newcommand{\INFO}{%
    \begin{tikzpicture}[remember picture]
        \draw[colorrds,ultra thick,xshift=-1.2\textwidth-5pt ,yshift=0cm,
            rounded corners=5pt] (0,0)
        rectangle
        (\textwidth-1pt,3.1cm);
        \node[xshift=-.915\textwidth , yshift=23pt] { \adjustbox{minipage=0.25\textwidth}{\fontsize{5}{1}\selectfont\sffamily \bfseries \color{black!60} Última revisión del documento: \today} };
        %%%% TITULO
        \node[yshift=5pt,xshift=-.68\textwidth,
            rectangle,
            rounded corners=2pt,inner xsep=20pt,inner ysep=10pt,
            blur shadow={
                    shadow opacity=50,
                    shadow yshift=-1mm,
                    shadow blur steps=5,
                    shadow blur extra rounding=5pt
                },
            fill=colorrds]
        {
            \adjustbox{
                stack,
                color=white,
                min size={0.2\textwidth}{8pt},
                max size={0.65\textwidth}{20pt}
            }{
                \centering \bfseries \comfortaa
                \color{white} \@title
            }%
        };
        \node[nombrebox] (box) {
            \makebox[0.72\linewidth]{\textbf{\comfortaa \color{Sepia} Nombre del alumno: } \DrawLine[9.4cm]}
            \makebox[0.25\linewidth]{\textbf{ \comfortaa \color{Sepia} Fecha: } \ \DrawLine[3.6cm]}
        };
        %%%% BOLA
        \node[anchor= west,yshift=6pt,xshift=-.3\textwidth ,circle,inner xsep=3pt,inner ysep=3pt,
            blur shadow={
                    shadow opacity=40,
                    shadow yshift=-1mm,
                },
            fill=MainColor]
        {
            \begin{minipage}{0.8cm}
                \centering
                {\fontsize{9}{1}\selectfont \color{Guia} \bfseries\comfortaa Guía}\\
                {\fontsize{22}{1}\selectfont \color{white} \bfseries \foekfamily \theguia}
            \end{minipage}
        };
        %%%% APRENDIZAJES
        \node[aprendizajebox] (box) {\adjustbox{minipage=0.45\textwidth}{\theaprendizajes}};
        \node[aprendizajetitle,xshift=45pt,yshift=2pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Aprendizajes:};
        %%%% GRADESTABLE
        \node[gradetablebox] (box)
        {\adjustbox{min size={0.05\textwidth}{10pt},max size={0.46\textwidth+3pt}{60pt}}{%
        \cellwidth{0.5em}\hqword{Pregunta}\hpgword{Página}\hpword{Puntos}\hsword{Obtenidos}\htword{Total}\vqword{Pregunta}\vpgword{P\'gina}\vpword{Puntos}\vsword{Obtenidos}\vtword{Total}%
        \arrayrulecolor{colorrds!30}%
        \ifnum\numquestions>10%
            {\multirowgradetable{2}[questions]}%
            \else%
            {\gradetable[h][questions]}%
        \fi%
        }};
        \node[gradetableboxtitle,xshift=-110pt,yshift=4pt] at (box.north east) {\bfseries \comfortaa \color{Sepia} Puntuación:};
    \end{tikzpicture}%
    \begin{tikzpicture}[remember picture, overlay,shift=(current page.north west)]
        %%%% LOGO
        \node[yshift=-3.5cm,xshift=-2.5cm]{\LOGO};
        %%%% SCHOOL TITLE
        \node[anchor=west, rectangle,yshift=-3.5cm,xshift=4cm,
        rounded corners=2pt,inner xsep=20pt,inner ysep=0pt]
        {
        \parbox{0.8\textwidth}{%
        {\textbf{\color{colorrds}\fontsize{20}{20}\selectfont \comfortaa Escuela Rafael D\'iaz Serd\'an}}\\[1ex]
        {\fontsize{16}{20}\selectfont {\color{SubjectColor}\themateria}  \hfill {\color{MainColor}\thegrado} }\\
        {\@author  \hfill Unidad \theunidad \hspace{2.5em} \thecicloescolar}\\
        }%
        };
    \end{tikzpicture}%
    \thecontrol[yshift=-4cm,xshift=-0.55\textwidth,scale=1.5]
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
        \runningheader{{\color{SubjectColor}\themateria} }{Guía \theguia \quad {\thecontrol[yshift=-1.2cm,xshift=-0.48\textwidth]}}{\color{MainColor}\thegrado \ (\thecicloescolar)}
    \else
        \runningheader{{\color{SubjectColor}\themateria} }{Guía \theguia }{\color{MainColor}\thegrado \ (\thecicloescolar)}
    \fi
    \runningfooter{}{\color{colorrds}\thepage \ de \numpages}{}
    \runningheadrule
}
%%%% CAPTIONS
\RequirePackage{caption,capt-of}
\RequirePackage{subcaption}
%%%% LINKS
\RequirePackage{float}
\RequirePackage{lipsum}
\RequirePackage{bookmark,booktabs}
\RequirePackage{xstring}
\RequirePackage{wrapfig}
\RequirePackage{multicol,multirow}
%%%% MATH
\RequirePackage{amssymb,amsmath}
\RequirePackage{mathtools}
\decimalpoint
\RequirePackage{adjustbox}
\RequirePackage{mytcolorboxes}
\RequirePackage{myboxes}
\RequirePackage{card}
%%%% EXTERNAL SOURCES
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble