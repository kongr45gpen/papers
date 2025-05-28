\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iac}[2014/07/24 International Astronautical Congress conference paper LaTeX class]

\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext, newtxmath}

%\RequirePackage{amsmath}
%\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsfonts}

\LoadClass[twocolumn,letter paper,10pt,nobalancelastpage]{article}

\RequirePackage[margin=1in,top=1.25in,headheight=\baselineskip]{geometry} % page layout
\RequirePackage{graphicx}
%\RequirePackage{array}
\RequirePackage{booktabs}
%\RequirePackage{overcite}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[explicit,compact]{titlesec}
%\RequirePackage[normalem]{ulem}
\RequirePackage{etoolbox}
\RequirePackage{alphalph}
\RequirePackage{csquotes}
\RequirePackage{multicol}
\RequirePackage{float}

%\RequirePackage{indentfirst}

\renewcommand{\headrulewidth}{0pt}
%% Add section numbers in arabic rather than roman 5%
\renewcommand*\sectionmark[1]{\markright{\thesection.\ #1}}

\newcounter{authcount}
\newcounter{affilcount}
% \newcommand{\IACauthor}[2]{%
% 	\stepcounter{authcount}%
% 	\csdef{iac@author\theauthcount}{#1}%
% 	\csdef{iac@affiliation\theauthcount}{#2}}

\newcommand{\IACauthor}[3]{%
	\stepcounter{authcount}%
	\csdef{iac@author\theauthcount}{#1}%
	\csdef{iac@mail\theauthcount}{#2}
        \csedef{iac@affiliation\theauthcount}{#3}}

% \newcommand{\IACauthor}[2]{%
% 	\stepcounter{authcount}%
% 	\csdef{iac@author\theauthcount}{#1}%
%         \csdef{iac@authoraffil\theauthcount}{#2}
% }

%  \newcommand{\IACaffil}[1]{
%         \stepcounter{affilcount}%
%         \csdef{iac@affiliation\theaffilcount}{#1}
%  }

\setlength\parindent{14pt}
\RequirePackage[]{caption}
\captionsetup[figure]{name=Fig.,format=hang,indention=-20pt}
\captionsetup[table]{format=hang,indention=-24pt}

\titlespacing{\section}{0pt}{*2}{*1}
\titlespacing{\subsection}{0pt}{*2}{*1}
\titlespacing{\subsubsection}{0pt}{\baselineskip}{\parskip}
\titleformat{\section}{\normalfont\bfseries\ifnum \thesection=1 \vspace{1.2\baselineskip}\fi}{\thesection.}{0.5em}{#1}
\titleformat{\subsection}{\normalfont\itshape}{\thesection.\arabic{subsection}}{0.5em}{#1}
\titleformat{\subsubsection}{\normalfont\itshape}{\thesection.\arabic{subsection}.\arabic{subsubsection}}{0.5em}{#1}

\renewcommand{\abstract}[1]{\def\iac@abstract{#1}}
\newcommand{\IACkeywords}[6]{\def\iac@keywords{\textbf{keywords:} #1, #2, #3, #4, #5, #6}}
\newcommand*{\IACpaperyear}[1]{\def\iac@paperyear{#1}}\IACpaperyear{}
\newcommand*{\IACpapernumber}[1]{\def\iac@papernumber{#1}}\IACpapernumber{}
\newcommand*{\IACconference}[1]{\def\iac@conference{#1}}\IACconference{}
\newcommand*{\IACcopyright}[1]{\def\iac@copyright{#1}}\IACcopyright{}
\newcommand*{\IAClocation}[1]{\def\iac@location{#1}}\IAClocation{}

\newcommand{\IACcopyrightA}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. All rights reserved.}}
\newcommand{\IACcopyrightB}[2]{\def\iac@copyright{Copyright \copyright\,#1 by #2. Published by the International Astronautical Federation with permission.}}
\newcommand{\IACcopyrightC}{\def\iac@copyright{This material is declared a work of the U.S.\ Government and is not subject to copyright protection in the United States.}}
\newcommand{\IACcopyrightD}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. The U.S.\ Government has a royalty-free license to exercise all rights under the copyright claimed herein for Governmental purposes. All other rights are reserved by the copyright owner.}}
\newcommand{\IACcopyrightDAPL}[1]{\def\iac@copyright{Copyright \copyright\,#1 by the International Astronautical Federation. Under the copyright claimed herein, the U.S.\ Government has a royalty-free license to exercise all rights for Governmental purposes. All other rights are reserved by the copyright owner.}} 
\newcommand\iac@makecopyright{{\iac@copyright}}

\renewcommand\maketitle{\twocolumn[
  \begin{@twocolumnfalse}
  \lhead{}\chead{\footnotesize \iac@conference th International Astronautical Congress, {\iac@location}.\\ \iac@makecopyright}\rhead{}%
  \lfoot{IAC--\iac@paperyear--\iac@papernumber}\cfoot{}\rfoot{Page \thepage\ of \pageref{LastPage}}%
  \begingroup
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
  \endgroup
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
  \end{@twocolumnfalse}
  ]}
\def\@maketitle{%
  \newpage%
  \begin{center}%
  	\vskip -1em%
    IAC--\iac@paperyear--\iac@papernumber\par%
    \vskip1em%
    {\large \textbf{{\@title}} \par}%
    \vskip 1em%
    {%
    \begin{multicols}{3}
    \large%
      \lineskip .5em%
      \newcounter{authnum}%
      \setcounter{authnum}{0}%
      \whileboolexpr%
      { test {\ifnumcomp{\value{authnum}}{<}{\theauthcount}} }%
      {\stepcounter{authnum}%
      	\begin{minipage}{\columnwidth}
            \centering%
       \normalsize\textbf{\csuse{iac@author\theauthnum}\textsuperscript{\csuse{iac@affiliation\theauthnum}}}\par\nopagebreak%
		\normalsize\csuse{iac@mail\theauthnum} \par\nopagebreak%
		
  \end{minipage}%
  \vskip 1ex%
	  }\nopagebreak%
   \end{multicols}
    }%
    
  \end{center}%
  {\footnotesize
    \textsuperscript{1}: Interdisciplinary Centre for Security, Reliability and Trust, University of Luxembourg}
  \begin{center}\vskip 1ex \textbf{Abstract}\end{center}%
  \vskip -2ex \hspace{14pt} \iac@abstract\par%
  % \indent\iac@keywords\par%
  \textbf{Keywords:} cubesat, testing, design, FYS, on-board computer
  \vskip 4.5ex
}

\pagestyle{fancy}%
  
\makeatletter
\newcommand*{\fnsymbolsingle}[1]{%
  \ensuremath{%
    \ifcase#1%
    \or *%
    \or \dagger
    \or \ddagger
    \or \mathsection
    \or \mathparagraph
    \else
      \@ctrerr
    \fi
  }%
}
\makeatother
\newalphalph{\fnsymbolmult}[mult]{\fnsymbolsingle}{}
\renewcommand*{\thefootnote}{%
  \fnsymbolmult{\value{footnote}}%
}
\makeatletter
	\def\tagform@#1{\maketag@@@{(#1)\@@italiccorr}}
\makeatother
\endinput