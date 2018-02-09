%-----------------------------------------------------------
% LaTeX class for University of Warwick exams
% Copyright 2017 Michael B. Gale (m.gale@warwick.ac.uk)
%-----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uow-exam}[2017/09/19 UoW Exam Class]

\DeclareOption{answers}{
	\PassOptionsToClass{\CurrentOption}{exam}
}

%% Process given options
\ProcessOptions\relax

\LoadClass[a4paper,12pt,addpoints]{exam}
\pointsdroppedatright
\bracketedpoints
\setlength{\rightpointsmargin}{2.5cm}

% Use the times font
\usepackage{times}

\usepackage{etoolbox}
\usepackage{titlesec}

% Variables and commands to change them
\newcommand{\TheModuleCode}{CSXXX0}
\newcommand{\TheModuleName}{Module name}
\newcommand{\TheExamPeriod}{Summer 2018}
\newcommand{\TheExamsName}{Second Year Examinations}
\newcommand{\TheTimeAllowed}{2 hours}
\newcommand{\TheQuestionInstructions}{Answer \textbf{FOUR} questions.}
\newcommand{\TheOtherInstructions}{Read carefully the instructions on the answer book and make sure that the particulars required are entered on \textbf{each} answer book.}

\newcommand{\ModuleCode}[1]{\renewcommand{\TheModuleCode}{#1}}
\newcommand{\ModuleName}[1]{\renewcommand{\TheModuleName}{#1}}
\newcommand{\ExamPeriod}[1]{\renewcommand{\TheExamPeriod}{#1}}
\newcommand{\ExamsName}[1]{\renewcommand{\TheExamsName}{#1}}
\newcommand{\TimeAllowed}[1]{\renewcommand{\TheTimeAllowed}{#1}}
\newcommand{\QuestionInstructions}[1]{\renewcommand{\TheQuestionInstructions}{#1}}
\newcommand{\OtherInstructions}[1]{\renewcommand{\TheOtherInstructions}{#1}}

% Headers and footers
\pagestyle{headandfoot}

\header{\textbf{\TheModuleCode}}{\ifprintanswers \textbf{SOLUTIONS} \else \fi}{\textbf{\TheExamPeriod}}
\footer{}{-~\thepage~-}{ \iflastpage{End}{Continued}}

% No indentation
\setlength{\parindent}{0mm}

\newcommand{\doublehrule}{{\hrule\vspace*{2pt}\hrule}}

% make heading 
\newcommand{\MakeHeading}{
	\textbf{THE UNIVERSITY OF WARWICK} \\
	
	\textbf{\TheExamsName: \TheExamPeriod}\\
	
	\textbf{\TheModuleName}\\
	
	\doublehrule \vspace{\bigskipamount}
	
	\normalfont
	\textbf{Time allowed: \TheTimeAllowed.}\\
	
	\TheQuestionInstructions \\
	
	\TheOtherInstructions \\
	
	\doublehrule % \vspace{\smallskipamount}
	%\smallskip
}

\renewcommand{\thesection}{\Alph{section}}
\titleformat{\section}[hang]{\bigskip
	\doublehrule
	\bigskip\pagebreak\bigskip
	\doublehrule
	%\bigskip
	\smallskip
}{\hspace{-0.8cm} \textbf{Section \thesection} \hspace{1cm}}{0pt}{}[
\smallskip \smallskip
%\bigskip 
\hrule  ]
\titlespacing{\section}{0pt}{0pt}{6pt}

\newtoggle{BreakAfterQuestion}
\toggletrue{BreakAfterQuestion}

\newcommand{\NoBreakAfterQuestions}{\togglefalse{BreakAfterQuestion}}

% add lines between questions
\newtoggle{IsFirstQuestion}

\let\oldquestions\questions
\def\questions{
	\oldquestions 
	
	\toggletrue{IsFirstQuestion}
	
	\renewcommand{\question}{
		\iftoggle{IsFirstQuestion}
		{}
		{\bigskip \hrule  \iftoggle{BreakAfterQuestion}{\bigskip\pagebreak}{}}
		\item
		\togglefalse{IsFirstQuestion}}
}

\let\oldquestionsend\endquestions 
\def\endquestions{
	\oldquestionsend 	
	%\bigskip
	\doublehrule
	\bigskip
}