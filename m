Return-Path: <jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 1/3] virtio-pci: introduce device specific MSI-X messages store
Date: Fri, 20 Aug 2021 15:59:18 +0800
Message-Id: <20210820075920.42355-2-jasowang@redhat.com>
In-Reply-To: <20210820075920.42355-1-jasowang@redhat.com>
References: <20210820075920.42355-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com, lingshan.zhu@intel.com, zhengkuan.yh@alibaba-inc.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch introduce a new capability that allows the MSI-X messages
to be stored and setup through a dedicated capability. This will be
useful for the cases when:

- the device is required to have more than 2048 MSI-X entries, one
  example is a device have more than 2048 queues
- the managed device without a transport specific way to configure the
  MSI-X entries

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 content.tex | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/content.tex b/content.tex
index 620c0e2..50c0523 100644
--- a/content.tex
+++ b/content.tex
@@ -705,6 +705,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
 /* Vendor-specific data */
 #define VIRTIO_PCI_CAP_VENDOR_CFG        9
+/* MSI-X configuration */
+#define VIRTIO_CPI_CAP_MSIX_CFG          10
 \end{lstlisting}
 
         Any other value is reserved for future use.
@@ -1261,6 +1263,77 @@ \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport O
 specified by some other Virtio Structure PCI Capability
 of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
 
+\subsubsection{MSI-X configuration capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout /  MSI-X configuration capability}
+
+The VIRTIO_PCI_CAP_MSIX_CFG capability allows the MSI-X vectors to be
+stored in a virtio-pci device specific store instead of the PCI-E
+MSI-X table.
+
+The capability is immediately followed by an additional field like so:
+
+\begin{lstlisting}
+struct virtio_pci_msix_cap {
+        struct virtio_pci_cap cap;
+        u8 enable;                  /* read-write */
+        le16 num_vectors;           /* read-only for driver */
+        le16 vector_select;         /* read-write */
+        le32 msix_address_high;     /* read-write */
+        le32 msix_address_low;      /* read-write */
+        le32 msix_data;             /* read-write */
+        u8 mask;                    /* read-write */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{enable}]
+The driver uses this to enable (writing 1) or disable (writing 0) the
+virtio-pci specific MSI-X messages storing. When enabled, the device
+will use the MSI-X messages that is setup through this
+capability instead of the PCI-E MSI-X table. When disabled, the
+device will use the MSI-X messages that is setup through the PCI-E
+MSI-X table.
+
+\item[\field{num_vectors}]
+The device specifies the maximum number of MSI-X entries supported here.
+
+\item[\field{vector_select}]
+Vector Select. The driver selects which virtqueues the following
+fields refer to.
+
+\item[\field{msix_address_high}]
+The driver writes the high address of a specific MSI-X entry here.
+
+\item[\field{msix_address_lo}]
+The driver writes the low address of a specific MSI-X entry here.
+
+\item[\field{msix_data}]
+The driver writes the MSI-X data of a specific MSI-X entry here.
+
+\item[\field{mask}]
+The driver use this to mask (write 1) or unmask (write 0) a specific
+MSI-X entry indexed via \field{vector_select} here.
+\end{description}
+
+\devicenormative{\paragraph}{MSI-X configuration capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / MSI-X configuration capability}
+
+The device MUST disable virtio-pci device specific MSI-X messages
+store and presenting 0 to \field{enable} upon reset.
+
+The device MUST mask all the vectors and present 0 to \field{mask}
+upon reset.
+
+The device MUST record the pending MSI-X vectors and generate the
+MSI-X interrupt upon unmasking.
+
+The device MUST ignore the value that is wrote to
+\field{vector_select} which is equal or greater than
+\field{num_vectors}.
+
+\drivernormative{\paragraph}{MSI-X configuration capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / MSI-X configuration capability}
+
+The driver MUST mask a specific vector before trying to setup the
+MSI-X addresses and MSI-X data.
+
 \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Legacy Interfaces: A Note on PCI Device Layout}
 
 Transitional devices MUST present part of configuration
-- 
2.24.3 (Apple Git-128)

