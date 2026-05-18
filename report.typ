#set document(title: "Midpoint Report - Richard Blazek", author: "Richard Blazek")
#set par(justify: true)

= Midpoint Report, MCS Internship

Name: Richard Blazek\
Student Number: 22337668\
Degree: Master in Computer Science\
Company Name: Intel Ireland\
Supervisor: Gareth Young\
5th April 2026

= Declaration

I hereby declare that this project is entirely my own work and that it has not
been submitted as an exercise for a degree at this or any other university.

Richard Blazek\
22337668\
13th April 2026

#pagebreak()

= Internship Goals

To make any meaningful contribution to the Intel NPU compiler, I first need to learn their software
engineering practices and the compiler architecture, so these two goals have the highest priority.
My first tasks will focus on refactoring the code which gives me some time to learn how to find my way
around the codebase. Finally, I can continue to the more technically interesting problems of improving
compiler performance.

== Learn the software engineering practices at Intel
This is my first time having a full-time job at a large company. Software development at large companies is
more structured and requires more steps between writing the code and releasing the product to the customers.
Compared to the environment at smaller companies or universities, there are more processes and rules that have
to be followed. I need to learn the software practices at Intel and get used to following them so that I can
be useful as a member of the team.

- *Specific:* I follow our coding standards and formatting guidelines. I can open pull requests, ask for
  code reviews and maintainers merge my changes into the upstream. I know how to execute tests and write
  my own tests to check that my code functions as intended. I track my progress on tasks using JIRA tickets.
- *Measurable:* I have had at least two pull requests merged into the upstream. I have run CI (continuous
  integration) checks. I have closed a JIRA ticket.
- *Achievable:* All the instructions are described in our documentation. If something is not clear to me,
  I can ask any of my colleagues to help me.
- *Relevant:* I need to learn and follow the practices of the company I work at.
- *Time-bound:* In the first two months of the internship, the company software engineering practices should
  become a habit.

== Understand the Intel NPU compiler architecture

The Intel NPU compiler is a multi-pass compiler built using the MLIR framework. This allows the team to
work with different dialects of the IR (intermediate representation) to represent the model at different
layers, as the compilation goes from a machine learning model to an ELF binary. As a new intern on the
compiler team, I need to understand this compiler architecture in order to know what I am even doing.

- *Specific:* I understand the MLIR framework and the IR dialects we use in different layers of our
  compiler. I am familiar with some of the passes and optimisations in our compiler.
- *Measurable:* I can explain the NPU compilation pipeline from a machine learning model down to
  an ELF binary. I can explain the different MLIR dialects used at different layers of compilation.
- *Achievable:* My team can explain the architecture to me and we also have documentation. Besides that,
  I have experience working with unfamiliar codebases in the past.
- *Relevant:* I need to understand the design of the system I am working with.
- *Time-bound:* I should be able to understand this after the first two months, although I will likely
  keep learning new things about the NPU compiler throughout the entire internship.

== Improve code quality

My first tickets during the internship are focused on refactoring tasks, such as moving optimisation logic
from one pass into another and redesigning our compilation options. That will help me get familiar with the
codebase before moving on to larger tasks.

- *Specific:* I will complete my tasks related to improving code quality, including fixing any bugs
  encountered. I will write tests to check the modified code.
- *Measurable:* I have completed at least two refactoring tickets and had the related pull requests merged
  into the upstream.
- *Achievable:* These refactoring tasks are not technically difficult. If something is not entirely clear,
  I can ask my mentor or other team members.
- *Relevant:* Improving code quality makes maintenance easier and it also helps me get familiar with
  the codebase.
- *Time-bound:* By the time of the midpoint report, these tickets should be done.

== Improve compiler performance

One issue with the Intel NPU compiler is that it takes too long to compile models. The compiler team is
working on ways to make compilation faster, preferably without sacrificing the performance of the compiled
models. I will work on some of the related tasks, the first of which is a ticket on developing an analyser for
detecting which compiler passes are useless and waste compilation time.

- *Specific:* I will complete the analyser for detecting useless compiler passes and add it to our CI to
  have it scheduled automatically. I will also work on other refactoring tickets my mentor assigns to me.
- *Measurable:* I have developed the analysis tool for detecting outdated compiler passes. Furthermore,
  I have merged a performance improvement pull request resulting in a quantifiable percentage reduction
  in the compilation time for the testing models.
- *Achievable:* Earlier tasks give me an understanding of the compiler. After completing them, I should be able
  to go on to these more challenging problems. And I can still rely on existing documentation and help
  from my mentor and team members.
- *Relevant:* Improving performance makes the compiler more useful for Intel's customers and it is
  an interesting technical problem for me.
- *Time-bound:* I will start after completing my refactoring tickets. By the end of the internship, I will
  have achieved measurable improvements in compilation time.

#pagebreak()

= Reflective Diary

== 12 to 16 January 2026

On Monday, all of us interns spent the day attending all sorts of orientation sessions. The instructors
gave us presentations on health, safety, company policies and intellectual property. For the rest of the
week, we were occupied by onboarding tasks such as obtaining the Intel employee badge, meeting my manager
and team colleagues, and setting up my laptop and virtual machine. Before I could start working on the code,
I also had to request several permissions in the information system and wait before receiving them.

By Friday, all my tasks had been finished, and I started working on my first task. It was a simple JIRA ticket
assigned to me by my mentor, which only required deleting one old unused class, submitting a pull request and
getting it successfully merged into the upstream. I opened my first pull request and finished my first week
at Intel.

== 19 to 23 January 2026

I found out that the pull request I opened was not yet ready to be merged and there were more steps required
between writing the code and getting it merged into the upstream. I had to learn how to run CI (continuous
integration) tests to verify that my code can be safely merged and how to use rebasing to keep the Git
history clean. I also had to ask my mentor and another colleague to review and approve my changes. By the
end of the week, my first task was done, and my changes were ready to be automatically merged into the upstream.

Then my mentor explained to me what my second task was going to be about. The second task involved
refactoring the clamp fusing logic in the NPU compiler. Clamp fusing means merging the clamping operation
with the previous operation to improve the performance of the generated code. My job was to move this logic
from a lower level of the compiler to a more abstract layer.

After work on Thursday, we had a dinner with my colleagues from the compiler team, including some from
Romania who were visiting here.

== 26 to 30 January 2026

I started working on the task I was assigned last week. When I ran the tests, I encountered an issue
with old clamp fusing tests that suddenly stopped working. I did not understand the problem, so
I reverted my changes and tried to reimplement the logic again. This time, I was
very careful not to touch the previous code that the old tests were testing, just adding my new code as
a parallel implementation. As a result, I ended up with two parallel implementations of clamp fusing,
the original one and my new one.

To write the tests for my implementation, I looked at the old clamp fusing tests. There I noticed that
some of the test cases do not make any sense, yet the tests always passed. I asked my mentor about that,
and he checked the Git history of the tests. This way we discovered that the tests were correct when created,
but later some of the test cases were changed in a way that looked clearly wrong. Apparently, someone broke
the code and decided to change the failing tests instead of fixing their code. This episode cost me two days,
but it taught me why we ought to do test-driven development instead of writing tests to retrofit the code.

On Friday, I submitted the PRs for my ticket and started the CI checks.

== 2 to 6 February 2026

Over the weekend, the CI checks have finished and some of them failed. I spent the week trying to fix the
issues, which progressed slowly because the full CI takes around 24 hours to run, depending on how many
other checks are there in the queue. Therefore, anytime I tried to fix something, I had to wait an entire
day to see if the error was solved. Also, my mentor was away this week, so I was not always sure what to do.

I managed to resolve some of the errors which were caused by the bugs in my code. However, some of the CI
checks behaved non-deterministically –- even if there was no issue in the code, they failed with some
non-zero probability. I requested additional permissions which allowed me to restart a failed check because
some of them simply succeeded on a second or a third try.

== 9 to 13 February 2026

I managed to get another pull request merged, but the task I was working on required merging two further pull
requests with more changes to be merged. I also received a new task to work on. And manager explained to me
the overall design of the NPU and the compiler and arranged one-on-one meetings for me with the senior
programmers so that each explains to me their part of the compiler and I can understand the whole architecture.

The new task I received was refactoring the mechanism for disabling compiler passes. There were too many
command line options for disabling various compiler passes and different conditionals scattered around the
codebase, each responsible for checking one option. My job was to replace all that with one option with the
list of all disabled passes and one class responsible for only executing passes which checks if a pass
should be disabled before execution.

== 16 to 20 February 2026

I had two individual meetings with senior programmers explaining the compiler structure to me. The first one
was describing the lower layers of the compiler and some optimisation techniques she was implementing.
The second one (my mentor) explained to me the more abstract layers of the compiler and the design choices.

I managed to get a second pull request from my first task merged and I was simultaneously working on my
second task (because I had time waiting for CI checks on the first task). I created the command line option
and the class with a unit test. Then I started the excruciating process of crawling through the codebase in
search of options to remove. Did I mention the options were scattered all around? Another issue was that it
was not even clear which options should be removed and which ones are actually necessary and the program
breaks without them.

== 23 to 27 February

Another senior programmer explained to me his part of the compiler, which was the scheduler. 

I also had a meeting with my mentor and another programmer about my second ticket (compiler pass disabling).
They told me to split the ticket into three smaller pull requests rather than implementing it all at once,
so that they can review each pull request. I found out that there is a difference between an epic and a story
in Scrum. The pass disabling ticket was an epic, but each pull request had to be linked to a story, so
I created three JIRA stories for the three pull requests I had to make.

The first story was implementing a utility class responsible for conditional pass execution, checking if
a pass is disabled and executing it only if it is not. The second one was adding the pass disabling option
and using the utility class to only execute passes not listed in that option. The last story required
removing all the legacy options.

== 2 to 6 March

I completed the first story for the pass disabling epic, created a pull request and had two reviewers
approve and merge it. I also created one more pull request for my previous story ticket (clamp fusing)
because some old code was now obsolete and had to be removed. Hopefully it’s the last PR for this ticket,
so that I can be done with this ticket soon.

== 9 to 13 March

This week, I implemented the second story of the pass disabling epic and got it merged. In order to finally
mark this epic as closed, I need to create one last pull request that removes the old pass disabling options.
I wrote a Python script that crawled through the codebase and found the options that are always enabled by
default, so that I wouldn’t need to look for them manually. It found around fifty of them, but some of them
were false positives because some of these options were not related to pass disabling. So I still had to
check for each option if it should be removed and adjust the code that used the option.

I also figured out that I had to make another change to the code before we could close the clamp fusing story
ticket. Thus, I had to create yet another pull request. It’s a never-ending story. On the other hand, next
week I should finish both tasks and move on to something completely different.

== 16 to 20 March

At last, I merged the last pull request for the clamp fusing ticket, so I could close the ticket in JIRA and
move on. The pass disabling task still required some more changes from code reviewers and also did not pass
the CI checks, so I did not get it merged by Friday. The Tuesday of this week was the St. Patrick’s Day, so
we had a bank holiday on that day.

Back in the office on Wednesday, my mentor explained my next ticket to me, focused on optimising compiler
rather than refactoring. The goal was to write an analysis tool that is able to detect which compiler passes
are outdated and do not actually modify the compiled model anymore.

== 23 to 27 March

When the last pass disabling ticket was being merged, some merge conflicts happened and it caused the merge
to fail. I had to find out which parts caused the errors and fix them.

Meanwhile, I implemented the code for detecting the outdated passes. It would calculate the hash of the
compiled model before and after each pass and compare these to see if there has been any change. Then
the results would be written into a log file. I also added a compiler option that allowed enabling this
analysis and specifying the log file path.

== 30 March to 3 April

To test my outdated pass detection tool, I needed to download the testing models, compile them with my
analysis enabled and then collect the logs. For this, I used a Python helper that the team was already
using for testing. I modified the helper to work for this task and started downloading and compiling all
models that were stored in our cloud. There were around 11,000 models so this process took a long time
and I had to keep it running overnight.

The next day, my mentor asked me about it and I explained that I need to wait for the 11,000 models to
compile. Then he explained to me that we definitely are not going to wait for 11,000 models to compile
and I should ask a colleague responsible for the CI which models are important for testing. I asked him
and he told me that he will prepare the list and send it to me.

== 6 April to 10 April

The colleague who promised to send me the list of models used for testing did not send me anything,
so I reminded him about that and he told me it's in progress. I was starting to think that if I didn't
bother asking him and simply ran the analysis on all models instead, it would have been finished by
now. In the meanwhile, I wrote documentation for the new pass disabling mechanism and merged it into
the repository.

On Thursday, my manager asked me how is my internship going and whether I would consider working at
Intel after graduation. I replied that I think my internship is going well and I would be happy to
work there.

== 13 April to 17 April

My mentor introduced me to another problem the team was working on which was compiling repeating
blocks. Many machine learning models (such as LLaMa) consist of blocks of multiple operations that
are repeated multiple times (e.g. Convolution, Clamp, BatchNorm). Currently, the compiler had to
do all compilation steps for each repetition separately, which could take a long time for large
models. If we compiled such repeating block only once and then call the compiled block repeatedly,
the compilation could get much faster.

First ticket pertaining to this problem was adding the support for repeating blocks in a compiler
pass for serialising ELF files (represented as IR) into binary data. Previously, the pass would
crash if its argument was a repeating block and my goal was to have it generate the correct
output instead.

My mentor had a working version of that pass in another branch, which however also contained
other changes and was not considered "pretty". Nevertheless, I could compile a sample model
(with repeating blocks) in that branch and dump the IR before and after the pass. This way,
I obtained the reference input and output for the pass from which I created a test. Now I only
had to modify the pass to pass (pun not intended) the test.

== 20 April to 24 April

I made the changes required to get the pass working correctly. My mentor also told me to refactor
the tests for the pass because they defined a lot of attributes which were not relevant for testing
the pass. After that, my pull request got merged and ticket closed.

There was also one simple ticket, which required changing the default settings of the repeated
blocks compilation. The change was passing weights as arguments to repeated blocks, rather than
embedding them as constants inside the block. The original behaviour produced incorrect programs
if each repetition of the blocks used different weights because the block had the weights from
the first repetition embedded inside. In this task, I simply toggled the default value of one flag
in the settings and then changed the tests to reflect the new behavior.

Another ticket I started working on was lazy evaluation for one expensive operation that was
slowing down our tests. Every test was evaluating that operation even though most tests didn't need
its result. Lazy evaluation ensured we don't evaluate it unless we need it, making our test suite
run 3x faster.

== 27 April to 1 May

I got both tickets from the last week merged into the upstream.

== 4 April to 8 May

== 11 April to 15 May

== 18 April to 22 May

#pagebreak()

= Technology Management Processes

== Our team

I am the only intern on the Intel NPU compiler team in Leixlip. My manager does not direct the daily work
I am doing, I work with my mentor and occasionally other senior engineers. Our team members mostly work
from our Leixlip office in Ireland, though there is also another team in Timisoara, Romania working on the
compiler. For some pull requests, I need to ask some of the Romanian software engineers for a code review.

== Communication

For sharing information about specific tasks in a structured manner, our team relies on GitHub pull requests
and JIRA tickets which are related to a specific task. Besides that, we also hold regular weekly meetings on
Thursday where we discuss progress on tasks during the past week and plans for the next week.

For instant communication, we rely on Microsoft Teams. Given that most employees come to the office on some
work days, it is also often possible to discuss things in person.

== Quality assurance

Software development at the Intel NPU compiler team is very rigorous. There are multiple steps between
writing the code and releasing the product, in order to verify that everything works as it should.
Every pull request requires an approval from two code reviewers and passing the CI (continuous integration)
checks. After that, a maintainer adds an auto-merge label on the pull request and an automated Jenkins job
merges the changes into the upstream at an appropriate time.

This automated merging is necessary because the CI checks have to be executed again after every change to
the upstream in order to preempt the possibility that two changes from two different pull requests interact
with each other in unpredictable ways.

== Project management methods

The team follows the Agile and Scrum methodologies to manage the software development lifecycle. Large
tasks are categorised as _epics_, which are then broken down into smaller _stories_. JIRA is the primary
tool used to track progress on tasks, stories and epics. This ensures that progress on tasks can be tracked
and each pull request is linked to a specific task.

== Software development tools

We use several software development tools to enable our workflow:
- Git: Git is used for version control, rebasing is preferred over merging to keep the Git log clean
- GitHub: GitHub stores our repository online, each developer has their own fork and submits pull requests to have their work merged into the upstream
- Jenkins: Jenkins runs the CI checks and merges pull requests into the upstream
- Automation: Python scripts and helper tools are used to automate repetitive tasks, such as downloading testing models or text processing
- Copilot: GitHub Copilot assists during development. The codebase of the compiler is too large and complex for Copilot to be reliable
  at code generation but it is useful for debugging and for explaining the code.

== Critical evaluation
=== Strengths
- The strict code review process ensures that code changes are independently verified by multiple engineers before they are accepted.
- The CI pipeline thoroughly tests all pull requests to catch possible errors and performance regressions in the compiler.

=== Weaknesses
- The CI pipeline is very slow, with checks taking around 24 hours to complete, which is a significant bottleneck in the development process.
- Some of the CI checks are flaky and fail even for correct code. They have to be restarted manually to pass on a second or third try, wasting developers' time.
