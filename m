Return-Path: <jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 3/3] virtio-pci: introduce the management device capability
Date: Fri, 20 Aug 2021 15:59:20 +0800
Message-Id: <20210820075920.42355-4-jasowang@redhat.com>
In-Reply-To: <20210820075920.42355-1-jasowang@redhat.com>
References: <20210820075920.42355-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com, lingshan.zhu@intel.com, zhengkuan.yh@alibaba-inc.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch introduces the management device capability. The device
that offers this capability is the management device. The management
device driver can use this capability to create managed device who
doesn't have a dedicated transport specific configuration interface.

The idea is simple, introduce a device_select field then we can reuse
almost all the existing capabilities (except for the shared memory
one) to configure the managed device.

A simple managed device provision interface is also proposed.

To be simple, I tie this capability with the PASID capability instead
of introducing device MMU functions.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 content.tex | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/content.tex b/content.tex
index 5266965..d3ebd76 100644
--- a/content.tex
+++ b/content.tex
@@ -709,6 +709,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
 #define VIRTIO_CPI_CAP_MSIX_CFG          10
 /* PASID configuration */
 #define VIRTIO_PCI_CAP_PASID             11
+/* Managed device configuration */
+#define VIRTIO_PCI_CAP_MANAGED_DEV_CFG   12
 \end{lstlisting}
 
         Any other value is reserved for future use.
@@ -1384,6 +1386,79 @@ \subsubsection{PASID configuration}\label{MSI-X configuration capability}{PASID
 The driver MUST configure the PASID for each virtqueue if PASID is
 enabled via PASID Extended Capability.
 
+\subsubsection{Managed device configuration}\label{Managed device configuration}{PASID / Virtio Over PCI Bus / PCI Device Layout / Managed device configuration}
+
+The VIRTIO_PCI_CAP_MANAGED_DEV_CFG capability allows the one device to
+manage other (usually virtual) virtio devices. The device that offers
+VIRTIO_PCI_CAP_MANAGED_DEV_CFG is called management device. The
+device that is managed by the management device is called managed
+device.
+
+The capability is immediately followed by an additional field like so:
+
+\begin{lstlisting}
+struct virtio_pci_managed_dev_cap {
+        struct virtio_pci_cap cap;
+        u32 num_devices;            /* read-only for driver */
+        le32 device_select;         /* read-write */
+        le32 config_select;         /* read-write */
+        u8 config[256];             /* read-write */
+        u8 create;                  /* read-write */
+        u8 create_ok;               /* read-only for driver */
+};
+
+/* create_ok values */
+#define VIRTIO_MGMT_OK          0
+#define VIRTIO_MGMT_ID_DUP      1
+#define VIRTIO_MGMT_INVALID_CFG 2
+\end{lstlisting}
+
+\begin{description}
+\item[\field{num_devices}]
+        The device specifies the maximum number of managed devices
+        here.
+\item[\field{device_select}]
+        Device Select. The driver selects which device the following
+        fields and other virtio-pci capabilities refer to.
+\item[\field{config_select}]
+        The driver uses this to select which 256 bytes chunk of
+        \field{config} shows.
+\item[field{config}]
+        The metadata that is used to create a managed device. The
+        actual format is device specific.
+\item[\field{create}]
+        The driver use this to create (write 1) or destroy (write 0) a
+        specific managed device.
+\item[\field{create_ok}]
+        The device specifies whether the managed device is
+        successfully created or destroyed. 0 means success, others
+        means failure.
+\end{description}
+
+\devicenormative{\paragraph}{Managed device configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Managed device configuration}
+
+The management device MUST reserved device index 0 as itself.
+
+The management device MUST present 0 to \field{device_select} upon
+reset.
+
+The management device MUST fail the write to \field{create} if the
+\field{device_select} is zero.
+
+The management device MUST fail the creation of a managed device if
+the filed\{device_select} is duplicated with the id of an existing
+managed device.
+
+The device MUST NOT present VIRTIO_PCI_CAP_MANAGED_DEV_CFG if
+VIRTIO_PCI_CAP_PASID is not presented.
+
+\drivernormative{\paragraph}{Managed device configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Managed device configuration}
+
+The management driver MUST create a managed device by allocating a
+non-zero device id for \field{device_select} and use that for the
+following steps for this managed device if the creating is succeed
+(read \field{create_ok} as zero).
+
 \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Legacy Interfaces: A Note on PCI Device Layout}
 
 Transitional devices MUST present part of configuration
-- 
2.24.3 (Apple Git-128)

