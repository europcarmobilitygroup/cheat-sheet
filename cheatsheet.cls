\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2023 Cheat Sheet - Adam Sokolowski]

% Base class
\LoadClass[14pt,a4paper]{extarticle}

% Margins setup
\RequirePackage[left=0.5cm,right=0.5cm,top=0cm,bottom=0cm,landscape]{geometry}

% Disable page numbers
\pagestyle{empty}

% Encoding and font style
\usepackage[sfdefault]{inter}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

% FontAwesome 5 icons
\usepackage[fixed]{fontawesome5}

% Package for clickable links
\usepackage{hyperref}

% Cancel new paragraph's indentation
\usepackage{parskip}

% Allows custom color definitions
\usepackage[dvipsnames]{xcolor}
\usepackage[inkscapeformat=png]{svg}
\usepackage{tikz}
\usepackage{background}
\usepackage{amssymb}
\usepackage{listings}

% The zero point of the coordinate systemis the lower left corner of the page (the default).
\usepackage[pscoord]{eso-pic}

\definecolor{emobg1}{RGB}{0, 103, 95}
\definecolor{emobg2}{RGB}{0, 188, 180}
\definecolor{emobg3}{RGB}{24, 48, 41}

\colorlet{body}{Black!75}
\colorlet{emphasis}{Black!15}

% Configurable main color
\colorlet{accent}{emobg1}
\define@key{cheatsheet.cls}{color}[]{%
    \colorlet{accent}{#1}
}

\backgroundsetup{
    scale=1,
    angle=-90,
    opacity=.1,
    contents={\includegraphics{assets/background.pdf}}
}

\hypersetup{
    colorlinks,
    urlcolor={emobg1}
}

\lstset{
    showstringspaces=false,
    basicstyle=\ttfamily,
}

\newcommand{\inlinecode}[1]{\colorbox{emphasis}{\lstinline[language=Java]$#1$}}

\AtBeginDocument{\color{body}}
\AtBeginDocument{\small}

% Header helper commands
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\info}[1]{\def\@info{#1}}
\newcommand{\icon}[2]{
    \mbox{
        \hspace{-.5em}\textcolor{body}{#1}#2
    }
}
\newcommand{\github}[1]{\icon{\faGithubSquare}{\href{https://github.com/#1}{#1}}}

% Document header
\newcommand{\sheetHeader}{%
    {
        \medskip
        \begin{flushright}
            {
                \color{body}
                \small\@info
                \par
            }
        \end{flushright}
    }
}

% Section title
\newcommand{
    \sheetTitle}[1]{
    \medskip
        {\large\color{black}#1}\\[-1ex]%
        {\rule{\linewidth}}
    \medskip
}

% Tags with percentage saturation
\newcommand{\sheetTag}[2]{
    \def
        \saturation{#2}%
    \tikz
        \node[
            color=white,
            fill=accent!\saturation,
            rounded corners = .5ex,
            inner xsep = .75ex,
            inner ysep = .5ex,
            text height = 1.5ex,
            text depth = .25ex,
            below = .5ex
          ]{#1};
    \vspace{2.5pt}
}

\newcommand{\sheetTagText}[1]{
    \tikz
        \node[
            color=Black!75,
            inner xsep = .75ex,
            inner ysep = .5ex,
            text depth = .25ex,
            text height = 1.5ex,
    	      text width = 82.5ex
          ]{#1};
    \vspace{2.5pt}
}

% Floating text box
% \sheetTextbox{<offset top>}{<offset left/right>}{<align>}{<content>}
\newcommand{\sheetTextbox}[4]{
  \setbox0=\hbox{#4}
  \AddToShipoutPictureFG*{
    \if#3r
    \put(\LenToUnit{\paperwidth-#1},\LenToUnit{\paperheight-#2}){\vtop{{\null}\makebox[0pt][r]{\begin{tabular}{r}#4\end{tabular}}}}%
    \else
    \put(\LenToUnit{#1},\LenToUnit{\paperheight-#2}){\vtop{{\null}\makebox[0pt][l]{\begin{tabular}{l}#4\end{tabular}}}}%
    \fi
  }%
}%