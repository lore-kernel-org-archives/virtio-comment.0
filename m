Return-Path: <pasic@linux.ibm.com>
From: Halil Pasic <pasic@linux.ibm.com>
Subject: [PATCH 1/1] split-ring: clarify the field len in the used ring
Date: Fri, 26 Nov 2021 18:12:33 +0100
Message-Id: <20211126171233.16083-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The current descriptor is misleading: "the descriptor chain which was
used" generally includes both the descriptors that map the device read
only, and descriptors that  map the device write only portions of the
buffer described by the descriptor chain. The argument that "used" means
"written to" does not stand because one has to "use" the descriptor
chain even when the whole buffer is device read only.

One can argue, that the most straightforward way to interpret the phrase
"total length of that descriptor chain" (without context) like the
length of the  list is usually defined: i.e. like the number of
descriptors that constitute the chain. This is clearly not what we want
here. Another intuitive way to interpret "total length of that
descriptor chain" is size of the buffer mapped by the descriptor chain.
This is not what we want either. In fact such wrongful interpretations
have caused bugs in the wild.

On the other hand, the text below the listing that gets modified here
clearly describes the semantics of \field{len}. So let us replace
the ambiguous explanation in the listing, with a hopefully non-ambiguous
one.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
---
 split-ring.tex | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/split-ring.tex b/split-ring.tex
index bfef62d..68dca07 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -402,7 +402,10 @@ \subsection{The Virtqueue Used Ring}\label{sec:Basic Facilities of a Virtio Devi
 struct virtq_used_elem {
         /* Index of start of used descriptor chain. */
         le32 id;
-        /* Total length of the descriptor chain which was used (written to) */
+        /*
+	 * The number of bytes written into the device writable portion of
+	 * the buffer described by the descriptor chain.
+	 */
         le32 len;
 };
 \end{lstlisting}

base-commit: ca3252712d98aa7baed2bd33ba124a6ecf8193cd
-- 
2.32.0

