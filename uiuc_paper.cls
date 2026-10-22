%%======== UIUC Paper Template (v3 — clean & minimal) ========
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uiuc_paper}[2025/02/22 UIUC Paper Template v3]
\LoadClassWithOptions{article}

%% ======== Layout ========
\RequirePackage[top=2.2cm, bottom=2.5cm, left=2.5cm, right=2.5cm, columnsep=0.65cm]{geometry}
\RequirePackage{microtype}
\RequirePackage{placeins}
\RequirePackage{hyphenat}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage[english]{babel}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{bm}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}

%% ======== Colors — Deep Navy + Black ========
\definecolor{cloudgray}{HTML}{F8F9FA}
\definecolor{stormgray}{HTML}{8B95A5}
\definecolor{rulegray}{HTML}{CBD5E1}

%% ======== References ========
\RequirePackage[pdftex]{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=black,
  citecolor=black,
  urlcolor=black
}

\RequirePackage[numbers, sort&compress]{natbib}
\def\bibfont{\small}
\addto{\captionsenglish}{\renewcommand{\refname}{References}}

%% ======== Section formatting — clean black ========
\newcommand{\sectionfont}{\fontsize{12}{14}\selectfont}
\newcommand{\subsectionfont}{\fontsize{11}{13}\selectfont}

\RequirePackage{titlesec}
\titleformat{\section}
  {\sectionfont\sffamily\bfseries}
  {\thesection}{0.6em}{}
\titleformat{\subsection}
  {\subsectionfont\sffamily\bfseries}
  {\thesubsection}{0.5em}{}
\titleformat{\subsubsection}
  {\normalsize\sffamily\bfseries}
  {\thesubsubsection}{0.5em}{}
\titleformat*{\paragraph}{\itshape}

%% ======== Bullet styling ========
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}

%% ======== Caption formatting ========
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{custom}{ }
\DeclareCaptionFormat{custom}{{\sffamily\textbf{#1#2}}#3}
\captionsetup{format=custom,labelsep=custom,font=small}
\captionsetup[sub]{format=custom,labelsep=custom,font=small}

%% ======== Font setup (classic) ========
\RequirePackage[T1]{fontenc}
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{cmr}

%% ======== Authors & Affiliations ========
\renewcommand\addtolist[5][]{
  \begingroup
    \if\relax#3\relax\def\sep{}\else\def\sep{#5}\fi
    \let\protect\@unexpandable@protect
    \xdef#3{\expandafter{#3}\sep #4[#1]{#2}}%
  \endgroup
}

\newcommand{\authorfont}{\fontsize{11}{13}\selectfont}
\newcommand\authorlist{}
\newcommand\authorformat[2][]{\authorfont{\sffamily #2\textsuperscript{\scriptsize #1}}}
\renewcommand\author[2][]{\addtolist[#1]{#2}{\authorlist}{\authorformat}{,\;\;}}

\newcommand{\affiliationfont}{\fontsize{9.5}{11}\selectfont}
\newcommand\affiliationlist{}
\newcommand\affiliationformat[2][]{{\affiliationfont{\color{gray!70!black}\sffamily \textsuperscript{\scriptsize #1}#2}}}
\newcommand\affiliation[2][]{\addtolist[#1]{#2}{\affiliationlist}{\affiliationformat}{\quad}}

\newcommand{\contributionfont}{\fontsize{9}{11}\selectfont}
\newcommand\contributionlist{}
\newcommand\contributionformat[2][]{{\contributionfont\textsuperscript{#1}#2}}
\newcommand\contribution[2][]{\addtolist[#1]{#2}{\contributionlist}{\contributionformat}{, }}

%% ======== Metadata fields ========
\newcommand{\checkdatafont}{\fontsize{8.5}{10}\selectfont}
\newcommand\checkdatalist{}
\newcommand\checkdataformat[2][]{{\checkdatafont{\sffamily\bfseries #1:} {\checkdatafont #2}}}
\newcommand\checkdata[2][]{\addtolist[#1]{#2}{\checkdatalist}{\checkdataformat}{\quad\textcolor{stormgray}{|}\quad}}

\newcommand{\abstractinfont}{\fontsize{10}{12}\selectfont}
\renewcommand{\abstract}[1]{\def\abstractlist{{\abstractinfont #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

\renewcommand\date[1]{\checkdata[Date]{#1}}
\newcommand\correspondence[1]{\checkdata[Correspondence]{#1}}

%% ======== Title ========
\newcommand{\titlefont}{\fontsize{17}{20}\selectfont}
\renewcommand{\title}[1]{\newcommand{\titlelist}{\titlefont{\sffamily #1}}}

\newcommand{\abstractfont}{\fontsize{11}{13}\selectfont}
\newcommand{\beginabstract}{\abstractfont{\sffamily\bfseries Abstract\par}}

%% ======== Header / Footer ========
%% First page: large centered university logo, no "Technical Report"
%% Rebrand here (one place only): point \headerlogo at another file in figs/,
%% or override it in the preamble with \renewcommand{\headerlogo}{...}
\newcommand{\headerlogo}{figs/seu-logo.png}
\newlength{\headerlogoheight}\setlength{\headerlogoheight}{16mm}
\setlength{\headheight}{16mm}
\setlength{\headsep}{3mm}
\fancypagestyle{firststyle}{
    \fancyhf{}
    \fancyhead[C]{%
        \raisebox{0mm}{\includegraphics[height=\headerlogoheight]{\headerlogo}}%
    }
    \fancyfoot[C]{\small\sffamily\color{stormgray}\thepage}
}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\small\sffamily\color{stormgray}\thepage}
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[C]{\small\sffamily\color{stormgray}\thepage}
}

%% ======== Title decoration — simple clean lines ========
\newcommand{\@toptitlebar}{%
  {\hrule height 0.8pt}%
  \vskip 6mm%
}
\newcommand{\@bottomtitlebar}{%
  \vskip 6mm%
  {\hrule height 0.8pt}%
}

%% ======== Titlebox ========
\newcommand{\mymaketitle}{%
  {
    \setlength{\parskip}{0mm}
    \centering
    \nohyphens
    {
      \@toptitlebar
      \titlelist\par
      \@bottomtitlebar
    }
    \vskip 6mm
    \authorlist\par
    \vskip 3mm
    \affiliationlist\par
    \vskip 2mm
    \contributionlist\par
  }
  \vskip 6mm
  %% Abstract box — clean navy frame, subtle gray fill, rounded corners
  \begin{tcolorbox}[
    enhanced,
    left=8mm, right=8mm, top=5mm, bottom=5mm,
    colback=cloudgray,
    colframe=black!80,
    boxrule=0.5pt,
    arc=2.5mm,
    before skip=0pt,
    grow to left by=1pt,
    grow to right by=1pt,
  ]
    \setlength{\parindent}{0cm}
    \setlength{\parskip}{0cm}
    \begin{center}
      \beginabstract
      \vskip 3mm
    \end{center}
    \abstractlist\par
    \vskip 4mm
    {
      \setlength{\parskip}{0cm}
      {\color{rulegray}\hrule height 0.3pt}
      \vskip 3mm
      \ifdefempty{\checkdatalist}{}{\checkdatalist\par}
    }
  \end{tcolorbox}
  \tcbset{reset}
  \FloatBarrier
  \thispagestyle{firststyle}
}

\if@twocolumn%
  \renewcommand{\maketitle}{
    \twocolumn[%
      \vskip 3mm
      \mymaketitle
      \vskip 8mm
    ]
  }%
\else%
  \renewcommand{\maketitle}{
    \mymaketitle
    \vskip 8mm
  }%
\fi

%% ======== Table of Contents (optional) ========
\RequirePackage[subfigure]{tocloft}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecfont}{\sffamily}
\renewcommand{\cftsecpagefont}{\sffamily}
\renewcommand{\cfttoctitlefont}{\sffamily\sectionfont\bfseries}
