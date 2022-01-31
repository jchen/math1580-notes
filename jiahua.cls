%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jiahua's latex styles.
% 
% Usage: 
% \documentclass[letterpaper, anon, colorful]{jiahua}
% 
% Mainly used for homework and class notes. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jiahua}[2022/01/29 Jiahua's Template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%% options %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifanon
\anonfalse
\DeclareOption{anon}{\anontrue}

% This doesn't work yet. 
\newif\ifcolorful
\colorfulfalse
\DeclareOption{colorful}{\colorfultrue}

% Hides date in top left header
\newif\ifnodate
\nodatefalse
\DeclareOption{nodate}{\nodatetrue}

% Problem set styles
\newif\ifpset
\psetfalse
\DeclareOption{pset}{\psettrue}

% New page break for gradescope
\newif\ifgradescope
\gradescopefalse
\DeclareOption{gradescope}{\gradescopetrue}

% Section numbering
\newif\ifrawnumbering
\rawnumberingtrue
\newif\ifsectionnumbering
\sectionnumberingfalse
\DeclareOption{sections}{
	\sectionnumberingtrue
	\subsectionnumberingfalse
	\rawnumberingfalse
}
\newif\ifsubsectionnumbering
\subsectionnumberingfalse
\DeclareOption{subsections}{
	\sectionnumberingfalse
	\subsectionnumberingtrue
	\rawnumberingfalse
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%% preamble %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base class
\LoadClass{article}

% Language
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}

% Metadata
\RequirePackage{titling}
\setlength{\droptitle}{-2cm}
\pretitle{\begin{center}\sffamily\bfseries\LARGE}
\preauthor{\begin{center}
	\large\sffamily \lineskip 0.5em%
	\begin{tabular}[t]{c}}
\predate{\begin{center}\sffamily\large}
\RequirePackage{abstract}
\renewcommand\abstractnamefont{\sffamily}

\ifanon
	\author{}
\else
	\author{Jiahua Chen}
\fi
\date{\today}

% Fix titling
\let\settitle\title
\renewcommand{\title}[1]{%
	\settitle{#1}%
	\newcommand{\headertitle}{#1}%
}

% Loads colors
\RequirePackage[dvipsnames]{xcolor}

% Format
\RequirePackage{geometry}
\geometry{
	left=20mm,
	right=20mm,
	top=20mm,
	bottom=20mm,
	headsep=5mm,
}
\RequirePackage{parskip}

% Section Styles
\RequirePackage{sectsty}

% Section Symbols
\RequirePackage{titlesec}
\titleformat{\section}{\sffamily\Large\bfseries}{\color{BlueViolet}\S\thesection}{1em}{}
\titleformat{\subsection}{\sffamily\large\bfseries}{\color{BlueViolet}\S\thesubsection}{1em}{}
\titleformat{\subsubsection}{\sffamily\bfseries}{\color{BlueViolet}\S\thesubsubsection}{1em}{}

% Section Fonts
\allsectionsfont{\sffamily}
\ifcolorful
	\allsectionsfont{\sffamily}
	% Stuff to do if document is colorful document
\fi

% For header
\RequirePackage{fancyhdr}
\addtolength{\topmargin}{-4pt}
\setlength{\headheight}{23pt}

\fancypagestyle{plain}{%
	\renewcommand{\headrulewidth}{0pt}% no rule above!
	\fancyhf{}\fancyfoot[L]{\thepage}%
}

\pagestyle{fancy}
\fancyhf{}
\lhead{\textbf{\theauthor} (\thedate)}
\ifnodate
	\lhead{\textbf{\theauthor}}
\fi
\rhead{\textbf{\headertitle}}
\cfoot{\thepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For tables
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.05}

% For links
\RequirePackage[
	colorlinks = true,
	linkcolor = blue,
	urlcolor  = blue,
	citecolor = blue,
	anchorcolor = blue]{hyperref}

% Underlining
\RequirePackage{soul}

% The usual
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% Graphs
\RequirePackage{tikz}

% Better enumerations
\RequirePackage{enumerate}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% environments %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colorful Boxes
\RequirePackage[most]{tcolorbox} % To make colorful boxes
\tcbset{textmarker/.style={%
			enhanced,
			breakable,
			parbox=false,boxrule=0mm,boxsep=0mm,arc=0mm,
			outer arc=0mm,left=6mm,right=3mm,top=7pt,bottom=7pt,
			toptitle=1mm,bottomtitle=1mm,oversize}}
\RequirePackage{environ}

% All sorts of proposition/theorem Environment
\ifrawnumbering
	\newtheorem{thm}{Theorem}
\fi
\ifsectionnumbering
	\newtheorem{thm}{Theorem}[section]
\fi
\ifsubsectionnumbering
	\newtheorem{thm}{Theorem}[subsection]
\fi
\newtheorem*{thm*}{Theorem}
\newtheorem{rawproposition}[thm]{Proposition}
\newtheorem*{rawproposition*}{Proposition}
\newtheorem{rawlemma}[thm]{Lemma}
\newtheorem*{rawlemma*}{Lemma}
\newtheorem{rawcorollary}[thm]{Corollary}
\newtheorem*{rawcorollary*}{Corollary}
\newtcolorbox{theoremBox}{textmarker,
	borderline west={6pt}{0pt}{red},
	colback=red!10!white}
\NewEnviron{theorem}{
	\begin{theoremBox}
		\begin{thm}
			\BODY
		\end{thm}
	\end{theoremBox}
}
\NewEnviron{theorem*}{
	\begin{theoremBox}
		\begin{thm*}
			\BODY
		\end{thm*}
	\end{theoremBox}
}
\NewEnviron{proposition}{
	\begin{theoremBox}
		\begin{rawproposition}
			\BODY
		\end{rawproposition}
	\end{theoremBox}
}
\NewEnviron{proposition*}{
	\begin{theoremBox}
		\begin{rawproposition*}
			\BODY
		\end{rawproposition*}
	\end{theoremBox}
}
\NewEnviron{lemma}{
	\begin{theoremBox}
		\begin{rawlemma}
			\BODY
		\end{rawlemma}
	\end{theoremBox}
}
\NewEnviron{lemma*}{
	\begin{theoremBox}
		\begin{rawlemma*}
			\BODY
		\end{rawlemma*}
	\end{theoremBox}
}
\NewEnviron{corollary}{
	\begin{theoremBox}
		\begin{rawcorollary}
			\BODY
		\end{rawcorollary}
	\end{theoremBox}
}
\NewEnviron{corollary*}{
	\begin{theoremBox}
		\begin{rawcorollary*}
			\BODY
		\end{rawcorollary*}
	\end{theoremBox}
}

% Definition Environment
\theoremstyle{definition}
\newtheorem{rawdefinition}[thm]{Definition}
\newtheorem*{rawdefinition*}{Definition}
\newtcolorbox{definitionBox}{textmarker,
	borderline west={6pt}{0pt}{cyan},
	colback=cyan!10!white}
\NewEnviron{definition}{
	\begin{definitionBox}
		\begin{rawdefinition}
			\BODY
		\end{rawdefinition}
	\end{definitionBox}
}
\NewEnviron{definition*}{
	\begin{definitionBox}
		\begin{rawdefinition*}
			\BODY
		\end{rawdefinition*}
	\end{definitionBox}
}

% Note Environment
\theoremstyle{remark}
\newtheorem{remark}[thm]{Remark}
\newtheorem*{remark*}{Remark}

% Example Environment
\newtheorem{example}[thm]{Example}
\newtheorem*{example*}{Example}

% Example Environment
\newtheorem{exercise}[thm]{Exercise}
\newtheorem*{exercise*}{Exercise}

% Problem Environments
\ifpset
	\NewEnviron{problem}[1]{
		\textbf{Problem #1.}
		\BODY
		\ifgradescope
			\newpage
		\fi
	}
\else
	\theoremstyle{definition}
	\newtheorem{problem}[thm]{Problem}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%% macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

