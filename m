Return-Path: <virtio-comment-return-6259-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A1AC7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 18:35:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 817B53357D
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 18:35:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 538A1986689
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 18:35:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3A03C986681; Thu,  8 Jun 2023 18:35:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BEA81986682
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 18:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vyWuQVNnMeymT0ZPzhL-_g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686249270; x=1688841270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sinvhy1B0V7ETJQdcAxumzYXtKVHdtLTjOGO5rpfF4=;
        b=Pb7KbLgoKRE5LCGSGH/LuyxMKz8e+nbk8WawU9pWiWLRsgqJ5om5SM+19BXBaQzoSU
         xeKR5JuiOJw20+Pz/i7OKejW1Wi4abKUnvaUc0ZqD4RwXdGgMH+QPFOA6qUzpzNBF/nV
         QJrkCCqBu+XwuRKfqBOWgqhahfF5cVpdKvBe8g/eFXTTEwoo03QwXRwS1i6fFH+SOo/f
         TX5AothgJ85XU0WSic2JK/w/v1wvNyLHFodkmj6Hro5Myx5HCPSBaRjWns4qSYZXoRCn
         ih5Zv25JROXd/9jPFCzVnkSokN92xklnZvrY1K4uI8wODC0ExeUbhuIlzh14Tui3kBXW
         OVSw==
X-Gm-Message-State: AC+VfDwOL1jLUWrZ3ZyH7tj/THiuuk+3S3D66yLlgTAoQ9bz2MPh8RWy
	9UwbLe/MvUpMyXRvxCB3KzsgiIZHtIZ6G2RzRsKZ4eT3cBAlEr9S5IMJguks6FUuj+IfRfKolgQ
	UOiJ4KwyJM5kKsBmaFnjQ0DFDVM+GtP+XNQ==
X-Received: by 2002:a05:600c:ad0:b0:3f7:19f9:4c4f with SMTP id c16-20020a05600c0ad000b003f719f94c4fmr1948574wmr.21.1686249269617;
        Thu, 08 Jun 2023 11:34:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7qvxth7gI6HX8cevb6ZuqHh3h932cN0FWgftbYQxqVRvN/y6k8hS8IklvCRIfAnZPvYsFsYg==
X-Received: by 2002:a05:600c:ad0:b0:3f7:19f9:4c4f with SMTP id c16-20020a05600c0ad000b003f719f94c4fmr1948558wmr.21.1686249269194;
        Thu, 08 Jun 2023 11:34:29 -0700 (PDT)
Date: Thu, 8 Jun 2023 14:34:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	yishaih@nvidia.com, maorg@nvidia.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230608143135-mutt-send-email-mst@kernel.org>
References: <20230602203604.627661-1-parav@nvidia.com>
 <20230602203604.627661-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230602203604.627661-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v3 2/3] transport-pci: Introduce legacy registers access
 commands

On Fri, Jun 02, 2023 at 11:36:03PM +0300, Parav Pandit wrote:
> This patch introduces legacy registers access commands for the owner
> group member PCI PF to access the legacy registers of the member VFs.
> 
> If in future any SIOV devices to support legacy registers, they
> can be easily supported using same commands by using the group
> member identifiers of the future SIOV devices.
> 
> More details as overview, motivation, use case are further described
> below.
> 
> Usecase:
> --------
> 1. A hypervisor/system needs to provide transitional
>    virtio devices to the guest VM at scale of thousands,
>    typically, one to eight devices per VM.
> 
> 2. A hypervisor/system needs to provide such devices using a
>    vendor agnostic driver in the hypervisor system.
> 
> 3. A hypervisor system prefers to have single stack regardless of
>    virtio device type (net/blk) and be future compatible with a
>    single vfio stack using SR-IOV or other scalable device
>    virtualization technology to map PCI devices to the guest VM.
>    (as transitional or otherwise)
> 
> Motivation/Background:
> ----------------------
> The existing virtio transitional PCI device is missing support for
> PCI SR-IOV based devices. Currently it does not work beyond
> PCI PF, or as software emulated device in reality. Currently it
> has below cited system level limitations:
> 
> [a] PCIe spec citation:
> VFs do not support I/O Space and thus VF BARs shall not indicate I/O Space.
> 
> [b] cpu arch citiation:
> Intel 64 and IA-32 Architectures Software Developer’s Manual:
> The processor’s I/O address space is separate and distinct from
> the physical-memory address space. The I/O address space consists
> of 64K individually addressable 8-bit I/O ports, numbered 0 through FFFFH.
> 
> [c] PCIe spec citation:
> If a bridge implements an I/O address range,...I/O address range will be
> aligned to a 4 KB boundary.
> 
> Overview:
> ---------
> Above usecase requirements can be solved by PCI PF group owner accessing
> its group member PCI VFs legacy registers using an admin virtqueue of
> the group owner PCI PF.
> 
> Two new admin virtqueue commands are added which read/write PCI VF
> registers.
> 
> The third command suggested by Jason queries the VF device's driver
> notification region.
> 
> Software usage example:
> -----------------------
> One way to use and map to the guest VM is by using vfio driver
> framework in Linux kernel.
> 
>                 +----------------------+
>                 |pci_dev_id = 0x100X   |
> +---------------|pci_rev_id = 0x0      |-----+
> |vfio device    |BAR0 = I/O region     |     |
> |               |Other attributes      |     |
> |               +----------------------+     |
> |                                            |
> +   +--------------+     +-----------------+ |
> |   |I/O BAR to AQ |     | Other vfio      | |
> |   |rd/wr mapper  |     | functionalities | |
> |   +--------------+     +-----------------+ |
> |                                            |
> +------+-------------------------+-----------+
>        |                         |
>        |                         |
>        |                  Driver notifications
>        |                         |
>   +----+------------+       +----+------------+
>   | +-----+         |       | PCI VF device A |
>   | | AQ  |-------------+---->+-------------+ |
>   | +-----+         |   |   | | legacy regs | |
>   | PCI PF device   |   |   | +-------------+ |
>   +-----------------+   |   +-----------------+
>                         |
>                         |   +----+------------+
>                         |   | PCI VF device N |
>                         +---->+-------------+ |
>                             | | legacy regs | |
>                             | +-------------+ |
>                             +-----------------+
> 
> 2. Virtio pci driver to bind to the listed device id and
>    use it as native device in the host.
> 
> 3. Use it in a light weight hypervisor to run bare-metal OS.
> 
> Please review.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/167
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v2->v3:
> - adddressed Jason and Michael's comment to split single register
>   access command to common config and device specific commands.
> - dropped the suggetion to introduce enable/disable command as
>   admin command cap bit already covers it.
> v1->v2:
> - addressed comments from Michael
> - added theory of operation
> - grammar corrections
> - removed group fields description from individual commands as
>   it is already present in generic section
> - added endianness normative for legacy device registers region
> - renamed the file to drop vf and add legacy prefix
> 
> - added overview in commit log
> - renamed subsection to reflect command
> ---
>  admin.tex                     |  12 ++-
>  transport-pci-legacy-regs.tex | 153 ++++++++++++++++++++++++++++++++++
>  transport-pci.tex             |   2 +
>  3 files changed, 166 insertions(+), 1 deletion(-)
>  create mode 100644 transport-pci-legacy-regs.tex
> 
> diff --git a/admin.tex b/admin.tex
> index e51f9e6..5bcde98 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -117,7 +117,17 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
>  \hline
>  0x0001 & VIRTIO_ADMIN_CMD_LIST_USE & Provides to device list of commands used for this group type \\
>  \hline
> -0x0002 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
> +0x0002 & VIRTIO_ADMIN_CMD_LCC_REG_WRITE & Write legacy common configuration registers of a member device    \\
> +\hline
> +0x0003 & VIRTIO_ADMIN_CMD_LCC_REG_READ & Read legacy common configuration registers of a member device    \\
> +\hline
> +0x0004 & VIRTIO_ADMIN_CMD_LD_REG_WRITE & Write legacy device registers of a member device    \\
> +\hline
> +0x0005 & VIRTIO_ADMIN_CMD_LD_REG_READ & Read legacy device registers of a member device    \\
> +\hline
> +0x0006 & VIRTIO_ADMIN_CMD_LQ_NOTIFY_QUERY & Read the queue notification offset for legacy interface \\
> +\hline

Could you avoid such drastic abbreviation in command names? 
Standard things like CMD,CFG are ok, but
LCC/LD will not ring any bells for anyone, except maybe confusingly
make one think of "C Compiler" and "Link eDitor".
Let's just LEGACY_COMMON_CFG/LEGACY_DEVICE_CFG?


> +0x0007 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
>  \hline
>  0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
>  \hline
> diff --git a/transport-pci-legacy-regs.tex b/transport-pci-legacy-regs.tex
> new file mode 100644
> index 0000000..948ac73
> --- /dev/null
> +++ b/transport-pci-legacy-regs.tex
> @@ -0,0 +1,153 @@
> +\subsection{Legacy Interfaces: SR-IOV VFs Registers Access}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access}
> +
> +As described in PCIe base specification \hyperref[intro:PCIe]{[PCIe]} PCI VFs
> +do not support the I/O space BAR. A PCI VF hardware device that can support
> +legacy interfaces cannot be passthrough to the guest virtual machine
> +due to this limitation. To have a transitional virtio device in the guest
> +virtual machine, a PCI PF device as a group owner may support accessing its
> +group member PCI VF device's legacy registers using an administrative
> +virtqueue. This enables minimal intervention in the hypervisor only for
> +the purpose of legacy registers access.
> +
> +A hypervisor software accesses the legacy configuration and device specific
> +registers requested by the guest virtual machine using an administrative
> +virtqueue. Even though virtqueue driver notifications can be communicated
> +through administrative virtqueue, if the PCI PF and VF devices support such
> +notifications using a memory-mapped operation, such driver notifications
> +are sent using a device defined notification region.
> +
> +The group owner PCI PF device can optionally enable the driver to access
> +its member PCI VFs devices legacy common configuration and device configuration
> +registers using an administration virtqueue. Such a PCI PF device supports
> +the following commands:
> +
> +\begin{enumerate}
> +\item Legacy Common Configuration Registers Write Command
> +\item Legacy common Configuration Registers Read Command
> +\item Legacy Device Specific registers Write Command
> +\item Legacy Device Specific registers Read Command
> +\item Legacy Queue Notify Offset Query Command
> +\end{enumerate}
> +
> +\subsubsection{Legacy Common Configuration Registers Write Command}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access / Legacy Common Configuration Registers Write Command}
> +
> +The Legacy Common Configuration Registers Write Command follows
> +\field{struct virtio_admin_cmd}.
> +This command writes legacy common configuration registers of a member VF device.
> +The driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LCC_REG_WRITE.
> +
> +The command VIRTIO_ADMIN_CMD_LCC_REG_WRITE uses following structure for
> +\field{command_specific_data}:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_lcc_reg_wr_data {
> +	u8 offset; /* Starting byte offset of the common configuration register(s) to write */
> +	u8 register[];
> +};
> +\end{lstlisting}
> +
> +This command does not have any command specific result.
> +
> +\subsubsection{Legacy Common Configuration Registers Read Command}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access / Legacy Common Configuration Registers Read Command}
> +
> +The Legacy Common Configuration Registers Read Command follows \field{struct virtio_admin_cmd}.
> +This command reads legacy common configuration registers of a member VF device.
> +The driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LCC_REG_READ.
> +
> +The command VIRTIO_ADMIN_CMD_LCC_REG_READ uses following listed structure for
> +\field{command_specific_data}:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_lcc_reg_rd_data {
> +	u8 offset; /* Starting byte offset of the register to read */
> +};
> +\end{lstlisting}
> +
> +When command completes successfully, \field{command_specific_result}
> +uses following listed structure:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_lcc_reg_rd_result {
> +	u8 registers[];
> +};
> +\end{lstlisting}
> +
> +
> +\subsubsection{Legacy Device Registers Write Command}\label{sec:Virtio Transport
> +Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access / Legacy Device Registers Write Command}
> +
> +The Legacy Device Registers Write Command follows \field{struct virtio_admin_cmd}.
> +This command writes legacy device registers of a member VF device.
> +The driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LD_REG_WRITE.
> +
> +The command VIRTIO_ADMIN_CMD_LD_REG_WRITE uses following structure for
> +\field{command_specific_data}:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_ld_reg_wr_data {
> +	u8 offset; /* Starting byte offset of the device register(s) to write */
> +	u8 register[];
> +};
> +\end{lstlisting}
> +
> +This command does not have any command specific result.
> +
> +\subsubsection{Legacy Device Registers Read Command}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access / Legacy Common Configuration Registers Read Command}
> +
> +The Legacy Device Registers Read Command follows \field{struct virtio_admin_cmd}.
> +This command reads legacy device specific registers of a member VF device.
> +The driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LD_REG_READ.
> +
> +The command VIRTIO_ADMIN_CMD_LD_REG_READ uses following listed structure for
> +\field{command_specific_data}:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_ld_reg_rd_data {
> +	u8 offset; /* Starting byte offset of the register to read */
> +};
> +\end{lstlisting}
> +
> +When command completes successfully, \field{command_specific_result}
> +uses following listed structure:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_ld_reg_rd_result {
> +	u8 registers[];
> +};
> +\end{lstlisting}
> +
> +\subsubsection{Legacy Queue Notify Offset Query Command}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / Legacy Interfaces: SR-IOV VFs Registers Access / Legacy Queue Notify Offset Query Command}
> +
> +This command returns the notify offset of the member VF for virtqueue
> +driver notifications. This command follows \field{struct virtio_admin_cmd}.
> +The driver sets command \field{opcode} to VIRTIO_ADMIN_CMD_LQ_NOTIFY_QUERY.
> +There is no command specific data for this command.
> +
> +When command completes successfully, \field{command_specific_result}
> +uses following listed structure:
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_lq_notify_query_result {
> +	u8 bar; /* PCI BAR number of the member VF */
> +	u8 reserved[7];
> +	le64 offset; /* Byte offset within the BAR */
> +};
> +\end{lstlisting}
> +
> +The driver that may use the driver notifications region of the VF device
> +returned in this result likely attain higher performance or the drier may use
> +the VIRTIO_ADMIN_CMD_LREG_WRITE command.
> +
> +\begin{note}
> +The device and driver must encode and decode legacy device specific registers
> +using little endian format. Per PCI VF device level big endian format support
> +is left for the future.
> +\end{note}
> +
> +\begin{note}
> +The PCI VF device should not use PCI BAR 0 when it prefers to support
> +legacy interface registers access using its group owner PF. This enables
> +hypervisor software to operate with least complexities to compose a legacy
> +interface I/O space BAR and passthrough other PCI BARs and PCI device
> +capabilities to the guest virtual machine without any translation.
> +\end{note}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..72c78f6 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -1212,3 +1212,5 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
>          re-examine the configuration space to see what changed.
>      \end{itemize}
>  \end{itemize}
> +
> +\input{transport-pci-legacy-regs.tex}
> -- 
> 2.26.2


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

