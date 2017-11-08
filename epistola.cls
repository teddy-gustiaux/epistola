\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epistola}[2017/11/08 Epistola Letter Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{moderncv}}
\ProcessOptions\relax
\LoadClass[]{lettre}

\RequirePackage{nag}
\RequirePackage{ifplatform}
\RequirePackage{fontawesome}
\ifwindows
    \newfontfamily{\FA}{fontawesome.otf}
\fi
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

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Linux Biolinum O}
\geometry{hmargin=1.25cm,vmargin=0.75cm,nomarginpar}

% Commande pour la fermeture de la lettre
\newcommand{\close}[1]{%
	 \flushright
    \setlength{\parskip}{1pt}{%
        \closing{#1}%
        \includegraphics[scale=0.75]{signature.jpg}%
    }%
}

% Commande pour la personnalisation
\newcommand{\customize}{%

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
    \marge{10mm}                   % Défaut : 15mm
    % Espace entre les blocs : -6 très serré, 6 moins serré
    \tension{6}

    % Espacement vertical entre texte et signature
    \def\sigspace{1.5cm}           % Défaut : 1.5cm

    % Boîte d'en-tête
    \def\pict@let@width{185}       % Défaut : 185
    \def\pict@let@height{65}       % Défaut : 65
    \def\pict@let@hoffset{-20}     % Défaut : 0
    \def\pict@let@voffset{20}      % Défaut : 0

    % Trait de pliage
    \def\rule@hpos{-35}            % Défaut : -25
    \def\rule@vpos{0}              % Défaut : -15
    \def\rule@length{5}            % Défaut : 10

    % Adresse de l'expéditeur
    \def\fromaddress@let@hpos{-10} % Défaut : -10
    \def\fromaddress@let@vpos{80}  % Défaut : 70
    \fromaddress@let@width=69mm    % Défaut : 69

    % Lieu d'expédition
    \def\fromlieu@let@hpos{90}     % Défaut : 90
    \def\fromlieu@let@vpos{0}      % Défaut : 62
    \fromlieu@let@width=69mm       % Défaut : 69

    % Adresse du destinataire
    \def\toaddress@let@hpos{90}    % Défaut : 90
    \def\toaddress@let@vpos{40}    % Défaut : 40
    \toaddress@let@width=80mm      % Défaut : 80
}

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