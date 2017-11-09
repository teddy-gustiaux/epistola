% =======================================
% IDENTIFICATION
% =======================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epistola}[2017/11/08 Epistola Letter Class]

% =======================================
% TEMPLATE SETTINGS AND OPTIONS
% =======================================
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
\RequirePackage[french]{babel}
\RequirePackage[french]{isodate}
\RequirePackage[unicode,pdfencoding=auto,bookmarks=false]{hyperref}
\RequirePackage{hyperxmp}

% =======================================
% SETTINGS
% =======================================

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Linux Biolinum O}
\geometry{hmargin=1.25cm,vmargin=0.75cm,nomarginpar}

\AtBeginDocument{
	\begin{letter}{Madame Dupont\\84, rue Victor Hugo\\31000 Toulouse}
	% Pas de fax
	\nofax
	% Lettre française
	\francais
	% Page vide
	\pagestyle{empty}
	
	% Icône pour le téléhpone
	\renewcommand{\tellabelname}{\faPhone~~}
	
	% Icône pour le courriel
	\renewcommand{\emaillabelname}{\faEnvelope~~}
	
	% Marge du côté gauche
	\marge{10mm}                   % Default: 15mm
	% Espace entre les blocs : -6 très serré, 6 moins serré
	\tension{6}
	
	% Espacement vertical entre texte et signature
	\def\sigspace{1cm}            % Default: 1.5cm
	
	% Boîte d'en-tête
	\def\pict@let@width{185}       % Default: 185
	\def\pict@let@height{65}       % Default: 65
	\def\pict@let@hoffset{-20}     % Default: 0
	\def\pict@let@voffset{20}      % Default: 0
	
	% Trait de pliage
	\def\rule@hpos{-35}            % Default: -25
	\def\rule@vpos{0}              % Default: -15
	\def\rule@length{5}            % Default: 10
	
	% Adresse de l'expéditeur
	\def\fromaddress@let@hpos{-10} % Default: -10
	\def\fromaddress@let@vpos{80}  % Default: 70
	\fromaddress@let@width=69mm    % Default: 69
	
	% Lieu d'expédition
	\def\fromlieu@let@hpos{90}     % Default: 90
	\def\fromlieu@let@vpos{0}      % Default: 62
	\fromlieu@let@width=69mm       % Default: 69
	
	% Adresse du destinataire
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

% Commande pour la fermeture de la lettre
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
    pdftitle = {Lettre},%
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