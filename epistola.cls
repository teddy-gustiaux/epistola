% =======================================
% IDENTIFICATION
% =======================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epistola}[2017/11/08 Epistola Letter Class]

% =======================================
% TEMPLATE SETTINGS AND OPTIONS
% =======================================
\newif\if@french\@frenchfalse
\DeclareOption{french}{\@frenchtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lettre}}
\ProcessOptions\relax
\LoadClass[]{lettre}

% =======================================
% PACKAGES
% =======================================
\RequirePackage{nag}
\RequirePackage{fontawesome}
\RequirePackage{eurosym}
\RequirePackage[a4paper]{geometry}
\RequirePackage{numprint}
\RequirePackage{microtype}
\RequirePackage{lipsum}
\RequirePackage{xunicode}
\if@french
	\RequirePackage[french]{babel}
	\RequirePackage[french]{isodate}
\fi
\RequirePackage[unicode,pdfencoding=auto,bookmarks=false]{hyperref}
\RequirePackage{hyperxmp}

% =======================================
% SETTINGS
% =======================================

% -- FONTS --
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Linux Biolinum O}

% -- LAYOUT --
\geometry{hmargin=1.25cm,vmargin=0.75cm,nomarginpar}

\AtBeginDocument{
	
	\institut{information}
	
	\begin{letter}{\@recipient}
	
	\nofax
	\francais
	\pagestyle{empty}
	\renewcommand{\tellabelname}{\faPhone~~}
	\renewcommand{\emaillabelname}{\faEnvelope~~}
	
	% Left margin
	\marge{10mm}                   % Default: 15mm
	% Space between blocks: -6 tighter, 6 looser
	\tension{6}
	% Vertical spacing between text and signature
	\def\sigspace{1cm}            % Default: 1.5cm
	% Header box
	\def\pict@let@width{185}       % Default: 185
	\def\pict@let@height{65}       % Default: 65
	\def\pict@let@hoffset{-20}     % Default: 0
	\def\pict@let@voffset{20}      % Default: 0
	% Bending line
	\def\rule@hpos{-35}            % Default: -25
	\def\rule@vpos{0}              % Default: -15
	\def\rule@length{5}            % Default: 10
	% Sender adress
	\def\fromaddress@let@hpos{-10} % Default: -10
	\def\fromaddress@let@vpos{80}  % Default: 70
	\fromaddress@let@width=69mm    % Default: 69
	% Shipping location
	\def\fromlieu@let@hpos{90}     % Default: 90
	\def\fromlieu@let@vpos{0}      % Default: 62
	\fromlieu@let@width=69mm       % Default: 69
	% Recepient address
	\def\toaddress@let@hpos{90}    % Default: 90
	\def\toaddress@let@vpos{40}    % Default: 40
	\toaddress@let@width=80mm      % Default: 80
}

\AtEndDocument{%
	\end{letter}%
}

% =======================================
% COMMANDS
% =======================================

% -- LETTER INFORMATION --
\newcommand*{\recipient}[1]{\def\@recipient{#1}}
\newcommand*{\phone}[1]{\def\@phone{#1} \telephone{#1}}
\newcommand*{\object}[1]{\def\@object{\textbf{#1}} \conc{\textbf{#1}}}

% -- CLOSING --
\newcommand{\close}[1]{%
	\par\stopbreaks
	\par\vspace{2\parskip}%
	\nobreak
	\noindent
    \parbox[t]{\letterwidth}{#1}%
	\par\vspace*{\parskip}%
	\par\vspace*{\sigspace}%
	\hspace*{\ssigindent}%
	\noindent
	\parbox[t]{\ssigwidth}{\centering \ignorespaces\fromname\\\includegraphics[scale=0.75]{signature.jpg}}
	\par\vfill\startbreaks
}

% =======================================
% METADATA
% =======================================

\hypersetup{%
    unicode = true,%
    pdftitle = {},%
    pdfauthor = {},%
    pdfcreator = {XeLaTeX},%
    bookmarksnumbered = true,%
    bookmarksopen = false,%
    colorlinks = false,%
    pdfborder = {0 0 0},%
    pdfcopyright = {},%
    pdfsubject = {},%
    pdfkeywords = {},%
    pdfpagemode   = UseNone,%
    pdfstartpage  = 1,%
}

\endinput