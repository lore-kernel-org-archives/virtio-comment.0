Return-Path: <cohuck@redhat.com>
From: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] PCI: fix level for vendor data capability
Date: Thu,  7 Oct 2021 13:13:06 +0200
Message-Id: <20211007111306.239420-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The normative statements for the vendor data capability need
to be at paragraph level insted of subsection level.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
I plan to push this as an editorial update.
---
 content.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 39fe12b8ae40..5e716721edb3 100644
--- a/content.tex
+++ b/content.tex
@@ -1189,7 +1189,7 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
 To make it safe for a generic driver to access the capability,
 reads from this capability MUST NOT have any side effects.
 
-\devicenormative{\subsection}{Vendor data capability}{Virtio
+\devicenormative{\paragraph}{Vendor data capability}{Virtio
 Transport Options / Virtio Over PCI Bus / PCI Device Layout /
 Vendor data capability}
 
@@ -1206,7 +1206,7 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
 Reads of the Vendor data capability by the driver MUST NOT have any
 side effects.
 
-\drivernormative{\subsection}{Vendor data capability}{Virtio
+\drivernormative{\paragraph}{Vendor data capability}{Virtio
 Transport Options / Virtio Over PCI Bus / PCI Device Layout /
 Vendor data capability}
 
-- 
2.31.1

