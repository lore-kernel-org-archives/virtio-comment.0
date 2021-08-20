Return-Path: <jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 2/3] virtio-pci: PASID support
Date: Fri, 20 Aug 2021 15:59:19 +0800
Message-Id: <20210820075920.42355-3-jasowang@redhat.com>
In-Reply-To: <20210820075920.42355-1-jasowang@redhat.com>
References: <20210820075920.42355-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com, lingshan.zhu@intel.com, zhengkuan.yh@alibaba-inc.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch introduce a new virtio-pci capability for assigning PASID
for a specific virtqueue.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 content.tex | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/content.tex b/content.tex
index 50c0523..5266965 100644
--- a/content.tex
+++ b/content.tex
@@ -707,6 +707,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 #define VIRTIO_PCI_CAP_VENDOR_CFG        9
 /* MSI-X configuration */
 #define VIRTIO_CPI_CAP_MSIX_CFG          10
+/* PASID configuration */
+#define VIRTIO_PCI_CAP_PASID             11
 \end{lstlisting}
 
         Any other value is reserved for future use.
@@ -1334,6 +1336,54 @@ \subsubsection{MSI-X configuration capability}\label{sec:Virtio Transport Option
 The driver MUST mask a specific vector before trying to setup the
 MSI-X addresses and MSI-X data.
 
+\subsubsection{PASID configuration}\label{MSI-X configuration capability}{PASID / Virtio Over PCI Bus / PCI Device Layout / PASID configuration}
+
+The VIRTIO_PCI_CAP_RING_PASID capability is for assigning PASID for a
+specific virtqueue.
+
+The capability is immediately followed by an additional field like so:
+
+\begin{lstlisting}
+struct virtio_pci_cfg_cap {
+        struct virtio_pci_cap cap;
+        le16 queue_select;       /* read-write */
+        le32 {
+          queue_pasid : 20;      /* read-write */
+          reserved : 12;         /* read-write */
+        };
+        u8 pasid_enable;         /* read-write */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{queue_select}]
+        Queue Select. The driver selects which virtqueue the following
+        fields refer to.
+\item[\field{queue_pasid}]
+        PASID for the virtqueue.
+\item[\field{reserved}]
+        Reserved for the future use.
+\item[\field{pasid_enable}]
+        The driver use this to enable (write 1) or disable (write 0)
+        PASID for the virtqueue.
+\end{description}
+
+\devicenormative{\paragraph}{PASID configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PASID configuration}
+
+The device MUST present at least one VIRTIO_PCI_CAP_PASID capability
+if it presents the PASID Extended Capability.
+
+The device MUST NOT present VIRTIO_PCI_CAP_PASID capability if PASID
+Extended Capability is not presented.
+
+The device MUST disable PASID for all virtqueues and presenting 0 to
+\field{enable} upon reset.
+
+\drivernormative{\paragraph}{PASID configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PASID configuration}
+
+The driver MUST configure the PASID for each virtqueue if PASID is
+enabled via PASID Extended Capability.
+
 \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Legacy Interfaces: A Note on PCI Device Layout}
 
 Transitional devices MUST present part of configuration
@@ -1590,6 +1640,10 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
   corresponding to this vector into \field{queue_msix_vector}. Read
   \field{queue_msix_vector}: on success, previously written value is
   returned; on failure, NO_VECTOR value is returned.
+
+\item Optionally, if PASID Extended Capability is present and enabled
+  on the device, select a PASID to use for the TLP of a
+  virtqueue. Write the PASID value into \field{pasid}.
 \end{enumerate}
 
 \subparagraph{Legacy Interface: A Note on Virtqueue Configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / Virtqueue Configuration / Legacy Interface: A Note on Virtqueue Configuration}
-- 
2.24.3 (Apple Git-128)

