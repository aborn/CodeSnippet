pandoc
==========

## INTRO
[Pandoc](http://johnmacfarlane.net/pandoc/) is a very useful tool to
convert one format file into another.

## INSTALL
* install pandoc  
> sudo apt-get install pandoc

* install latex  
> sudo apt-get install texlive-full

## USAGE
1. convert markdown format to html   
   > pandoc -0 out.html in.md  
   * C-c C-c e  in emacs save to base.html  
   * C-c C-c p  in emacs for web browser
   
2. convert markdown format to pdf  
   * English-language only.  
     > pandoc --latex-engine=xelatex -o README.pdf README.md  
   * If file contains Chinese-language. Ref
   [Flynn blog](http://jiangfeng.org/notes/2013/04/19/markdown-with-pdf.html).  
     > pandoc --template=pandoc.template --latex-engine=xelatex -o
     > example.pdf exam-chn.md

3. HTML slide shows. I prefer the dzslides and revealjs style.  
   > pandoc -s --mathml -i -t dzslides SLIDES -o dzslides.html  
   > pandoc -s --webtex -i -t slidy SLIDES -o slidy.html  
   > pandoc -s --mathjax -i -t revealjs SLIDES -o revealjs.html  

## NOTE
1. check Chinese-language fonts in linux.  
> fc-list :lang=zh

2. [using markdown to write books](http://www.ituring.com.cn/article/828).

3. [more examples](http://johnmacfarlane.net/pandoc/demos.html).


## VERSION
* 2014-04-23 v0.1  (initial pandoc instructions files.)
