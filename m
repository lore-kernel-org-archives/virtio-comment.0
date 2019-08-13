Return-Path: virtio-comment-return-837-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66C5C985E49
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Aug 2019 09:17:12 +0000 (UTC)
From: Yoni Bettan <ybettan@redhat.com>
Date: Tue, 13 Aug 2019 12:16:17 +0300
Message-Id: <20190813091618.4433-2-ybettan@redhat.com>
In-Reply-To: <20190813091618.4433-1-ybettan@redhat.com>
References: <20190813091618.4433-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH V3 1/2] Changed fonts to fonts available with tex-live.
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, stefanha@gmail.com, ehabkost@redhat.com, ailan@redhat.com, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Arial -> Liberation Sans
Courier New -> Liberation Mono

There small visual difference but 'Arial' and 'Courier New' are not installed
in TeX Live therefore this change eliminates the errors created while compiling
the project using 'makeall.sh'.

Signed-off-by: Yoni Bettan <ybettan@redhat.com>
---
 commands-pdf.tex | 12 ++++++------
 virtio.tex       |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/commands-pdf.tex b/commands-pdf.tex
index ae7a186..d0612e8 100644
--- a/commands-pdf.tex
+++ b/commands-pdf.tex
@@ -20,7 +20,7 @@
 \newcommand{\oasistitle}[1]
 {
 \begin{spacing}{1.5}
-\fontspec[Color=446CAA]{Arial}
+\fontspec[Color=446CAA]{Liberation Sans}
 \fontsize{24}{24}
 \textbf{\noindent#1}
 \end{spacing}
@@ -29,7 +29,7 @@
 \newcommand{\oasisstagelabel}[1]
 {
 \begin{spacing}{1.1}
-\fontspec[Color=446CAA]{Arial}
+\fontspec[Color=446CAA]{Liberation Sans}
 \fontsize{18}{18}
 \textbf{\noindent#1}
 \end{spacing}
@@ -38,7 +38,7 @@
 \newcommand{\oasisdate}[1]
 {
 \begin{spacing}{1.1}
-\fontspec[Color=446CAA]{Arial}
+\fontspec[Color=446CAA]{Liberation Sans}
 \fontsize{18}{18}
 \textbf{\noindent#1}
 \end{spacing}
@@ -47,7 +47,7 @@
 \newcommand{\oasisnoticelabel}[1]
 {
 \begin{spacing}{1.5}
-\fontspec[Color=446CAA]{Arial}
+\fontspec[Color=446CAA]{Liberation Sans}
 \fontsize{18}{18}
 \textbf{\noindent#1}
 \end{spacing}
@@ -56,7 +56,7 @@
 \newcommand{\oasisspecificationuris}[1]
 {
 {
-\fontspec[Color=446CAA]{Arial}
+\fontspec[Color=446CAA]{Liberation Sans}
 \fontsize{12}{12}
 \textbf{\noindent#1}
 }
@@ -65,7 +65,7 @@
 \newenvironment{oasistitlesection}[1]
 {
 \setlength{\tabcolsep}{0in}\begin{tabular}{p{0in}p{5.8in}}
-\multicolumn{2}{l}{\fontspec[Color=446CAA]{Arial}\fontsize{10}{10}\textbf{#1:}}\\[-0.05in]
+\multicolumn{2}{l}{\fontspec[Color=446CAA]{Liberation Sans}\fontsize{10}{10}\textbf{#1:}}\\[-0.05in]
 &\setlength{\topsep}{0in}\setlength{\parsep}{0in}\setlength{\partopsep}{0in}   }
 {
 \end{tabular}
diff --git a/virtio.tex b/virtio.tex
index ef2d3fe..e7c7b53 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -52,9 +52,9 @@
 %\def_{\_}
 % Don't hyphenate acronyms
 %\uchyph=0
-\setmainfont[Mapping=tex-text]{Arial}
-%\setromanfont{Arial}
-\setmonofont{Courier New}
+\setmainfont[Mapping=tex-text]{Liberation Sans}
+%\setromanfont{Liberation Sans}
+\setmonofont{Liberation Mono}
 
 \urlstyle{rm}
 
-- 
2.21.0


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

