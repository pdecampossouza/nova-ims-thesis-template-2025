%% =====================================================================
%% novaims-thesis.cls
%% Lean thesis class for NOVA IMS, Master in Geospatial Technologies.
%%
%% Why this file exists
%%   The NOVA IMS template (github.com/pdecampossouza/nova-ims-thesis-template-2025)
%%   is built on the NOVAthesis class, which needs several long compile
%%   passes and does not finish inside the compile time limit of a free
%%   Overleaf account. This class reproduces the same NOVA IMS layout
%%   (official cover and back cover, title page, statement of integrity,
%%   copyright page, heading sizes, margins, line spacing, APA references)
%%   with a small set of standard packages, so one pass takes about a second.
%%
%% Credits
%%   Layout values, front-matter wording and cover artwork come from the
%%   NOVA IMS adaptation by Paulo Vitor de Campos Souza of the NOVAthesis
%%   template by João Lourenço (LPPL 1.3c). See LICENSE and README.md.
%%
%% Options
%%   arial  (default) body text in Arial / Helvetica, as set in the NOVA IMS template
%%   times            body text in Times, 12 pt
%% =====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{novaims-thesis}[2026/11/16 v1.0 NOVA IMS thesis class (Geospatial Technologies)]

\newcommand*{\nims@font}{arial}
\newcommand*{\nims@arial}{arial}
\DeclareOption{arial}{\renewcommand*{\nims@font}{arial}}
\DeclareOption{times}{\renewcommand*{\nims@font}{times}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass[12pt,a4paper,oneside,openany]{memoir}

%% ---------------------------------------------------------------------
%% Fonts (works with pdfLaTeX, XeLaTeX and LuaLaTeX)
%% ---------------------------------------------------------------------
\RequirePackage{iftex}
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \ifx\nims@font\nims@arial
    \RequirePackage{helvet}                       % Helvetica, the PostScript twin of Arial
    \renewcommand{\familydefault}{\sfdefault}
    \RequirePackage[italic]{mathastext}           % math digits and letters in the text font
  \else
    \RequirePackage{newtxtext}                    % Times
    \RequirePackage{newtxmath}
  \fi
\else
  \RequirePackage{fontspec}
  \ifx\nims@font\nims@arial
    \IfFontExistsTF{Arial}
      {\setmainfont{Arial}\setsansfont{Arial}}
      {\setmainfont{TeX Gyre Heros}\setsansfont{TeX Gyre Heros}}
  \else
    \IfFontExistsTF{Times New Roman}
      {\setmainfont{Times New Roman}}
      {\setmainfont{TeX Gyre Termes}}
    \setsansfont{TeX Gyre Heros}
  \fi
  \RequirePackage[italic]{mathastext}
\fi

%% ---------------------------------------------------------------------
%% Packages
%% ---------------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{eso-pic}
\RequirePackage[portuguese,main=english,shorthands=off]{babel}
\RequirePackage{etoolbox}
\RequirePackage[natbibapa]{apacite}              % APA author-year references with BibTeX
\RequirePackage{xurl}
\RequirePackage[colorlinks=true,allcolors=nimslink,bookmarksnumbered=true]{hyperref}

\graphicspath{{Figures/}}
\definecolor{nimslink}{RGB}{0,0,128}
\definecolor{nimsdarkgrey}{RGB}{100,100,100}
\urlstyle{same}

%% ---------------------------------------------------------------------
%% References: APA style (apacite), DOIs printed as links
%% ---------------------------------------------------------------------
\bibliographystyle{apacite}
\addto\captionsenglish{\renewcommand{\bibname}{References}}
\newcommand{\nims@doi}[1]{\begingroup\urlstyle{same}%
  \href{https://doi.org/#1}{\nolinkurl{https://doi.org/#1}}\endgroup}
\newcommand{\nims@bibsize}{\normalsize\raggedright}
\AtBeginDocument{%
  \renewcommand{\doiprefix}{}%
  \let\doi\nims@doi
  \let\bibliographytypesize\nims@bibsize
  \urlstyle{same}%
}
% APA 7: "et al." from the first citation for three or more authors
\NAT@longnamesfalse

% Citation key aliases: \citekeyalias{old-key}{key-in-bib-file}
% lets an old key (for example from the proposal) point to one entry.
\newcommand{\citekeyalias}[2]{\@namedef{nims@alias@#1}{#2}}
% The citation commands are wrapped so that every key is looked up in the
% alias table before it reaches natbib (no patching of package internals).
\newcommand{\nims@mapkeys}[1]{%
  \def\nims@keys{}%
  \@for\nims@k:=#1\do{%
    \edef\nims@t{\nims@k\space}%
    \edef\nims@k{\expandafter\zap@space\nims@t\@empty}%
    \@ifundefined{nims@alias@\nims@k}{}{\edef\nims@k{\csname nims@alias@\nims@k\endcsname}}%
    \edef\nims@keys{\ifx\nims@keys\@empty\else\nims@keys,\fi\nims@k}}}
\newcommand{\nims@wrapcite}[1]{%
  \expandafter\NewCommandCopy\csname nims@orig@#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\RenewDocumentCommand\csname #1\endcsname{s o o m}{%
    \nims@mapkeys{##4}%
    \IfBooleanTF{##1}{\def\nims@star{*}}{\def\nims@star{}}%
    \IfNoValueTF{##2}{\def\nims@opt{}}%
      {\IfNoValueTF{##3}{\def\nims@opt{[{##2}]}}{\def\nims@opt{[{##2}][{##3}]}}}%
    \edef\nims@go{\expandafter\noexpand\csname nims@orig@#1\endcsname
      \nims@star\unexpanded\expandafter{\nims@opt}{\nims@keys}}%
    \nims@go}}
\AtBeginDocument{%
  \@for\nims@c:=cite,citet,citep,citealt,citealp,citeauthor,citeyear,citeyearpar\do{%
    \expandafter\nims@wrapcite\expandafter{\nims@c}}%
}

% memoir already provides booktabs, array and tabularx.
% L = ragged-right column that takes the remaining table width.
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
% P{width} = ragged-right column of fixed width
\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}

%% ---------------------------------------------------------------------
%% Page layout: A4, top/bottom 3 cm, left/right 3.25 cm, line spacing 1.15
%% ---------------------------------------------------------------------
\setlrmarginsandblock{3.25cm}{3.25cm}{*}
\setulmarginsandblock{3cm}{3cm}{*}
\setheadfoot{15pt}{1.2cm}
\setheaderspaces{*}{8mm}{*}
\checkandfixthelayout[fixed]
\renewcommand{\baselinestretch}{1.15}
\raggedbottom
\setlength{\emergencystretch}{2em}

%% ---------------------------------------------------------------------
%% Headings: chapter title 16 pt, section 16 pt, subsection 14 pt, subsubsection 13 pt
%% ---------------------------------------------------------------------
\makechapterstyle{novaims}{%
  \setlength{\beforechapskip}{0pt}%
  \setlength{\midchapskip}{14pt}%
  \setlength{\afterchapskip}{18pt}%
  \renewcommand*{\printchaptername}{}%
  \renewcommand*{\chapternamenum}{}%
  \renewcommand*{\chapnumfont}{\normalfont\fontsize{26}{26}\selectfont}%
  \renewcommand*{\printchapternum}{%
    \hfill\begin{tabular}{@{}|r@{}}%
      \chapnumfont~\thechapter\hspace*{3.6pt}\rule[-12pt]{0pt}{14.8mm}%
    \end{tabular}}%
  \renewcommand*{\printchapternonum}{%
    \hfill\begin{tabular}{@{}r@{}}%
      \chapnumfont\rule[-12pt]{0pt}{14.8mm}%
    \end{tabular}\par\nobreak\vskip\midchapskip}%
  \renewcommand*{\afterchapternum}{\par\nobreak\vskip\midchapskip}%
  \renewcommand*{\printchaptertitle}[1]{%
    \noindent{\normalfont\fontsize{16}{18}\selectfont\bfseries\raggedright ##1\par}}%
}
\chapterstyle{novaims}

\setsecheadstyle{\normalfont\fontsize{16}{18}\selectfont\bfseries\raggedright}
\setsubsecheadstyle{\normalfont\fontsize{14}{16}\selectfont\bfseries\raggedright}
\setsubsubsecheadstyle{\normalfont\fontsize{13}{15}\selectfont\bfseries\raggedright}
\setparaheadstyle{\normalfont\fontsize{13}{15}\selectfont\bfseries}
\setbeforesecskip{-2.2ex plus -0.5ex minus -0.2ex}
\setaftersecskip{1.0ex plus 0.2ex}
\setbeforesubsecskip{-1.8ex plus -0.5ex minus -0.2ex}
\setaftersubsecskip{0.8ex plus 0.2ex}
\setbeforesubsubsecskip{-1.5ex plus -0.4ex minus -0.2ex}
\setaftersubsubsecskip{0.6ex plus 0.2ex}

\maxsecnumdepth{subsubsection}
\setsecnumdepth{subsubsection}
\maxtocdepth{subsection}
\settocdepth{subsection}

%% ---------------------------------------------------------------------
%% Running head and page number
%% ---------------------------------------------------------------------
\makepagestyle{novaims}
\makeheadrule{novaims}{\textwidth}{\normalrulethickness}
\makeoddhead{novaims}{\small\leftmark}{}{}
\makeevenhead{novaims}{\small\leftmark}{}{}
\makeoddfoot{novaims}{}{\thepage}{}
\makeevenfoot{novaims}{}{\thepage}{}
\makepsmarks{novaims}{%
  \nouppercaseheads
  \createmark{chapter}{both}{shownumber}{}{. \ }%
  \createplainmark{toc}{both}{\contentsname}%
  \createplainmark{lof}{both}{\listfigurename}%
  \createplainmark{lot}{both}{\listtablename}%
  \createplainmark{bib}{both}{\bibname}%
}
\pagestyle{plain}

%% ---------------------------------------------------------------------
%% Figures and tables
%% ---------------------------------------------------------------------
\captionnamefont{\small\bfseries}
\captiontitlefont{\small}
\captiondelim{: }
\setlength{\belowcaptionskip}{6pt}

%% ---------------------------------------------------------------------
%% Thesis data (set in thesis-info.tex)
%% ---------------------------------------------------------------------
\newcommand*{\nims@title}{}
\newcommand*{\nims@covertitle}{}
\newcommand*{\nims@author}{}
\newcommand*{\nims@studentid}{}
\newcommand*{\nims@programme}{}
\newcommand*{\nims@month}{}
\newcommand*{\nims@year}{}
\newcommand*{\nims@place}{Lisbon}
\newcommand*{\nims@keywords}{}
\newcommand*{\nims@sdgs}{}
\newcommand*{\nims@covercode}{MGT-EN}
\newcommand*{\nims@partnerlogos}{}
\newcommand*{\nims@degree}{msc}
\newcommand*{\nims@supervisors}{}
\newcommand*{\nims@cosupervisors}{}

\newcommand{\thesistitle}[1]{\renewcommand*{\nims@title}{#1}}
\newcommand{\thesistitlecover}[1]{\renewcommand*{\nims@covertitle}{#1}}
\newcommand{\thesisauthor}[1]{\renewcommand*{\nims@author}{#1}}
\newcommand{\studentid}[1]{\renewcommand*{\nims@studentid}{#1}}
\newcommand{\programme}[1]{\renewcommand*{\nims@programme}{#1}}
\newcommand{\submissiondate}[2]{\renewcommand*{\nims@month}{#1}\renewcommand*{\nims@year}{#2}}
\newcommand{\submissionplace}[1]{\renewcommand*{\nims@place}{#1}}
\newcommand{\thesiskeywords}[1]{\renewcommand*{\nims@keywords}{#1}}
\newcommand{\sdgs}[1]{\renewcommand*{\nims@sdgs}{#1}}
% \covercode{CODE}: folder name in Figures/Covers (for example MDSAA-DS-EN).
%   MGT-EN       official Geospatial Technologies cover (Erasmus Mundus design)
%   MGT-2025-EN  proposed Geospatial Technologies cover in the 2025 NOVA IMS identity
%   any other    official cover of that programme (2025 identity)
\newcommand{\covercode}[1]{\renewcommand*{\nims@covercode}{#1}}
% \partnerlogos{Logos/a,Logos/b}: logo files (without extension) shown in a
% row on 2025-style covers. A missing file shows a labelled empty box.
\newcommand{\partnerlogos}[1]{\renewcommand*{\nims@partnerlogos}{#1}}
% \degreetype{msc} (default) or \degreetype{phd}
\newcommand{\degreetype}[1]{\renewcommand*{\nims@degree}{#1}}
% \supervisor{Name}{Institution}   \cosupervisor{Name}{Institution}
\newcommand{\supervisor}[2]{\g@addto@macro\nims@supervisors{#1, #2\\}}
\newcommand{\cosupervisor}[2]{\g@addto@macro\nims@cosupervisors{#1, #2\\}}

% Text versions for use in the document
\newcommand*{\printthesistitle}{\nims@title}
\newcommand*{\printthesisauthor}{\nims@author}
\newcommand*{\printkeywords}{\nims@keywords}

\AtBeginDocument{%
  \hypersetup{pdftitle={\nims@title},pdfauthor={\nims@author},pdfkeywords={\nims@keywords}}%
}

%% ---------------------------------------------------------------------
%% Covers
%% Front and back artwork are the official NOVA IMS files, one folder per
%% programme in Figures/Covers/<CODE>/ (front.pdf, optional back.pdf).
%% Programmes without their own back.pdf use Figures/Covers/back-2025.pdf.
%% ---------------------------------------------------------------------
\newcommand*{\nims@coverdir}{Covers/\nims@covercode}
\newcommand*{\nims@isclassic}{\ifdefstring{\nims@covercode}{MGT-EN}}
\newcommand*{\nims@isgtnew}{\ifdefstring{\nims@covercode}{MGT-2025-EN}}

% Degree wording (official NOVA IMS strings)
\newcommand*{\nims@doctype}{\ifdefstring{\nims@degree}{phd}{Doctoral thesis}{Dissertation}}
\newcommand*{\nims@degreename}{\ifdefstring{\nims@degree}{phd}{Doctor}{Master's}}

% One partner logo, or a labelled box if the file is missing.
% Logos are centred on a common axis; \partnerlogoscale can shrink or enlarge one
% logo for an even visual weight, for example \partnerlogoscale{Logos/uji}{0.8}.
\newlength{\nims@logoh}\setlength{\nims@logoh}{1.1cm}
\newlength{\nims@thislogoh}
\newcommand{\partnerlogoscale}[2]{\@namedef{nims@lscale@#1}{#2}}
\newcommand{\nims@placelogo}[1]{%
  \raisebox{\dimexpr(\nims@logoh-\nims@thislogoh)/2\relax}{\includegraphics[height=\nims@thislogoh]{#1}}}
\newcommand{\nims@onelogo}[1]{%
  \setlength{\nims@thislogoh}{\nims@logoh}%
  \@ifundefined{nims@lscale@#1}{}{\setlength{\nims@thislogoh}{\csname nims@lscale@#1\endcsname\nims@logoh}}%
  \IfFileExists{Figures/#1.pdf}{\nims@placelogo{#1}}{%
  \IfFileExists{Figures/#1.png}{\nims@placelogo{#1}}{%
  \IfFileExists{Figures/#1.jpg}{\nims@placelogo{#1}}{%
    \ClassWarning{novaims-thesis}{Partner logo Figures/#1 (.pdf/.png/.jpg) not found}%
    {\setlength{\fboxsep}{0pt}\color{gray}\fbox{\parbox[c][\nims@logoh][c]{3.6cm}{\centering
      \fontsize{7}{8.5}\selectfont missing logo\\\texttt{Figures/\detokenize{#1}}}}}}}}}
% Row of partner logos, bottom-aligned, scaled down if wider than the text area
\newsavebox{\nims@logobox}
\newcommand{\nims@logorow}{%
  \sbox{\nims@logobox}{%
    \def\nims@sep{}%
    \@for\nims@lg:=\nims@partnerlogos\do{%
      \nims@sep\expandafter\nims@onelogo\expandafter{\nims@lg}\def\nims@sep{\hspace{0.9cm}}}}%
  \ifdim\wd\nims@logobox>17.8cm\resizebox{17.8cm}{!}{\usebox{\nims@logobox}}\else\usebox{\nims@logobox}\fi}

\newcommand{\makecover}{%
  \IfFileExists{Figures/\nims@coverdir/front.pdf}{}{%
    \ClassError{novaims-thesis}{Cover code "\nims@covercode" not found}%
      {Use a folder name from Figures/Covers, for example MGT-EN or MDSAA-DS-EN.}}%
  \nims@isclassic{\nims@makecoverclassic}{\nims@makecovernew}}

%% Classic Geospatial Technologies cover (Erasmus Mundus design, title typeset in the blank area)
\newcommand{\nims@makecoverclassic}{%
  \begingroup
  \thispagestyle{empty}%
  \AddToShipoutPictureBG*{%
    \AtPageLowerLeft{\includegraphics[width=\paperwidth,height=\paperheight]{\nims@coverdir/front}}%
    \AtPageUpperLeft{%
      \linespread{1}\sffamily
      \put(\LenToUnit{1.5cm},\LenToUnit{-16.1cm}){%
        \parbox[c]{15cm}{\raggedright\color{nimsdarkgrey}%
          \fontsize{16.5}{21}\selectfont\bfseries\MakeUppercase{\nims@covertitle}}}%
      \put(0,\LenToUnit{-20.2cm}){\makebox[\paperwidth][c]{\fontsize{15}{17.5}\selectfont by}}%
      \put(0,\LenToUnit{-22.3cm}){\makebox[\paperwidth][c]{\fontsize{12}{12}\selectfont\nims@author}}%
    }%
  }%
  \null\clearpage
  \endgroup
}

%% 2025 NOVA IMS identity: programme on the coloured band (baked into the
%% official artwork; typeset here only for MGT-2025-EN), title and author
%% on the white area, optional partner logos above the school name.
\newcommand{\nims@makecovernew}{%
  \begingroup
  \thispagestyle{empty}%
  \AddToShipoutPictureBG*{%
    \AtPageLowerLeft{\includegraphics[width=\paperwidth,height=\paperheight]{\nims@coverdir/front}}%
    \AtPageUpperLeft{%
      \linespread{1}\sffamily
      \nims@isgtnew{%
        % Positions and sizes follow the programme text of the official 2025 covers
        \put(\LenToUnit{1.56cm},\LenToUnit{-8.81cm}){\fontsize{19.6}{23}\selectfont Master's Degree in}%
        \put(\LenToUnit{1.57cm},\LenToUnit{-9.71cm}){\parbox[t]{11cm}{\raggedright\fontsize{22.4}{22}\selectfont\bfseries\nims@programme}}%
        \put(\LenToUnit{1.6cm},\LenToUnit{-23.6cm}){%
          \parbox[t]{12cm}{\raggedright\fontsize{9.5}{12.5}\selectfont
            Dissertation submitted in partial fulfilment of the requirements for the
            degree of \textit{Master of Science in \nims@programme}}}%
      }{}%
      % Title and author (white area)
      \put(\LenToUnit{1.6cm},\LenToUnit{-17.6cm}){%
        \parbox[c]{13.5cm}{\raggedright\fontsize{16.5}{21}\selectfont\bfseries\MakeUppercase{\nims@covertitle}}}%
      \put(\LenToUnit{1.6cm},\LenToUnit{-20.6cm}){\fontsize{12}{14}\selectfont by}%
      \put(\LenToUnit{1.6cm},\LenToUnit{-21.4cm}){\fontsize{14}{16}\selectfont\bfseries\nims@author}%
      % Partner logos
      \ifx\nims@partnerlogos\@empty\else
        \put(\LenToUnit{1.6cm},\LenToUnit{-26.2cm}){\nims@logorow}%
      \fi
    }%
  }%
  \null\clearpage
  \endgroup
}

%% ---------------------------------------------------------------------
%% Title page
%% ---------------------------------------------------------------------
\newcommand{\maketitlepage}{%
  \begingroup
  \thispagestyle{empty}%
  \AddToShipoutPictureBG*{%
    \AtPageUpperLeft{%
      \linespread{1}\sffamily
      % School and university
      \put(0,\LenToUnit{-2.6cm}){\makebox[\paperwidth][c]{\parbox[t]{16cm}{\centering\color{nimsdarkgrey}%
        \fontsize{10.3}{15.5}\selectfont
        \textbf{NOVA Information Management School}\\
        \textbf{Instituto Superior de Estatística e Gestão de Informação}\\
        \fontsize{8.7}{15}\selectfont Universidade NOVA de Lisboa}}}%
      % Title
      \put(0,\LenToUnit{-10.3cm}){\makebox[\paperwidth][c]{\parbox[c]{16cm}{\centering\color{nimsdarkgrey}%
        \fontsize{16.5}{21}\selectfont\bfseries\MakeUppercase{\nims@covertitle}}}}%
      % Author
      \put(0,\LenToUnit{-13.0cm}){\makebox[\paperwidth][c]{\fontsize{15}{17.5}\selectfont by}}%
      \put(0,\LenToUnit{-14.2cm}){\makebox[\paperwidth][c]{\fontsize{12}{12}\selectfont\nims@author}}%
      \put(0,\LenToUnit{-14.9cm}){\makebox[\paperwidth][c]{\fontsize{11}{11}\selectfont Student number \nims@studentid}}%
      % Degree statement
      \put(\LenToUnit{2.5cm},\LenToUnit{-17.0cm}){\parbox[t]{16cm}{\raggedright\fontsize{11.5}{16}\selectfont
        \nims@doctype\ presented as partial requirement for obtaining the \nims@degreename\ degree in \nims@programme}}%
      % Supervisors
      \put(\LenToUnit{2.5cm},\LenToUnit{-19.2cm}){\parbox[t]{16cm}{\raggedright\fontsize{12}{17}\selectfont
        {\centering\textbf{Supervised by:}\par}\vspace{1ex}%
        \nims@supervisors
        \ifx\nims@cosupervisors\@empty\else
          \vspace{2ex}{\centering\textbf{Co-supervised by:}\par}\vspace{1ex}%
          \nims@cosupervisors
        \fi}}%
      % Date
      \put(0,\LenToUnit{-26.5cm}){\makebox[\paperwidth][c]{\fontsize{11}{11}\selectfont\nims@month\ \nims@year}}%
    }%
  }%
  \null\clearpage
  \endgroup
}

%% ---------------------------------------------------------------------
%% Statement of integrity (official NOVA IMS wording, unchanged)
%% ---------------------------------------------------------------------
\newcommand{\makestatement}{%
  \begingroup
  \thispagestyle{empty}%
  \setlength{\parskip}{1ex plus 1pt minus 1pt}\setlength{\parindent}{0pt}%
  \begin{center}\textbf{STATEMENT OF INTEGRITY}\end{center}

  I, \nims@author, hereby declare having conducted this academic work with integrity.
  I confirm that I have not used plagiarism or any form of undue use of information or
  falsification of results along the process leading to its elaboration.
  I further declare that I have fully acknowledge the Rules of Conduct and Code of Honor
  from the NOVA Information Management School.

  \bigskip
  \nims@place, \nims@month\ \nims@year
  \clearpage
  \endgroup
}

%% ---------------------------------------------------------------------
%% Copyright page (NOVA wording, unchanged)
%% ---------------------------------------------------------------------
\newcommand{\makecopyrightpage}{%
  \begingroup
  \thispagestyle{plain}%
  \setlength{\parindent}{0pt}%
  \null\vfill
  {\large\bfseries\raggedright\nims@title\par}
  \bigskip
  Copyright \textcopyright\ \nims@author, NOVA Information Management School, NOVA University Lisbon.\par
  \smallskip
  The NOVA Information Management School and the NOVA University Lisbon have the right,
  perpetual and without geographical boundaries, to file and publish this dissertation
  through printed copies reproduced on paper or on digital form, or by any other means
  known or that may be invented, and to disseminate through scientific repositories and
  admit its copying and distribution for non-commercial, educational or research purposes,
  as long as credit is given to the author and editor.\par
  \clearpage
  \endgroup
}

%% ---------------------------------------------------------------------
%% Back cover: <CODE>/back.pdf if the programme has one, else the official
%% 2025 NOVA IMS back cover (Figures/Covers/back-2025.pdf)
%% ---------------------------------------------------------------------
\newcommand{\makebackcover}{%
  \clearpage
  \begingroup
  \thispagestyle{empty}%
  \IfFileExists{Figures/\nims@coverdir/back.pdf}
    {\def\nims@back{\nims@coverdir/back}}{\def\nims@back{Covers/back-2025}}%
  \AddToShipoutPictureBG*{%
    \AtPageLowerLeft{\includegraphics[width=\paperwidth,height=\paperheight]{\nims@back}}}%
  \null\clearpage
  \endgroup
}

%% ---------------------------------------------------------------------
%% Front-matter helpers
%% ---------------------------------------------------------------------
% Unnumbered front-matter chapter with a PDF bookmark (not listed in the contents)
\newcommand{\frontchapter}[1]{%
  \chapter*{#1}%
  \markboth{#1}{#1}%
  \pdfbookmark[0]{#1}{front:\thepage}%
}
% Unnumbered chapter that is listed in the contents (used for the AI declaration)
\newcommand{\unnumberedchapter}[1]{%
  \chapter*{#1}%
  \markboth{#1}{#1}%
  \phantomsection\addcontentsline{toc}{chapter}{#1}%
}
% \keywordsline{Keywords}{first; second; third}
\newcommand{\keywordsline}[2]{\par\bigskip\noindent\textbf{#1:} #2\par}

% Row of Sustainable Development Goal icons, set with \sdgs{..} in thesis-info.tex
\newcommand{\sdgrow}{%
  \ifx\nims@sdgs\@empty\else
    \par\vfill
    \noindent\textbf{Sustainable Development Goals (SDG):}\par\medskip
    \noindent
    \@for\nims@sdg:=\nims@sdgs\do{%
      \includegraphics[width=1.5cm]{SDG/sdg-en-\nims@sdg}\hspace{2pt}}%
    \par
  \fi
}

% Simple two-column list for acronyms
\newenvironment{acronymlist}
  {\par\noindent\begin{tabular}{@{}p{2.6cm}p{\dimexpr\textwidth-2.6cm-2\tabcolsep\relax}@{}}}
  {\end{tabular}\par}
\newcommand{\acronym}[2]{\textbf{#1} & #2 \\[2pt]}

\endinput
