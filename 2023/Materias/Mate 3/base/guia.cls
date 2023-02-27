\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guia}[2023/01/20 Plantilla Guía RDS]

\LoadClass{exam}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\RequirePackage{rdscolors}
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}
\renewcommand{\solutiontitle}{\noindent\textbf{Soluci\'on:}\par\noindent}
\newcommand{\tf}[1][{}]{%
  \fillin[#1][1cm]%
}
\newcommand{\answerAngleBox}[2][]{
  \definecolor{#2}{HTML}{0DBE80}
  \begin{center}
    {
      \color{pasto}
      \textbf{$\angle #1 ^\circ =$}
    }
    \fbox{
      \begin{minipage}{2cm}
        \hfill\vspace{0.5cm}
      \end{minipage}
    }
  \end{center}
}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
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
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
    \node[shape=circle, draw, minimum size=1.5em, inner sep=0pt,
      label={center:#1}, thick] (char) {#1};}}
\renewcommand\choicelabel{\circled{\thechoice}}

\AtBeginEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.8\baselineskip}}
\AtBeginEnvironment{oneparchoices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparchoices}{\vspace{-0.5\baselineskip}}
\AtBeginEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{checkboxes}{\vspace{0.8\baselineskip}}
\AtBeginEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparcheckboxes}{\vspace{0.8\baselineskip}}
\RequirePackage{addfont}
\usepackage{fetamont}
\RequirePackage{bbold}% se usa como \bbfamily [outlined]
\RequirePackage{comfortaa}% se usa en el nombre de la escuela \comfortaa [sand serif]
\RequirePackage{foekfont}% se usa en el numero de guia \foekfamily [handwriting]
%\RequirePackage[rf]{electrum} %% lf option gives lining figures as default; 
			  %% remove option to get oldstyle figures as default
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\newcommand*\alterfont{\fontfamily{lmtt}\selectfont}%% se usa en la palabra guia \alterfont [typewriting]
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
\graphicspath{{./Images}} %Setting the graphicspath

\RequirePackage{xparse,booktabs,xpatch}
\checkboxchar{$\Box$}
\pointpoints{punto}{puntos}
\hqword{Pregunta}
\hpgword{P\'gina}
\hpword{Puntos}
%\chbpword{Puntos extra}
\hsword{Puntos obtenidos}
\htword{Total}
% redefine \part command to be \mypart
\appto\parts{\let\exampart\part\let\part\mypart}
\makeatletter
\ExplSyntaxOn
\tl_new:N \g_grade_table_tl% this will; become the new grade table

\int_new:N \g_score_int% this will be the exam score
\NewDocumentCommand\mypart{o}{
  \IfNoValueTF{#1}{\exampart}{
    % don't do anything special inside solutions
    \if@insolution\exampart[#1]
    \else\exampart[#1]
      \int_compare:nNnT {\arabic{partno}} = {1} {
        \tl_gput_right:Nn \g_grade_table_tl { \midrule }
      }
      \tl_gput_right:Nx \g_grade_table_tl {
        \arabic{question}\alph{partno}
      }
      \tl_gput_right:No \g_grade_table_tl  {& #1  }
      \int_gadd:Nn \g_score_int {#1}
    \fi
  }
}
\NewDocumentCommand\GradeTable{}{% the new grade table
  \begin{tabular}{ccc}
    \toprule
     \@hqword &  {\tl_use:N \g_grade_table_tl} & Total \\
     \@hpword & {\int_use:N \g_score_int} & \\
     \@hsword & &\\
  \bottomrule
  \end{tabular}
}
\ExplSyntaxOff
\makeatother
%%%% INFO
\makeatletter
\setlength{\parindent}{0pt}
%%%% LOGO
\def\LOGO{%
  \begin{picture}(0,0)\unitlength=1cm
    \put (4.5,-1.5) {\includegraphics[width=2cm]{logo.png}}
  \end{picture}
}
%%%% INPUTS
\newcommand{\thesubject}{1}
\newcommand{\subject}[1]{\renewcommand{\thesubject}{#1}}
\newcommand{\thegrade}{1}
\newcommand{\grade}[1]{\renewcommand{\thegrade}{#1}}
\newcommand{\theguide}{1}
\newcommand{\guide}[1]{\renewcommand{\theguide}{#1}}
\newcommand{\thecycle}{1}
\newcommand{\cycle}[1]{\renewcommand{\thecycle}{#1}}
\newcommand{\theaprendizajes}{1}
\newcommand{\aprendizajes}[1]{\renewcommand{\theaprendizajes}{#1}}
\newcommand{\therequisitos}{1}
\newcommand{\requisitos}[1]{\renewcommand{\therequisitos}{#1}}
% These commands set up the running header on the top of the exam pages
\pagestyle{headandfoot}
\firstpageheader{}{}{}
\firstpagefooter{}{\fontsize{14}{14}\selectfont \ffmwfamily \color{colorrds}\thepage}{}
\runningheader{\thesubject}{Guía \# \theguide}{\hfill\thegrade \ (\thecycle)}
\runningfooter{}{\fontsize{14}{14}\selectfont \ffmwfamily \color{colorrds}\thepage}{}
\runningheadrule
%\bracketedpoints
\pointformat{\textcolor{Brown}{[\thepoints]}}
% \renewcommand{\questionlabel}{\colorbox{red} {\huge{\textbf{\color{white}~\thequestion.}}}}
% \renewcommand{\partlabel}{\colorbox{red} {\large{\textbf{\color{white}(\thepartno)}}}}
\renewenvironment{TheSolution}{\begin{mdframed}[skipabove=\baselineskip,innertopmargin=\baselineskip,innerbottommargin=\baselineskip, linewidth=3pt,
  linecolor=ao(english),  topline=false,
  rightline=false,
  bottomline=false]
 \textbf{\color{red}Solution:}\enspace\ignorespaces}{\end{mdframed}}
\newcommand{\puntuacion}{
  \centering
  \begin{mybox}{0.80\linewidth}{
    \fontsize{24}{32}\selectfont \ffmwfamily \color{colorrds} Calificación}
\cellwidth{0.2em}
\gradetablestretch{2}
%\multirowgradetable{2}[questions]
\gradetable[h][questions]
%\GradeTable
\end{mybox}
}
%%%% STYLES
\tikzset{
  aprendizajebox/.style={xshift=-0.95\textwidth,
      yshift=-2.5cm,
      draw=OliveGreen, dashed,fill=white, rectangle,
      inner sep=15pt, style=rounded corners,
      %drop  shadow={fill=lightgray, opacity=0.7}
      },
  aprendizajetitle/.style={
      fill=white,
      style=rounded corners,
      % drop shadow,
    },
  requisitobox/.style={xshift=-.45\textwidth,
      yshift=-2.5cm,
      draw=OliveGreen,dashed, fill=white, rectangle,
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
    % %%%% LOGO
    % \node[anchor=center,yshift=1.9cm,xshift=-\textwidth]{\LOGO};
    % %%%% SCHOOL TITLE
    % \node[anchor=east, rectangle,yshift=1.5cm,xshift=3cm,
    % rounded corners=2pt,inner xsep=20pt,inner ysep=0pt]
    % {
    % \parbox{0.8\textwidth}{%
    % {\color{colorrds}\fontsize{20}{20}\selectfont \comfortaa  \textbf{Escuela Rafael D\'iaz Serd\'an}}\\[1ex]
    % { \fontsize{16}{20}\selectfont \textbf{\thesubject} \hfill \thegrade }\\
    % { \@author \hfill (\thecycle)}\\
    % %{}
    % % {\ifprintanswers
    % %   \textcolor{red}{\textbf{SOLUCIONES}}\\
    % % \fi
    % % }

    % }%
    % };
    %%%% APRENDIZAJES
    \node[aprendizajebox] (box)
    { \begin{minipage}{.42\textwidth}
        \normalfont  \theaprendizajes
      \end{minipage}};
    \node[aprendizajetitle,right=5pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Aprendizajes};
    \node[draw=none, fit=(box)] {};
    % %%%% REQUISITOS
    % \node[requisitobox] (box)
    % { \begin{minipage}{.42\textwidth}
    %     \normalfont \therequisitos
    %   \end{minipage}};
    % \node[requisitotitle,right=5pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Requisitos   };
    % \node[draw=none, fit=(box)] {};
    %%%% GRADESTABLE
    \node[requisitobox] (box)
    { \begin{minipage}{.42\textwidth}
        \normalfont \cellwidth{0.2em}
        \gradetablestretch{1.5}
        %\multirowgradetable{2}[questions]
        \gradetable[h]%[questions]
      \end{minipage}};
    \node[requisitotitle,right=5pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} Puntuación   };
    \node[draw=none, fit=(box)] {};
    %%%% INSTRUCCIONES
    \node[instructionbox] (box)
    { \begin{minipage}{.92\textwidth}
      Lee con atenci\'on cada uno de los siguientes ejercicios y realiza lo que se te pide.
      \end{minipage}};
    \node[instructiontitle] at (box.north) { \fontsize{12}{18}\selectfont\bfseries \comfortaa  Instrucciones   };
    \node[draw=none, fit=(box)] {};
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
      \parbox{0.65\textwidth}{
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
    fill=OliveDrab!50]
    {
      \begin{minipage}{1cm}
        \centering
        {\fontsize{9}{12}\selectfont \color{Sepia} \alterfont Guía}\\
        {\fontsize{28}{1}\selectfont \color{white} \bfseries \foekfamily \theguide}
      \end{minipage}
    };
  \end{tikzpicture}
  \begin{tikzpicture}[remember picture, overlay]
  %%%% LOGO
  \node[yshift=7.8cm,xshift=-.22\textwidth]{\LOGO};
  %%%% SCHOOL TITLE
  \node[anchor=west, rectangle,yshift=7.5cm,xshift=2cm,
  rounded corners=2pt,inner xsep=20pt,inner ysep=0pt]
  {
  \parbox{0.8\textwidth}{%
  {\color{colorrds}\fontsize{20}{20}\selectfont \comfortaa  \textbf{Escuela Rafael D\'iaz Serd\'an}}\\[1ex]
  { \fontsize{16}{20}\selectfont \textbf{\color{Goldenrod}\thesubject} \hfill {\color{OliveGreen}\thegrade} }\\
  { \@author \hfill \thecycle}\\
  %{}
  % {\ifprintanswers
  %   \textcolor{red}{\textbf{SOLUCIONES}}\\
  % \fi
  % }

  }%
  };
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
%%%% LINKS
\RequirePackage[colorlinks = true, linkcolor = colorrds]{hyperref}
\RequirePackage{float}
\RequirePackage{bookmark}
\RequirePackage{xparse}
\RequirePackage{wrapfig}
\RequirePackage{multicol}
%%%% MATH
\RequirePackage{amssymb,amsmath}
\decimalpoint
\RequirePackage{adjustbox}
\RequirePackage{myboxes}
%%%% EXTERNAL SOURCES
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble