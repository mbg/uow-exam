%------------------------------------------------------------------------------
% LaTeX class for University of Warwick exams
% Copyright 2017-2021 Michael B. Gale (m.gale@warwick.ac.uk)
%------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uow-exam}[2021/02/21 UoW Exam Class]

\usepackage{etoolbox}

\DeclareOption{answers}{
	\PassOptionsToClass{\CurrentOption}{exam}
}

\newtoggle{AEP}
\DeclareOption{aep}{
	\toggletrue{AEP}
}

\newtoggle{UseMinted}
\DeclareOption{code}{
	\toggletrue{UseMinted}
}

\newtoggle{UsePalatino}
\DeclareOption{palatino}{
	\toggletrue{UsePalatino}
}

%% Process given options
\ProcessOptions\relax

\LoadClass[a4paper,12pt,addpoints]{exam}
\pointsdroppedatright
\bracketedpoints
\setlength{\rightpointsmargin}{2.5cm}

% Use the times font
\usepackage{times}

\usepackage{titlesec}
\usepackage{longtable}
\usepackage{tabularx}
\usepackage{soul}

\iftoggle{UseMinted}{
	% load minted; don't load framed though
	\makeatletter
	\@namedef{ver@framed.sty}{9999/12/31}
	\@namedef{opt@framed.sty}{}
	\makeatother
	\usepackage{minted}
	\usepackage[
	backgroundcolor = white
	, hidealllines=true
	]{mdframed}

	\usepackage[]{FiraSans}
}{}

\iftoggle{UsePalatino}{
	% change the font
	\usepackage{mathpazo}
	\linespread{1.05}
	\usepackage[T1]{fontenc}
}{}

% Variables and commands to change them
\newcommand{\TheModuleCode}{CSXXX}
\newcommand{\TheModuleName}{Module name}
\newcommand{\TheExamPeriod}{Summer 2018}
\newcommand{\TheExamsName}{Second Year Examinations}
\newcommand{\TheExamCode}{\TheModuleCode 0}
\newcommand{\TheExamType}{24-hour window}
\newcommand{\TheTimeAllowed}{2 hours}
\newcommand{\TheQuestionInstructions}{Answer \textbf{FOUR} questions.}
\newcommand{\TheOtherInstructions}{Read carefully the instructions on the answer book and make sure that the particulars required are entered on \textbf{each} answer book.}

\newcommand{\ModuleCode}[1]{\renewcommand{\TheModuleCode}{#1}}
\newcommand{\ModuleName}[1]{\renewcommand{\TheModuleName}{#1}}
\newcommand{\ExamPeriod}[1]{\renewcommand{\TheExamPeriod}{#1}}
\newcommand{\ExamsName}[1]{\renewcommand{\TheExamsName}{#1}}
\newcommand{\ExamCode}[1]{\renewcommand{\TheExamCode}{#1}}
\newcommand{\ExamType}[1]{\renewcommand{\TheExamType}{#1}}
\newcommand{\TimeAllowed}[1]{\renewcommand{\TheTimeAllowed}{#1}}
\newcommand{\QuestionInstructions}[1]{\renewcommand{\TheQuestionInstructions}{#1}}
\newcommand{\OtherInstructions}[1]{\renewcommand{\TheOtherInstructions}{#1}}

% Headers and footers
\pagestyle{headandfoot}

\header{\textbf{\TheExamCode}}{\ifprintanswers \textbf{\color{red!50} SOLUTIONS} \else \fi}{\textbf{\TheExamPeriod}}
\footer{}{-~\thepage~-}{ \iflastpage{End}{Continued}}

% No indentation
\setlength{\parindent}{0mm}

\newcommand{\doublehrule}{{\hrule\vspace*{2pt}\hrule}}

% make heading 
\newcommand{\MakeHeading}{
	\iftoggle{AEP}
	{
		\begin{center}
			\ \\[1em] \hrule\ \\[1em]
			\textbf{\large THE UNIVERSITY OF WARWICK} \\[0.5em]
			\textbf{Department of Computer Science} \\[0.2em]
			\TheModuleCode\ \TheModuleName \\[1.5em] \hrule\ \\[0.5em]

			\def\arraystretch{1.5}
			\begin{tabularx}{\textwidth}{XX}
				\emph{Module code:} \TheModuleCode & \emph{Duration:} \TheTimeAllowed \\ 
				\emph{Exam paper code:} \TheExamCode & \emph{Exam paper type:} \TheExamType \\ 
			\end{tabularx} 

			\ \\[0.5em] \hrule
		\end{center}

		\pagebreak

		\textbf{Instructions for students}

		\begin{enumerate}
			\item \ul{Read all instructions carefully.} We recommend you read through the entire paper at least once before writing. 
			\item \TheQuestionInstructions
			\item You should not submit answers to more than the required number of questions.
			\item You should handwrite your answers either with paper and pen or using an electronic device with a stylus (unless you have special arrangements for exams which allow the use of a computer). Start each question on a new page and clearly mark each page with the page number, your student id and the question number. Handwritten notes must be scanned or photographed and all individual solutions collated into a single PDF with pages in the correct order. 
			\item Please ensure that all your handwritten answers are written legibly, preferably in dark blue or black ink. If you use a pencil ensure that it is not too faint to be captured by a scan or photograph.
			\item Please check for legibility before uploading. \ul{It is your responsibility to ensure your work can be read}.
			\item  Add your student number to all uploaded files.
			\item You are permitted to access module materials, notes, resources, references and the Internet during the online assessment.
			\item You must not communicate with any other candidate during the assessment period or seek assistance from anyone else in completing your answers. The Computer Science Department expects the conduct of all students taking this assessment to conform to the stated requirements. Measures will be in operation to check for possible misconduct. These will include the use of similarity detection tools and the right to require live interviews with selected students following the assessment.
			\item By starting this assessment, you are declaring yourself fit to undertake it. You are expected to make a reasonable attempt at the assessment by answering the questions in the paper.
		\end{enumerate}

		\pagebreak

		\textbf{Important information}

		\begin{itemize}
			\item We strongly recommend you use Google Chrome or Mozilla Firefox to access the Alternative Exams Portal.
			\item You are granted an additional 45 minutes beyond the stated duration of this assessment to allow for downloading/uploading your assessment, your files and any technical delays.
			\item Students with approved Alternative Exam Arrangements (Reasonable Adjustments) that permit extra time and/or rest breaks will have this time added on to the stated duration.
			\item You must have completed and uploaded the assessment before the 24-hour assessment window closes.
			\item Late submissions are not accepted.
			\item If you are unable to submit your assessment, you must submit Mitigating Circumstances immediately, attaching supporting evidence and your assessment. The Mitigating Circumstances Panel will consider the case and make a recommendation based on the evidence to the Board of Examiners.
		\end{itemize}

		\pagebreak 

		\textbf{Support during the assessment}

		\begin{itemize}
			\item[] \noindent Operational Support:
				\begin{itemize}
					\item Use the Alternative Exams Portal to seek advice immediately if during the assessment period:
					\begin{itemize}
						\item you cannot access the online assessment 
						\item you believe you have been given access to the wrong online assessment
					\end{itemize} 
				\end{itemize}
			\item[] Technical Support:
				\begin{itemize}
					\item If you experience any technical difficulties with the Alternative Exam Portal please contact \textit{helpdesk@warwick.ac.uk}.
					\item Technical support will be available between 09:00 and 17:00 GMT for each examination (excluding Sunday).
				\end{itemize}
			\item[] Academic Support:
				\begin{itemize}
					\item If you have an academic query, contact the invigilator (using the ``Contact an Invigilator'' tool in AEP) to raise your issue. Please be aware that two-way communication in AEP is not currently possible.
					\item Academic support will normally be provided for the duration of the examination (i.e. for a 2 hour exam starting at 09:00 GMT, academic support will normally be provided between 09:00 and 11:45 GMT). Academic support beyond this time is at the discretion of the department.
				\end{itemize}
			\item[] Other Support:
				\begin{itemize}
					\item If you can not complete your assessment for the following reasons submit Mitigating Circumstances immediately:
					\begin{itemize}
						\item you lose your internet connection
						\item your device fails
						\item you become unwell and are unable to continue
						\item you are affected by circumstances beyond your control
					\end{itemize} 
				\end{itemize}
		\end{itemize}
	}
	{
	\textbf{THE UNIVERSITY OF WARWICK} \\
	
	\textbf{\TheExamsName: \TheExamPeriod}\\
	
	\textbf{\TheModuleName}\\
	
	\doublehrule \vspace{\bigskipamount}
	
	\normalfont
	\textbf{Time allowed: \TheTimeAllowed.}\\
	
	\TheQuestionInstructions \\
	
	\TheOtherInstructions \\
	}
	\doublehrule \pagebreak % \vspace{\smallskipamount}
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

\usepackage{xcolor}