\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{clrdsbook}[2020/12/20 Plantilla Libro RDS]

\LoadClass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax


\RequirePackage{rdscolors}
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}

\RequirePackage{addfont}
\RequirePackage{bbold}
\RequirePackage{comfortaa}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8x]{inputenc}
\newenvironment{keyfont}{\fontfamily{es}\selectfont}{\par}
\newcommand*\alterfont{\fontfamily{lmtt}\selectfont}
\addfont{OT1}{cmgray}{\cmgray}
\input{GotIn.fd}

\RequirePackage{longdivision}
%% equivalencias al entero
\newcounter{CountOfSections}
\newcommand{\fracgraph}[3][1]{%
    % #1 = optional height
    \begin{tikzpicture}
        \draw (0,0) rectangle (#2,#1) node [midway] {1};

        \setcounter{CountOfSections}{0}%
        \foreach \Size/\Options in {#3} {%
                \stepcounter{CountOfSections}%
                \pgfmathsetmacro{\YCoord}{#1*\arabic{CountOfSections}}%
                \draw  (0,-\YCoord) rectangle (#2,-\YCoord+#1);
                \pgfmathsetmacro{\Xincrement}{#2/\Size}%
                \foreach \x in {1,...,\Size} {%
                        \pgfmathsetmacro{\Xcoord}{\x*\Xincrement}%
                        \pgfmathsetmacro{\XcoordLabel}{(\x-0.5)*\Xincrement}%
                        \draw [fill=\Options]  ($(\Xcoord-\Xincrement,-\YCoord)$)  rectangle ($(\Xcoord,-\YCoord+#1)$);
                        \node at ($(\XcoordLabel,-\YCoord+0.5*#1)$) {$\frac{1}{\Size}$};
                    }%
            }%
    \end{tikzpicture}
}
%%%%
%% Recta numérica (intervalo)
\newcommand{\rectnuminterval}[5][]{
    \begin{tikzpicture}[#1]
        \draw[very thick] (#2,0.5) -- (#3,0.5);
        \path [draw=black, fill=#4] (#2,0.5) circle (2pt);
        \path [draw=black, fill=#5, thick] (#3,0.5) circle (2pt);
        \draw[latex-latex] (-3.5,0) -- (3.5,0) ;
        \foreach \x in  {-3,-2,-1,0,1,2,3}
        \draw[shift={(\x,0)},color=black] (0pt,3pt) -- (0pt,-3pt);
        \foreach \x in {-3,-2,-1,0,1,2,3}
        \draw[shift={(\x,0)},color=black] (0pt,0pt) -- (0pt,-3pt) node[below]
        {$\x$};
    \end{tikzpicture}
}
%%%%

\RequirePackage[
    letterpaper,
    left=1in,
    right=1in,
    top=1in,
    bottom=1in,
    headheight=10mm,% Set \headheight to 10mm
]{geometry} % Custom margins

\RequirePackage{anyfontsize}
\newcommand{\HUGE}{\fontsize{50}{60}}
\newcommand{\thesubject}{Matem\'aticas 3}
\newcommand{\subject}[1]{\renewcommand{\thesubject}{#1}}
\newcommand{\thegrade}{3$^\circ$ de Secundaria}
\newcommand{\grade}[1]{\renewcommand{\thegrade}{#1}}


\RequirePackage[explicit]{titlesec}
\RequirePackage{remreset}
\makeatletter
\@removefromreset{section}{chapter}
\makeatother
\RequirePackage{my-boxes}
\RequirePackage{my-chapter}
\RequirePackage{my-section}
\RequirePackage{my-subsection}

\RequirePackage{graphicx}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\cfoot{\thepage}
\AtBeginDocument{
    \renewcommand{\headrulewidth}{0.2pt}
    \renewcommand{\footrulewidth}{0.2pt}
}

\makeatletter
\renewcommand{\maketitle}{
    \newgeometry{left=0mm,top=50mm,bottom=0mm,right=0mm}
    \thispagestyle{empty}
    \begin{center}
        \vspace{4cm}
        {\Huge \thesubject } \\
        \vspace{1cm} \normalsize
        {\bfseries \large {\@title}} \\
        para los alumnos de {\thegrade} \\
        {en el curso durante el ciclo escolar} \\
        {\bfseries 2022-2023} \\
        \vspace{2cm}
        {\small POR} \\
        \Large {\@author} \\[0.5em]
        \normalsize Profesor de asignatura en \\
        \vspace{2cm}
        \includegraphics[width=4cm]{logo} \\
        \vspace{2.75cm}
    \end{center}
    \includegraphics[width=1\textwidth]{cover}
    \newpage \thispagestyle{empty}
    \setcounter{page}{0}
    \restoregeometry
}
\makeatother


\RequirePackage{etoolbox}
\RequirePackage{caption,capt-of}
\RequirePackage[colorlinks = true, linkcolor = colorrds]{hyperref}


\addtocontents{toc}{\setcounter{tocdepth}{4}}

\RequirePackage[undotted]{minitoc}
\setcounter{minitocdepth}{3}
\nomtcrule         % removes rules = horizontal lines from minitocs
\nomtcpagenumbers  % remove page numbers from minitocs

\RequirePackage{float}
\RequirePackage{bookmark}
\RequirePackage{tabularx}
\RequirePackage{multicol,multirow}
\RequirePackage{tabto}
\RequirePackage[inline]{enumitem}
\RequirePackage{xparse}
\RequirePackage{wrapfig}
\RequirePackage{amssymb,amsmath}
\decimalpoint
\RequirePackage{pdflscape}
\RequirePackage{adjustbox}
\RequirePackage{blindtext}
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble

\newlist{hoptboxes}{itemize*}{1}
\setlist[hoptboxes,1]{label=\Large$\square$, font=\color{colorrds},itemjoin={{\quad}},leftmargin = 1cm}
\newlist{hoptions}{enumerate*}{1}
\setlist[hoptions,1]{label=(\alph*), font=\color{colorrds},itemjoin={{\quad}},leftmargin = 1cm}