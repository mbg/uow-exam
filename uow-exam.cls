%-----------------------------------------------------------
% LaTeX class for University of Warwick exams
% Copyright 2017 Michael B. Gale (m.gale@warwick.ac.uk)
%-----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uow-exam}[2017/09/19 UoW Exam Class]

\usepackage{etoolbox}

\DeclareOption{answers}{
	\PassOptionsToClass{\CurrentOption}{exam}
}

\newtoggle{AEP}
\DeclareOption{aep}{
	\toggletrue{AEP}
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
\usepackage{enumitem}

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

\header{\textbf{\TheModuleCode}}{\ifprintanswers \textbf{\color{red!50} SOLUTIONS} \else \fi}{\textbf{\TheExamPeriod}}
\footer{}{-~\thepage~-}{ \iflastpage{End}{Continued}}

% No indentation
\setlength{\parindent}{0mm}

\newcommand{\doublehrule}{{\hrule\vspace*{2pt}\hrule}}

% make heading 
\newcommand{\MakeHeading}{
	\iftoggle{AEP}
	{
	\begin{center}
		\ \\[2em]
		\textbf{\large THE UNIVERSITY OF WARWICK} \\[1.2em]
		{\large LEVEL \TheExamsName\ Open Book Assessment [\TheTimeAllowed]} \\[1.2em]
		Department of Computer Science \\[1.2em]
		\TheModuleCode\ \TheModuleName \\[2em]

		\renewcommand{\arraystretch}{1.2}
		\begin{longtable}{|p{\textwidth}|}
			\hline \\[-0.5cm]
			\multicolumn{1}{|c|}{\textbf{\large Instructions}} \\
			\hline 
			\begin{enumerate}[nosep,series=table,before=\vspace{-0.5\baselineskip},after=\vspace{-0.5\baselineskip}]
				\item \TheOtherInstructions
			\end{enumerate} \\
			\hline
			\begin{enumerate}[resume*=table]
				\item \TheQuestionInstructions
			\end{enumerate}\\ 
			\hline
			\begin{enumerate}[resume*=table]
				\item All questions will carry the same number of marks unless otherwise stated.  
				\end{enumerate}\\
			\hline
			\begin{enumerate}[resume*=table]
				\item You should handwrite your answers either with paper and pen or using an electronic device with a stylus (unless you have special arrangements for exams which allow the use of a computer). Start each question on a new page and clearly mark each page with the page number, your student id and the question number. Handwritten notes must be scanned or photographed and all individual solutions should (if you possibly can) be collated into a single PDF with pages in the correct order.  You must upload two files to the AEP: your PDF of solutions and a completed cover sheet. You must click \textbf{FINALISE} to complete the submission process. After you have done so you will not be able to upload anything further.
			\end{enumerate}\\ 
			\hline
			\begin{enumerate}[resume*=table]
				\item Please ensure that all your handwritten answers are written legibly, preferably in dark blue or black ink. If you use a pencil ensure that it is not too faint to be captured by a scan or photograph.
				\end{enumerate}\\
				\hline
				\begin{enumerate}[resume*=table]
				\item Please check the legibility of your final submission before uploading. It is your responsibility to ensure that your work can be read.
				\end{enumerate}\\
				\hline
				\begin{enumerate}[resume*=table]
				\item You are allowed to access module materials, notes, resources, references and the internet during the assessment.  
				\end{enumerate}\\
				\hline
				\begin{enumerate}[resume*=table]
				\item You should not try to communicate with any other candidate during the assessment period or seek assistance from anyone else in completing your answers. The Computer Science Department expects the conduct of all students taking this assessment to conform to the stated requirements. Measures will be in operation to check for possible misconduct. These will include the use of similarity detection tools and the right to require live interviews with selected students following the assessment.
				\end{enumerate}\\
				\hline
				\begin{enumerate}[resume*=table]
				\item By starting this assessment you are declaring yourself fit to undertake it. You are expected to make a reasonable attempt at the assessment by answering the questions in the paper.
				\end{enumerate}\\
				\hline
				{\bf Please note that}:
				\begin{itemize}[leftmargin=*,after=\vspace{-\baselineskip},before=\vspace{-0.5\baselineskip}]
				\item[--] You must have completed and uploaded your assessment before the 24 hour assessment window closes. 
				\item[--] You have an additional 45 minutes beyond the stated duration of this assessment to allow for downloading and uploading the assessment, your files and technical delays.
				\item[--] For further details you should refer to the AEP documentation.
				\end{itemize}\\
				\hline
		\end{longtable}

		\underline{\bf Use the AEP to seek advice immediately if during the assessment period}:\\
		\begin{itemize}[nosep,after=\vspace{-\baselineskip},before=\vspace{0.5\baselineskip}]
		\item you cannot access the online assessment;
		\item you believe you have been given access to the wrong online assessment; 
		\end{itemize}
		\vspace{2em}

		Please note that technical support is only available between 9AM and 5PM (BST).\\[0.5em]

		Invigilator support will be available at the start of the assessment period (via the AEP) for the duration of the assessment (\TheTimeAllowed).\\[1em]

		\textbf{\underline{Notify dcs.exams@warwick.ac.uk as soon as possible if you cannot}\\\underline{complete your assessment because}}:\\
		\begin{itemize}[nosep,after=\vspace{-\baselineskip},before=\vspace{0.5\baselineskip}]
		\item you lose your internet connection;
		\item your device fails;
		\item you become unwell and are unable to continue;
		\item you are affected by circumstances beyond your control (e.g. fire alarm).
		\end{itemize}

		\vspace{2em}
		
		Please note that this is for notification purposes, it is not a help line.\\[0.5em]

		Your assessment starts below.\\
	\end{center}
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