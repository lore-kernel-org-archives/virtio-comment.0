Return-Path: <virtio-comment-return-3029-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 212B598639F
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 May 2022 10:33:12 +0000 (UTC)
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Mon, 16 May 2022 13:32:56 +0300
Message-Id: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] Introduction of Virtio Network device notifications coalescing feature
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: virtio-comment@lists.oasis-open.org
Cc: rabeeh@solid-run.com, Alvaro Karsz <alvaro.karsz@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Control a network device notifications coalescing parameters using the cont=
rol virtqueue.
A new control class was added: VIRTIO_NET_CTRL_NOTF_COAL.

This class provides 2 commands:
- VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET:
  Ask the network device to change the rx-usecs and tx-usecs parameters.
  rx-usecs - Time to delay an RX notification after packet arrival in micro=
seconds.
  tx-usecs - Time to delay a TX notification after a sending a packet in mi=
croseconds.

- VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET:
  Ask the network device to change the rx-max-frames and tx-max-frames para=
meters.
  rx-max-frames - Number of packets to delay an RX notification after packe=
t arrival.
  tx-max-frames - Number of packets to delay a TX notification after sendin=
g a packet.

--
v2:
=09- Usage of notification terminology.
=09- Add a few lines on what device should do when driver asked to
=09  suppress notifications.

Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
---
 content.tex | 148 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 95 insertions(+), 53 deletions(-)

diff --git a/content.tex b/content.tex
index 7508dd1..161acc0 100644
--- a/content.tex
+++ b/content.tex
@@ -167,11 +167,11 @@ \section{Notifications}\label{sec:Basic Facilities of=
 a Virtio Device
 to driver) plays an important role in this specification. The
 modus operandi of the notifications is transport specific.
=20
-There are three types of notifications:=20
+There are three types of notifications:
 \begin{itemize}
 \item configuration change notification
 \item available buffer notification
-\item used buffer notification.=20
+\item used buffer notification.
 \end{itemize}
=20
 Configuration change notifications and used buffer notifications are sent
@@ -586,7 +586,7 @@ \section{Virtio Over PCI Bus}\label{sec:Virtio Transpor=
t Options / Virtio Over P
 A Virtio device can be implemented as any kind of PCI device:
 a Conventional PCI device or a PCI Express
 device.  To assure designs meet the latest level
-requirements, see=20
+requirements, see
 the PCI-SIG home page at \url{http://www.pcisig.com} for any
 approved changes.
=20
@@ -595,7 +595,7 @@ \section{Virtio Over PCI Bus}\label{sec:Virtio Transpor=
t Options / Virtio Over P
 guest an interface that meets the specification requirements of
 the appropriate PCI specification: \hyperref[intro:PCI]{[PCI]}
 and \hyperref[intro:PCIe]{[PCIe]}
-respectively.=20
+respectively.
=20
 \subsection{PCI Device Discovery}\label{sec:Virtio Transport Options / Vir=
tio Over PCI Bus / PCI Device Discovery}
=20
@@ -1167,7 +1167,7 @@ \subsubsection{ISR status capability}\label{sec:Virti=
o Transport Options / Virti
=20
 \devicenormative{\paragraph}{ISR status capability}{Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
=20
-The device MUST present at least one VIRTIO_PCI_CAP_ISR_CFG capability. =
=20
+The device MUST present at least one VIRTIO_PCI_CAP_ISR_CFG capability.
=20
 The device MUST set the Device Configuration Interrupt bit
 in \field{ISR status} before sending a device configuration
@@ -1526,7 +1526,7 @@ \subsubsection{Device Initialization}\label{sec:Virti=
o Transport Options / Virti
 \end{lstlisting}
=20
 Note that mapping an event to vector might require device to
-allocate internal device resources, and thus could fail.=20
+allocate internal device resources, and thus could fail.
=20
 \devicenormative{\subparagraph}{MSI-X Vector Configuration}{Virtio Transpo=
rt Options / Virtio Over PCI Bus / PCI-specific Initialization And Device O=
peration / Device Initialization / MSI-X Vector Configuration}
=20
@@ -1554,7 +1554,7 @@ \subsubsection{Device Initialization}\label{sec:Virti=
o Transport Options / Virti
 unless it is impossible for the device to satisfy the mapping
 request.  Devices MUST report mapping
 failures by returning the NO_VECTOR value when the relevant
-\field{config_msix_vector}/\field{queue_msix_vector} field is read.=20
+\field{config_msix_vector}/\field{queue_msix_vector} field is read.
=20
 \drivernormative{\subparagraph}{MSI-X Vector Configuration}{Virtio Transpo=
rt Options / Virtio Over PCI Bus / PCI-specific Initialization And Device O=
peration / Device Initialization / MSI-X Vector Configuration}
=20
@@ -1776,21 +1776,21 @@ \subsection{MMIO Device Register Layout}\label{sec:=
Virtio Transport Options / Vi
   \caption {MMIO Device Register Layout}
   \label{tab:Virtio Trasport Options / Virtio Over MMIO / MMIO Device Regi=
ster Layout} \\
   \hline
-  \mmioreg{Name}{Function}{Offset from base}{Direction}{Description}=20
-  \hline=20
-  \hline=20
+  \mmioreg{Name}{Function}{Offset from base}{Direction}{Description}
+  \hline
+  \hline
   \endfirsthead
   \hline
-  \mmioreg{Name}{Function}{Offset from the base}{Direction}{Description}=
=20
-  \hline=20
-  \hline=20
+  \mmioreg{Name}{Function}{Offset from the base}{Direction}{Description}
+  \hline
+  \hline
   \endhead
   \endfoot
   \endlastfoot
   \mmioreg{MagicValue}{Magic value}{0x000}{R}{%
     0x74726976
     (a Little Endian equivalent of the ``virt'' string).
-  }=20
+  }
   \hline
   \mmioreg{Version}{Device version number}{0x004}{R}{%
     0x2.
@@ -1798,7 +1798,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Vi=
rtio Transport Options / Vi
       Legacy devices (see \ref{sec:Virtio Transport Options / Virtio Over =
MMIO / Legacy interface}~\nameref{sec:Virtio Transport Options / Virtio Ove=
r MMIO / Legacy interface}) used 0x1.
     \end{note}
   }
-  \hline=20
+  \hline
   \mmioreg{DeviceID}{Virtio Subsystem Device ID}{0x008}{R}{%
     See \ref{sec:Device Types}~\nameref{sec:Device Types} for possible val=
ues.
     Value zero (0x0) is used to
@@ -1806,9 +1806,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Vi=
rtio Transport Options / Vi
     well known addresses, assigning functions to them depending
     on user's needs.
   }
-  \hline=20
+  \hline
   \mmioreg{VendorID}{Virtio Subsystem Vendor ID}{0x00c}{R}{}
-  \hline=20
+  \hline
   \mmioreg{DeviceFeatures}{Flags representing features the device supports=
}{0x010}{R}{%
     Reading from this register returns 32 consecutive flag bits,
     the least significant bit depending on the last value written to
@@ -1818,12 +1818,12 @@ \subsection{MMIO Device Register Layout}\label{sec:=
Virtio Transport Options / Vi
     features bits 32 to 63 if \field{DeviceFeaturesSel} is set to 1.
     Also see \ref{sec:Basic Facilities of a Virtio Device / Feature Bits}~=
\nameref{sec:Basic Facilities of a Virtio Device / Feature Bits}.
   }
-  \hline=20
+  \hline
   \mmioreg{DeviceFeaturesSel}{Device (host) features word selection.}{0x01=
4}{W}{%
     Writing to this register selects a set of 32 device feature bits
     accessible by reading from \field{DeviceFeatures}.
   }
-  \hline=20
+  \hline
   \mmioreg{DriverFeatures}{Flags representing device features understood a=
nd activated by the driver}{0x020}{W}{%
     Writing to this register sets 32 consecutive flag bits, the least sign=
ificant
     bit depending on the last value written to \field{DriverFeaturesSel}.
@@ -1832,41 +1832,41 @@ \subsection{MMIO Device Register Layout}\label{sec:=
Virtio Transport Options / Vi
     \field{DriverFeaturesSel} is set to 0 and features bits 32 to 63 if
     \field{DriverFeaturesSel} is set to 1. Also see \ref{sec:Basic Facilit=
ies of a Virtio Device / Feature Bits}~\nameref{sec:Basic Facilities of a V=
irtio Device / Feature Bits}.
   }
-  \hline=20
+  \hline
   \mmioreg{DriverFeaturesSel}{Activated (guest) features word selection}{0=
x024}{W}{%
     Writing to this register selects a set of 32 activated feature
     bits accessible by writing to \field{DriverFeatures}.
   }
-  \hline=20
+  \hline
   \mmioreg{QueueSel}{Virtual queue index}{0x030}{W}{%
     Writing to this register selects the virtual queue that the
     following operations on \field{QueueNumMax}, \field{QueueNum}, \field{=
QueueReady},
     \field{QueueDescLow}, \field{QueueDescHigh}, \field{QueueDriverlLow}, =
\field{QueueDriverHigh},
     \field{QueueDeviceLow}, \field{QueueDeviceHigh} and \field{QueueReset}=
 apply to. The index
-    number of the first queue is zero (0x0).=20
+    number of the first queue is zero (0x0).
   }
-  \hline=20
+  \hline
   \mmioreg{QueueNumMax}{Maximum virtual queue size}{0x034}{R}{%
     Reading from the register returns the maximum size (number of
     elements) of the queue the device is ready to process or
     zero (0x0) if the queue is not available. This applies to the
     queue selected by writing to \field{QueueSel}.
   }
-  \hline=20
+  \hline
   \mmioreg{QueueNum}{Virtual queue size}{0x038}{W}{%
     Queue size is the number of elements in the queue.
     Writing to this register notifies the device what size of the
     queue the driver will use. This applies to the queue selected by
     writing to \field{QueueSel}.
   }
-  \hline=20
+  \hline
   \mmioreg{QueueReady}{Virtual queue ready bit}{0x044}{RW}{%
     Writing one (0x1) to this register notifies the device that it can
     execute requests from this virtual queue. Reading from this register
     returns the last value written to it. Both read and write
     accesses apply to the queue selected by writing to \field{QueueSel}.
   }
-  \hline=20
+  \hline
   \mmioreg{QueueNotify}{Queue notifier}{0x050}{W}{%
     Writing a value to this register notifies the device that
     there are new buffers to process in a queue.
@@ -1882,7 +1882,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Vi=
rtio Transport Options / Vi
     See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueue=
s / Driver notifications}
     for the definition of the components.
   }
-  \hline=20
+  \hline
   \mmioreg{InterruptStatus}{Interrupt status}{0x60}{R}{%
     Reading from this register returns a bit mask of events that
     caused the device interrupt to be asserted.
@@ -1895,49 +1895,49 @@ \subsection{MMIO Device Register Layout}\label{sec:=
Virtio Transport Options / Vi
         asserted because the configuration of the device has changed.
     \end{description}
   }
-  \hline=20
+  \hline
   \mmioreg{InterruptACK}{Interrupt acknowledge}{0x064}{W}{%
     Writing a value with bits set as defined in \field{InterruptStatus}
     to this register notifies the device that events causing
     the interrupt have been handled.
   }
-  \hline=20
+  \hline
   \mmioreg{Status}{Device status}{0x070}{RW}{%
     Reading from this register returns the current device status
     flags.
     Writing non-zero values to this register sets the status flags,
     indicating the driver progress. Writing zero (0x0) to this
-    register triggers a device reset.=20
+    register triggers a device reset.
     See also p. \ref{sec:Virtio Transport Options / Virtio Over MMIO / MMI=
O-specific Initialization And Device Operation / Device Initialization}~\na=
meref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initi=
alization And Device Operation / Device Initialization}.
   }
-  \hline=20
+  \hline
   \mmiodreg{QueueDescLow}{QueueDescHigh}{Virtual queue's Descriptor Area 6=
4 bit long physical address}{0x080}{0x084}{W}{%
     Writing to these two registers (lower 32 bits of the address
     to \field{QueueDescLow}, higher 32 bits to \field{QueueDescHigh}) noti=
fies
     the device about location of the Descriptor Area of the queue
     selected by writing to \field{QueueSel} register.
   }
-  \hline=20
+  \hline
   \mmiodreg{QueueDriverLow}{QueueDriverHigh}{Virtual queue's Driver Area 6=
4 bit long physical address}{0x090}{0x094}{W}{%
     Writing to these two registers (lower 32 bits of the address
     to \field{QueueDriverLow}, higher 32 bits to \field{QueueDriverHigh}) =
notifies
     the device about location of the Driver Area of the queue
     selected by writing to \field{QueueSel}.
   }
-  \hline=20
+  \hline
   \mmiodreg{QueueDeviceLow}{QueueDeviceHigh}{Virtual queue's Device Area 6=
4 bit long physical address}{0x0a0}{0x0a4}{W}{%
     Writing to these two registers (lower 32 bits of the address
     to \field{QueueDeviceLow}, higher 32 bits to \field{QueueDeviceHigh}) =
notifies
     the device about location of the Device Area of the queue
     selected by writing to \field{QueueSel}.
   }
-  \hline=20
+  \hline
   \mmioreg{SHMSel}{Shared memory id}{0x0ac}{W}{%
     Writing to this register selects the shared memory region \ref{sec:Bas=
ic Facilities of a Virtio Device / Shared Memory Regions}
     following operations on \field{SHMLenLow}, \field{SHMLenHigh},
     \field{SHMBaseLow} and \field{SHMBaseHigh} apply to.
   }
-  \hline=20
+  \hline
   \mmiodreg{SHMLenLow}{SHMLenHigh}{Shared memory region 64 bit long length=
}{0x0b0}{0x0b4}{R}{%
     These registers return the length of the shared memory
     region in bytes, as defined by the device for the region selected by
@@ -1947,7 +1947,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Vi=
rtio Transport Options / Vi
     region (i.e. where the ID written to \field{SHMSel} is unused)
     results in a length of -1.
   }
-  \hline=20
+  \hline
   \mmiodreg{SHMBaseLow}{SHMBaseHigh}{Shared memory region 64 bit long phys=
ical address}{0x0b8}{0x0bc}{R}{%
     The driver reads these registers to discover the base address
     of the region in physical address space.  This address is
@@ -1958,7 +1958,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Vi=
rtio Transport Options / Vi
     \field{SHMSel} is unused) results in a base address of
     0xffffffffffffffff.
   }
-  \hline=20
+  \hline
   \mmioreg{QueueReset}{Virtual queue reset bit}{0x0c0}{RW}{%
     If VIRTIO_F_RING_RESET has been negotiated, writing one (0x1) to this
     register selectively resets the queue. Both read and write accesses
@@ -1972,7 +1972,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Vi=
rtio Transport Options / Vi
     If the values are different, the configuration space accesses were not=
 atomic and the driver has to perform the operations again.
     See also \ref {sec:Basic Facilities of a Virtio Device / Device Config=
uration Space}.
   }
-  \hline=20
+  \hline
   \mmioreg{Config}{Configuration space}{0x100+}{RW}{
     Device-specific configuration space starts at the offset 0x100
     and is accessed with byte alignment. Its meaning and size
@@ -2149,7 +2149,7 @@ \subsection{Legacy interface}\label{sec:Virtio Transp=
ort Options / Virtio Over M
 in a slightly different control register layout, the device
 initialization and the virtual queue configuration procedure.
=20
-Table \ref{tab:Virtio Trasport Options / Virtio Over MMIO / MMIO Device Le=
gacy Register Layout}=20
+Table \ref{tab:Virtio Trasport Options / Virtio Over MMIO / MMIO Device Le=
gacy Register Layout}
 presents control registers layout, omitting
 descriptions of registers which did not change their function
 nor behaviour:
@@ -2158,14 +2158,14 @@ \subsection{Legacy interface}\label{sec:Virtio Tran=
sport Options / Virtio Over M
   \caption {MMIO Device Legacy Register Layout}
   \label{tab:Virtio Trasport Options / Virtio Over MMIO / MMIO Device Lega=
cy Register Layout} \\
   \hline
-  \mmioreg{Name}{Function}{Offset from base}{Direction}{Description}=20
-  \hline=20
-  \hline=20
+  \mmioreg{Name}{Function}{Offset from base}{Direction}{Description}
+  \hline
+  \hline
   \endfirsthead
   \hline
-  \mmioreg{Name}{Function}{Offset from the base}{Direction}{Description}=
=20
-  \hline=20
-  \hline=20
+  \mmioreg{Name}{Function}{Offset from the base}{Direction}{Description}
+  \hline
+  \hline
   \endhead
   \endfoot
   \endlastfoot
@@ -2184,7 +2184,7 @@ \subsection{Legacy interface}\label{sec:Virtio Transp=
ort Options / Virtio Over M
   \mmioreg{GuestFeatures}{Flags representing device features understood an=
d activated by the driver}{0x020}{W}{}
   \hline
   \mmioreg{GuestFeaturesSel}{Activated (guest) features word selection}{0x=
024}{W}{}
-  \hline=20
+  \hline
   \mmioreg{GuestPageSize}{Guest page size}{0x028}{W}{%
     The driver writes the guest page size in bytes to the
     register during initialization, before any queues are used.
@@ -2197,7 +2197,7 @@ \subsection{Legacy interface}\label{sec:Virtio Transp=
ort Options / Virtio Over M
     Writing to this register selects the virtual queue that the
     following operations on the \field{QueueNumMax}, \field{QueueNum}, \fi=
eld{QueueAlign}
     and \field{QueuePFN} registers apply to. The index
-    number of the first queue is zero (0x0).=20
+    number of the first queue is zero (0x0).
 .
   }
   \hline
@@ -2351,13 +2351,13 @@ \subsection{Basic Concepts}\label{sec:Virtio Transp=
ort Options / Virtio over cha
 \end{tabular}
=20
 A virtio-ccw proxy device facilitates:
-\begin{itemize}=20
+\begin{itemize}
 \item Discovery and attachment of virtio devices (as described above).
 \item Initialization of virtqueues and transport-specific facilities (usin=
g
       virtio-specific channel commands).
 \item Notifications (via hypercall and a combination of I/O interrupts
       and indicator bits).
-\end{itemize}=20
+\end{itemize}
=20
 \subsubsection{Channel Commands for Virtio}\label{sec:Virtio Transport Opt=
ions / Virtio
 over channel I/O / Basic Concepts/ Channel Commands for Virtio}
@@ -2402,7 +2402,7 @@ \subsubsection{Notifications}\label{sec:Virtio Transp=
ort Options / Virtio
 Host->Guest Notification / Notification via Classic I/O Interrupts} and
 \ref{sec:Virtio Transport Options / Virtio over channel I/O / Device
 Operation / Host->Guest Notification / Notification via Adapter I/O
-Interrupts} respectively.=20
+Interrupts} respectively.
=20
 Configuration change notifications are done using so-called classic I/O
 interrupts. The initialization is described in section \ref{sec:Virtio
@@ -3033,7 +3033,7 @@ \subsection{Virtqueues}\label{sec:Device Types / Netw=
ork Device / Virtqueues}
 \subsection{Feature bits}\label{sec:Device Types / Network Device / Featur=
e bits}
=20
 \begin{description}
-\item[VIRTIO_NET_F_CSUM (0)] Device handles packets with partial checksum.=
   This=20
+\item[VIRTIO_NET_F_CSUM (0)] Device handles packets with partial checksum.=
   This
   ``checksum offload'' is a common feature on modern network cards.
=20
 \item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial che=
cksum.
@@ -3084,6 +3084,8 @@ \subsection{Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_NOTF_COAL(55)] Device supports notifications coalescing=
.
+
 \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets. Unlike U=
FO
  (fragmenting the packet) the USO splits large UDP packet
  to several segments when each of these smaller packets has UDP header.
@@ -3129,6 +3131,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
 \item[VIRTIO_NET_F_GUEST_ANNOUNCE] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
+\item[VIRTIO_NET_F_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_=
F_HOST_TSO6.
 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
 \end{description}
@@ -4309,13 +4312,13 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
=20
 \drivernormative{\subparagraph}{Automatic receive steering in multiqueue m=
ode}{Device Types / Network Device / Device Operation / Control Virtqueue /=
 Automatic receive steering in multiqueue mode}
=20
-The driver MUST configure the virtqueues before enabling them with the=20
+The driver MUST configure the virtqueues before enabling them with the
 VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command.
=20
 The driver MUST NOT request a \field{virtqueue_pairs} of 0 or
 greater than \field{max_virtqueue_pairs} in the device configuration space=
.
=20
-The driver MUST queue packets only on any transmitq1 before the=20
+The driver MUST queue packets only on any transmitq1 before the
 VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command.
=20
 The driver MUST NOT queue packets on transmit queues greater than
@@ -4464,6 +4467,45 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Network Device / Devi
 (necessarily when not using the legacy interface) little-endian.
=20
=20
+\paragraph{Notifications Coalescing}\label{sec:Device Types / Network Devi=
ce / Device Operation / Control Virtqueue / Notifications Coalescing}
+
+If the VIRTIO_NET_F_NOTF_COAL feature is negotiated, the driver can
+send control commands for dynamically changing the coalescing parameters.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_coal_usec {
+    le32 tx_usecs;
+    le32 rx_usecs;
+};
+
+struct virtio_net_ctrl_coal_frames {
+    le32 tx_frames_max;
+    le32 rx_frames_max;
+};
+
+#define VIRTIO_NET_CTRL_NOTF_COAL 6
+ #define VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET  0
+ #define VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET 1
+\end{lstlisting}
+
+The class VIRTIO_NET_CTRL_NOTF_COAL has 2 commands:
+\begin{itemize}
+\item VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET: set the rx-usecs (time to delay=
 an RX notification after packet arrival in microseconds) and tx-usecs (tim=
e to delay a TX notification after a sending a packet in microseconds) para=
meters.
+\item VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET: set the rx-max-frames (number =
of packets to delay an RX notification after packet arrival) and tx-max-fra=
mes (number of packets to delay a TX notification after sending a packet) p=
arameters.
+\end{itemize}
+
+\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Notifications Coales=
cing}
+
+
+A driver MUST NOT send to the device VIRTIO_NET_CTRL_NOTF_COAL commands if=
 the VIRTIO_NET_F_NOTF_COAL feature
+has not been negotiated.
+
+\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Notifications Coales=
cing}
+
+A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIR=
TIO_NET_ERR if was not able to change the parameters.\\ \\
+A device SHOULD NOT send notifications to the driver, if the driver asked =
to suppress notifications by setting the suppress notifications flag in the=
 driver area.\\ \\
+If VIRTIO_F_EVENT_IDX feature was negotiated, the device SHOULD start coun=
ting the coalescing parameters from the point it reached to the buffer spec=
ified by the driver.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
=20
--=20
2.32.0


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

