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

\newif\if@english\@englishfalse
\DeclareOption{english}{\@englishtrue}

\newif\if@signature\@signaturefalse
\DeclareOption{signature}{\@signaturetrue}

\ProcessOptions\relax
\if@french
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{lettre}}
	\ProcessOptions\relax
	\LoadClass[]{lettre}
\fi
\if@english
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
	\ProcessOptions\relax
	\LoadClass[]{letter}
\fi

% =======================================
% PACKAGES
% =======================================
\RequirePackage{nag}
\RequirePackage{fontawesome}
\RequirePackage{eurosym}
\RequirePackage{numprint}
\RequirePackage{microtype}
\RequirePackage{lipsum}
\RequirePackage{xunicode}
\RequirePackage{graphicx}
\RequirePackage{datetime}
\if@french
	\RequirePackage[a4paper]{geometry}
	\RequirePackage[french]{isodate}
	\RequirePackage[french]{babel}
\fi
\if@english
	\RequirePackage[letterpaper]{geometry}
	\RequirePackage[american]{isodate}
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
\if@french
	\geometry{top=1.5cm,left=2.5cm,right=2.5cm}
\fi
\if@english
	\longindentation=0pt
\fi

\AtBeginDocument{
	
	\if@french
		\institut{information}
	\fi
	
	\begin{letter}{\@recipient}
	
	\if@french
		\francais
		\nofax
		\pagestyle{empty}
		\renewcommand{\tellabelname}{\faPhone~~}
		\renewcommand{\emaillabelname}{\faEnvelope~~}
		
		% Left margin
		\marge{0mm}                   % Default: 15mm
		% Space between blocks: -6 tighter, 6 looser
		\tension{6}
		% Vertical spacing between text and signature
		\def\sigspace{1cm}             % Default: 1.5cm
		% Header box
		\def\pict@let@width{185}       % Default: 185
		\def\pict@let@height{65}       % Default: 65
		\def\pict@let@hoffset{-10}     % Default: 0
		\def\pict@let@voffset{10}      % Default: 0
		% Bending line
		\def\rule@hpos{-35}            % Default: -25
		\def\rule@vpos{0}              % Default: -15
		\def\rule@length{5}            % Default: 10
		% Sender adress
		\def\fromaddress@let@hpos{-10} % Default: -10
		\def\fromaddress@let@vpos{70}  % Default: 70
		\fromaddress@let@width=69mm    % Default: 69
		% Shipping location
		\def\fromlieu@let@hpos{90}     % Default: 90
		\def\fromlieu@let@vpos{0}      % Default: 62
		\fromlieu@let@width=69mm       % Default: 69
		% Recepient address
		\def\toaddress@let@hpos{90}    % Default: 90
		\def\toaddress@let@vpos{40}    % Default: 40
		\toaddress@let@width=80mm      % Default: 80
		
		\def\concline{%
			\vspace{-5mm}
			\noindent\parbox[t]{\letterwidth}%
			{\@hangfrom{\textrm{\concname}}\ignorespaces\concdecl\strut}%
			\par%
		}%	
	\fi
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
\if@french

	\renewcommand*{\location}[1]{
		\ifx&#1&%
			\nolieu
		\else
			\def\@location{#1} \lieu{#1}
		\fi
	}

	\renewcommand{\closing}[1]{%
		\par\stopbreaks
		\par\vspace{2\parskip}%
		\nobreak
		\noindent
		\parbox[t]{\letterwidth}{#1}%
		\par\vspace*{\parskip}%
		\par\vspace*{\sigspace}%
		\if@french
		\hspace*{\ssigindent}%
		\noindent
		\parbox[t]{\ssigwidth}{
			\centering \ignorespaces\fromname\\%
			\if@signature
			\includegraphics[scale=0.75]{signature}%
			\fi
		}
		\fi
		\if@english
		\noindent
		\parbox[t]{\ssigwidth}{
			\ignorespaces\fromname\\%
			\if@signature
				\includegraphics[scale=0.75]{signature}%
			\fi
		}
		\fi
		\par\vfill\startbreaks
	}


\fi

\if@english
	\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
		\stopbreaks
		\noindent
		\ifx\@empty\fromaddress\else
		\hspace*{\longindentation}\fi
		\parbox{\indentedwidth}{\raggedright
			\ignorespaces #1\\[0.4in]%
			\if@signature
				\includegraphics[scale=0.75]{signature}\\%
			\fi
			\fromname
			\strut
		}%
		\par%
	}
\fi

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