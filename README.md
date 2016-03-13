# HSBC PDF statement parser

Investigation into whether I can parse HSBC's PDF statements to produce machine readable data.

I don't know whether I'll continue this but wanted to write up where I'm at right now.

## Parsing PDF statements

I tried using the pdf-reader Gem and the `pdf2ps` and `ps2ascii` command line tools to extract the text from the PDF statements. I didn't investigate thoroughly but the extraction doesn't seem to work very well.

I used Adobe Acrobat Reader DC on my Mac to save a PDF statement as text. The results of this appear much more promising, and are what I'm basing the initial code on.

## HSBC transaction data

### Recent transactions

HSBC UK provide recent transaction data in QIF, OFX and CSV formats. This data appears to be available from the earliest date of the most recent statement. For example, if the most recent statement contains transactions from 6 Jan to 5 Feb then the earliest transactions available to download will be from 6 Jan.

#### Midata

I can download my transactions for my personal account (but not my joint account) for the past 12 months in the Midata format. This has lots of information removed so isn't particularly useful.

### Previous statements

Older transaction data is available in the previous statements, but this data isn't machine readable.

Statements produced from 13 July 2014 are available in PDF format. This contains all information about a transaction.

Statements produced before 13 July 2014 are only available to print through the browser. These statements don't include all the information about a transaction (using OFX terminology, they appear to contain the name but not the memo).
