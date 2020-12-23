Return-Path: virtio-comment-return-1589-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B76B79860DC
	for <virtio-comment@lists.oasis-open.org>; Wed, 23 Dec 2020 18:56:33 +0000 (UTC)
From: Sergey Viktorov <sergeyv@parallels.com>
Date: Wed, 23 Dec 2020 18:56:27 +0000
Message-ID: <YTOPR0101MB16737E03763F8F3DA8DD50D2A4DE0@YTOPR0101MB1673.CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH RFC] Introduce multiple interrupt support (config + per queue)
 for MMIO-based devices.
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This is an attempt to remove performance handicap of MMIO-based devices ind=
uced=0Aby single interrupt and mandatory acknowledgement limitations. While=
 PCI-based=0Adevices can take advantage of MSI-X interrupts, MMIO part of t=
he spec relies on=0Aclassic status/acknowledgement pattern and made no prov=
isions for using multiple=0Ainterrupts.=0AThe suggestion is to add interrup=
t assignment registers similar to configuration=0Afields of a PCI-based dev=
ice that would allow configuration and queue device=0Anotifications to use =
separate interrupts. Set of interrupts usable by the device=0Ais defined by=
 the virtual platform and declared via DeviceTree and/or ACPI DSDT=0Athe sa=
me way it's done now for single interrupt. The new device capability is=0Ae=
xposed through VIRTIO_F_MMIO_MULTI_IRQ feature bit. If the feature is negot=
iated=0Athe device makes new registers available and also disables mandator=
y interrupt=0Aacknowledgement semantics.=0A=0AOur primary motivation is to =
implement an ARM-based virtual platform that does=0Anot expose PCI bus and =
saves on associated code complexity. This is perfectly=0Adoable right now b=
ut performance critical devices, namely network and block, are=0Aheld back =
by interrupt handling semantics in comparison to their PCI-based twins.=0A-=
--=0A content.tex | 38 +++++++++++++++++++++++++++++++++++---=0A 1 file cha=
nged, 35 insertions(+), 3 deletions(-)=0A=0Adiff --git a/content.tex b/cont=
ent.tex=0Aindex 620c0e2..0dc1e48 100644=0A--- a/content.tex=0A+++ b/content=
.tex=0A@@ -1753,6 +1753,14 @@ \subsection{MMIO Device Register Layout}\labe=
l{sec:Virtio Transport Options / Vi=0A     bits accessible by writing to \f=
ield{DriverFeatures}.=0A   }=0A   \hline=20=0A+  \mmioreg{ConfigInt}{Config=
uration interrupt index}{0x028}{W}{%=0A+    Assign one of device interrupts=
 to configuration change. Device=0A+    interrupt indices start at zero and=
 follow DeviceTree and/or=0A+    ACPI DSDT declaration order. The default i=
nterrupt index is 0.=0A+    This register may only be used if VIRTIO_F_MMIO=
_MULTI_IRQ feature=0A+    has been negotiated.=0A+  }=0A+  \hline=20=0A   \=
mmioreg{QueueSel}{Virtual queue index}{0x030}{W}{%=0A     Writing to this r=
egister selects the virtual queue that the=0A     following operations on \=
field{QueueNumMax}, \field{QueueNum}, \field{QueueReady},=0A@@ -1775,6 +178=
3,15 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport=
 Options / Vi=0A     writing to \field{QueueSel}.=0A   }=0A   \hline=20=0A+=
  \mmioreg{QueueInt}{Virtual queue interrupt index}{0x03c}{W}{%=0A+    Assi=
gn one of device interrupts to queue previously selected=0A+    by writing =
to \field{QueueSel}. Device interrupt indices start at=0A+    zero and foll=
ow DeviceTree and/or ACPI DSDT declaration order.=0A+    By default all que=
ues have interrupt 0 assigned to them.=0A+    This register may only be use=
d if VIRTIO_F_MMIO_MULTI_IRQ feature=0A+    has been negotiated.=0A+  }=0A+=
  \hline=20=0A   \mmioreg{QueueReady}{Virtual queue ready bit}{0x044}{RW}{%=
=0A     Writing one (0x1) to this register notifies the device that it can=
=0A     execute requests from this virtual queue. Reading from this registe=
r=0A@@ -1809,12 +1826,14 @@ \subsection{MMIO Device Register Layout}\label{=
sec:Virtio Transport Options / Vi=0A       \item [Configuration Change Noti=
fication] - bit 1 - the interrupt was=0A         asserted because the confi=
guration of the device has changed.=0A     \end{description}=0A+    This re=
gister is not used if VIRTIO_F_MMIO_MULTI_IRQ is negotiated.=0A   }=0A   \h=
line=20=0A   \mmioreg{InterruptACK}{Interrupt acknowledge}{0x064}{W}{%=0A  =
   Writing a value with bits set as defined in \field{InterruptStatus}=0A  =
   to this register notifies the device that events causing=0A     the inte=
rrupt have been handled.=0A+    This register is not used if VIRTIO_F_MMIO_=
MULTI_IRQ is negotiated.=0A   }=0A   \hline=20=0A   \mmioreg{Status}{Device=
 status}{0x070}{RW}{%=0A@@ -1948,8 +1967,9 @@ \subsection{MMIO Device Regis=
ter Layout}\label{sec:Virtio Transport Options / Vi=0A=20=0A The driver MUS=
T ignore undefined bits in \field{InterruptStatus}.=0A=20=0A-The driver MUS=
T write a value with a bit mask describing events it handled into \field{In=
terruptACK} when=0A-it finishes handling an interrupt and MUST NOT set any =
of the undefined bits in the value.=0A+If VIRTIO_F_MMIO_MULTI_IRQ is not ne=
gotiated the driver MUST write a value with a bit mask=0A+describing events=
 it handled into \field{InterruptACK} when it finishes handling=0A+an inter=
rupt and MUST NOT set any of the undefined bits in the value.=0A=20=0A \sub=
section{MMIO-specific Initialization And Device Operation}\label{sec:Virtio=
 Transport Options / Virtio Over MMIO / MMIO-specific Initialization And De=
vice Operation}=0A=20=0A@@ -2016,12 +2036,20 @@ \subsubsection{Available Bu=
ffer Notifications}\label{sec:Virtio Transport Option=0A=20=0A \subsubsecti=
on{Notifications From The Device}\label{sec:Virtio Transport Options / Virt=
io Over MMIO / MMIO-specific Initialization And Device Operation / Notifica=
tions From The Device}=0A=20=0A-The memory mapped virtio device is using a =
single, dedicated=0A+By default the memory mapped virtio device is using a =
single, dedicated=0A interrupt signal, which is asserted when at least one =
of the=0A bits described in the description of \field{InterruptStatus}=0A i=
s set. This is how the device sends a used buffer notification=0A or a conf=
iguration change notification to the device.=0A=20=0A+On platforms where mu=
ltiple edge triggered or message signalled=0A+interrupts per device are sup=
ported the device may advertise=0A+VIRTIO_F_MMIO_MULTI_IRQ feature. If nego=
tiated, this feature removes=0A+mandatory interrupt acknowledgement and all=
ows per queue interrupt=0A+assignment via \field{ConfigInt} and \field{Queu=
eInt} in a manner=0A+similar to MSI-X. The list of available device interru=
pts is=0A+defined by platform and declared via DeviceTree and/or ACPI DSDT.=
=0A+=0A \drivernormative{\paragraph}{Notifications From The Device}{Virtio =
Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Dev=
ice Operation / Notifications From The Device}=0A After receiving an interr=
upt, the driver MUST read=0A \field{InterruptStatus} to check what caused t=
he interrupt (see the=0A@@ -6596,6 +6624,10 @@ \chapter{Reserved Feature Bi=
ts}\label{sec:Reserved Feature Bits}=0A   transport specific.=0A   For more=
 details about driver notifications over PCI see \ref{sec:Virtio Transport =
Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Oper=
ation / Available Buffer Notifications}.=0A=20=0A+  \item[VIRTIO_F_MMIO_MUL=
TI_IRQ(40)] Applicable only to MMIO-based devices,=0A+  this feature remove=
s mandatory interrupt acknowledgement and allows per queue=0A+  interrupt a=
ssignment.=0A+  See \ref{sec:Virtio Transport Options / Virtio Over MMIO / =
MMIO-specific Initialization And Device Operation / Notifications From The =
Device}=0A \end{description}=0A=20=0A \drivernormative{\section}{Reserved F=
eature Bits}{Reserved Feature Bits}=0A--=20=0A2.24.3 (Apple Git-128)=0A
This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

