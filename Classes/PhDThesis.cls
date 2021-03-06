%
% Based on CUEDthesis v1.1 by Harish Bhanderi <harish.bhanderi@cantab.net>
%
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Classes/PhDThesis}[2010/07/14 based on v1.1 CUED thesis class]
%-------------------------- initial code -----------------------
\newif\ifCU@bookmode
\CU@bookmodetrue

\DeclareOption{report}{\CU@bookmodefalse}
\DeclareOption{book}{\CU@bookmodetrue}
\ProcessOptions\relax%

\ifCU@bookmode
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
   \LoadClass[dvips, a4paper]{book}%
\else%
   \LoadClass[pdftex, a4paper]{book}%
\fi%
\else
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
  \LoadClass[dvips, a4paper]{report}%
\else%
   \LoadClass[pdftex, a4paper]{report}%
\fi%
%\renewcommand{\refname}{References}%
\fi

\usepackage[a4paper,twoside,left=2.5cm,right=2cm,top=30mm,bottom=25mm,bindingoffset=1.5cm,head=14.5pt]{geometry}
\usepackage[sorting=none,style=numeric,citestyle=numeric,backref=true,hyperref=true,isbn=false,backend=bibtex]{biblatex}
\usepackage{setspace}
%\usepackage[nottoc,numbib]{tocbibind}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{siunitx}
\usepackage{hyphenat}
\usepackage{subfig}
\usepackage{makeidx}
\usepackage{fancyhdr}
\usepackage{eucal}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage{ifthen}
\usepackage{ifpdf}
\usepackage{xspace}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{array}
\usepackage{multirow}
\usepackage{pbox}
\usepackage{enumitem}
\usepackage{lmodern}
%\usepackage[utf8]{inputenc}
\usepackage[T2A,T1]{fontenc}
\usepackage[british]{babel}
\usepackage{csquotes}
\usepackage{hyphenat}
\usepackage[noindentafter, raggedright]{titlesec}
\usepackage{etoolbox}

% break urls in biblatex
\setcounter{biburllcpenalty}{7000}
\setcounter{biburlucpenalty}{8000}

% setup the SIunits package (more info in 'texdoc siunitx')
\sisetup{number-unit-product = \text{ }}
\sisetup{binary-units = true}
\sisetup{seperr, openerr=, closeerr=}

% Print URLs not in Typewriter Font                                     
\def\UrlFont{\rm}

% bold small caps fix
\normalfont
\DeclareFontShape{T1}{lmr}{bx}{sc} { <-> ssub * cmr/bx/sc }{}

% Feynman diagrams
\usepackage{feynmp}
\DeclareGraphicsRule{*}{mps}{*}{}

% hyphenation
\hyphenation{brems-strahl-ung}

% Tables handling: adjustable row styles
\newcolumntype{_}{>{\global\let\currentrowstyle\relax}}
\newcolumntype{^}{>{\currentrowstyle}}
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}
  #1\ignorespaces
}
\renewcommand{\arraystretch}{1.2}

%Bibliography
%uncomment next line to change bibliography name to references for Book document class
\renewbibmacro{in:}{}
\renewcommand{\bibname}{References}
% note that this doesn't do much if you later define another bibliography style 

\DefineBibliographyStrings{english}{%
  backrefpage = {cited on page},% originally "cit. on p"
  backrefpages = {cited on pages},% originally "cit. on pp"
}

% Nomenclature
\usepackage{nomencl}
\makenomenclature
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%             A - Roman
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%             G - Greek
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%              R - Superscripts
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%             S - Subscripts
	    \ifthenelse{\equal{#1}{X}}{%
	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
	    \ifthenelse{\equal{#1}{Z}}{%
	     \item[\textbf{Acronyms}]}%              Z - Acronyms
              			{{}}}}}}}}}}

\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
    \usepackage[ pdftex, plainpages = false,
                 pdfpagelabels = true, 
                 pdfpagelayout = OneColumn, % display single page, advancing flips the page - Sasa Tomic
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
%                 pagebackref,
                 colorlinks = false,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}
    \usepackage[pdftex]{graphicx}
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}

    \pdfcompresslevel=9
    \graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
    \usepackage[ dvips, 
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
%                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}

    %\usepackage{epsfig}
    \usepackage{graphicx}
    \DeclareGraphicsExtensions{.eps, .ps}
    \graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi

\newcommand{\headfont}{\slshape}
\newcommand{\chapterheadfont}{}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\fancyhf{} % clear all header and footer fields
%\fancyhead[LE,RO]{{\headfont\thepage}} % left/right header for even/odd pages
\fancyfoot[C]{\thepage}
\fancyhead[LO]{\headfont\nouppercase{\rightmark}} % header for left side (odd)
\fancyhead[RE]{\headfont\nouppercase{\leftmark}} % right header for even pages
\renewcommand{\headrulewidth}{0.5pt} % head rule
\renewcommand{\footrulewidth}{0pt} % no rule
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\thepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% style for headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\chaptername}{
\vspace*{-2cm}
}

\titleformat{\chapter}[block]
  {\addvspace{-4pc}%
  \Huge\bfseries}
  {\thechapter.}
  {10pt}
  {\formatchaptertitle}

\newcommand{\formatchaptertitle}[1]{%
  \parbox[t]{\dimexpr\textwidth-10pt}{\raggedright#1}}

%\newcommand{\chapterNumber}{%
%  \fontsize{50}{50}\usefont{U}{eur}{b}{n}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\section}[hang]
{\Large\bfseries}
{\thesection}{1em}{}
 
\titlespacing{\section}{0pt}{10pt}{5pt}

%% index (also for other font families)              

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}\chapterheadfont\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}{\chapterheadfont #5}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%              

%% style of index page

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewenvironment{theindex}
{\if@twocolumn
   \@restonecolfalse
 \else
   \@restonecoltrue
 \fi
 \columnseprule \z@
 \columnsep 35\p@
 \twocolumn[\@makeschapterhead{\indexname}]%       
 \@mkboth{\indexname}%
         {\indexname}%
 \addcontentsline{toc}{chapter}{\indexname}%
 \thispagestyle{fancy}
 \flushbottom
 \parindent\z@
 \parskip\z@ \@plus .3\p@\relax
 \let\item\@idxitem
 \def\,{\relax\ifmmode\mskip\thinmuskip
              \else\hskip0.2em\ignorespaces\fi}%
 \raggedright}


\newcommand{\submittedtext}{{A thesis submitted for the degree of}}
%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The word count of thesis
\def\wordcount#1{\gdef\@wordcount{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}{%
\pagenumbering{roman} % Sasa Tomic
\setcounter{page}{1}  % Sasa Tomic
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \centering
    { \Huge {\bfseries {\@title}} \par}
    {\vspace*{35mm} {\Large \@author} \par}
{\vspace*{35mm} {{\@crest} \par} \vspace*{35mm}}
{\large \vspace*{1ex}
    %{{\@collegeordept} \par}
%\vspace*{1ex}
    %{{\@university} \par}
    {{\submittedtext} \par}
    \null
    \vfill
    {\raggedleft {\@wordcount} \par}
    {\raggedleft {\@collegeordept} \par}
    {\raggedleft {\@degreedate} \par}}
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \centering
  \vspace*{7.5cm}
  {\LARGE }
  \vspace{0.5cm}
  \begin{quote} \centering}
{\end{quote} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

%\newenvironment{acknowledgements}
%{\pagestyle{empty}
%\begin{alwayssingle}
%\centering
%\vspace*{1.5cm}
%{\Large \bfseries Acknowledgements}
%\vspace{0.5cm}
%\begin{quote}}
%{\end{quote}\end{alwayssingle}}

\newenvironment{acknowledgements}{
\cleardoublepage
\chapter*{\centering \Large Acknowledgements}
}


\newenvironment{declaration}{
\cleardoublepage
\chapter*{\centering \Large Author's Declaration}
}



%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstract}{
\cleardoublepage
\chapter*{\centering \Large Abstract}
}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}
%{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

