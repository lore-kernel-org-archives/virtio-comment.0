Return-Path: <cohuck@redhat.com>
From: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] conformance: hook up GPU device normative statements
Date: Fri,  8 Apr 2022 11:12:13 +0200
Message-Id: <20220408091213.38247-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

These statements already exist, but were not linked in the conformance section.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

I think this one can go in as an editorial update, at it just seems
to have been missed.

However, I think we need to go over the GPU spec: it seems to have
a lot of MUST etc. language that is not in any normative section.
No driver normative sections also seem to point to some possible
omissions. Probably 1.3 material, though.

---
 conformance.tex | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index 42f853762ebe..9807c307fc54 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -48,6 +48,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / Entropy Device Conformance}, 
 \ref{sec:Conformance / Device Conformance / Traditional Memory Balloon Device Conformance}, 
 \ref{sec:Conformance / Device Conformance / SCSI Host Device Conformance}, 
+\ref{sec:Conformance / Device Conformance / GPU Device Conformance},
 \ref{sec:Conformance / Device Conformance / Input Device Conformance}, 
 \ref{sec:Conformance / Device Conformance / Crypto Device Conformance}, 
 \ref{sec:Conformance / Device Conformance / Socket Device Conformance}, 
@@ -453,6 +454,15 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Device Types / SCSI Host Device / Device Operation / Device Operation: eventq}
 \end{itemize}
 
+\conformance{\subsection}{GPU Device Conformance}\label{sec:Conformance / Device Conformance / GPU Device Conformance}
+
+A GPU device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / GPU Device / Device Initialization}
+\item \ref{devicenormative:Device Types / GPU Device / Device Operation / Device Operation: Command lifecycle and fencing}
+\end{itemize}
+
 \conformance{\subsection}{Input Device Conformance}\label{sec:Conformance / Device Conformance / Input Device Conformance}
 
 An input device MUST conform to the following normative statements:
-- 
2.34.1

