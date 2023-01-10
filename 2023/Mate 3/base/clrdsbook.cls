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
\graphicspath{{./Images}} %Setting the graphicspath

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\cfoot{\thepage}
\fancyhead{}
\fancyhead[RO,LE]{\sectionlabel }
\fancyhead[RE,LO]{\chaptername \ \thechapter }
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