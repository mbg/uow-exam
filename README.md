# LaTeX template for University of Warwick exams

This is a LaTeX document class for University of Warwick exam papers based on the [`exam` document class](https://ctan.org/pkg/exam?lang=en). This document class supports everything that the `exam` document class supports plus:

* Automatic generation of the standard Warwick exam cover page (configurable)
* Automatic dividers between questions and sections
* Automatic headers and footers
* Enabling/disabling solutions with an option

For comprehensive examples of how to use this document class, see `sample-standard.tex` or `sample-sections.tex`.

## Usage

The `uow-exam.cls` file contains the document class. Place this file in the same folder as your main `.tex` file or install it into the standard location for document classes on your machine. You can then use `uow-exam` as the document class at the top of your `.tex` file:

```tex
\documentclass[]{uow-exam}
```

The document class supports the following options:

* `answers` - render answers typeset in `solution` environments, see the documentation for the `exam` document class or the example below.
* `palatino` - uses Palatino as the main font, instead of Computer Modern
* `code` - loads the `minted` package with some sensible defaults for exam papers.
* `aep` - for an AEP style exam cover page, see `sample-aep.tex`

The exam cover page can be configured by setting the following options in the preamble to the desired values:
```tex
\ModuleCode{CSXXX0}
\ModuleName{Module name}
\ExamPeriod{Summer 2018}
\ExamsName{Second Year Examinations}
\TimeAllowed{2 hours}
\QuestionInstructions{Answer \textbf{FOUR} questions.}
\OtherInstructions{Read carefully the instructions on the answer book and make sure that the particulars required are entered on \textbf{each} answer book. \\

No calculators are allowed.}
```
If you would like each question to start immediately after the previous, you can use the `\NoBreakAfterQuestions` command in the preamble. Otherwise, if this command is not specified, questions will start on a new page.

An example of a document body is below. This largely uses environments from the `exam` document class. The `\MakeHeading` command generates the exam cover page.
```tex
\begin{document}
	\MakeHeading
	
	\begin{questions}
		\question This question is about ...
		\begin{parts}
			\part[1] This is a part of a question. \droppoints
			\begin{solution}
				This is only generated if the \texttt{answers} option is specified.
			\end{solution}
		\end{parts}
		\question This question is about ...
		\begin{parts}
			\part[2] Another part. \droppoints
		\end{parts}
	\end{questions}
\end{document}
```
The document class has been tested with `pdflatex -shell-escape`.