Return-Path: <cohuck@redhat.com>
From: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] introduction: add more section labels
Date: Tue, 12 Apr 2022 09:45:51 +0200
Message-Id: <20220412074551.84197-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

In order to be able to refer to changes in sections.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 introduction.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/introduction.tex b/introduction.tex
index 6d527171ba7b..4dc708502e0b 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -155,7 +155,7 @@ \subsection{Transition from earlier specification drafts}\label{sec:Transition f
 sections tagged "Legacy Interface" in the section title.
 These highlight the changes made since the earlier drafts.
 
-\section{Structure Specifications}
+\section{Structure Specifications}\label{sec:Structure Specifications}
 
 Many device and driver in-memory structure layouts are documented using
 the C struct syntax. All structures are assumed to be without additional
@@ -216,7 +216,7 @@ \section{Structure Specifications}
 \begin{lstlisting}
 CPU_TO_BE16(B << 15 | A)
 \end{lstlisting}
-\section{Constant Specifications}
+\section{Constant Specifications}\label{sec:Constant Specifications}
 
 In many cases, numeric values used in the interface between the device
 and the driver are documented using the C \#define and /* */
-- 
2.34.1

