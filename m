Return-Path: <virtio-comment-return-5726-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE29CC77B78
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:48:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F14E571C8B
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:48:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5BF09866C4
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 16:48:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DE43098658B; Wed,  3 May 2023 16:48:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE9489865A1
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 16:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: g5RHf-x2NJa12UBeKigMOQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683132518; x=1685724518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHrGL4FjiC3rdK8k5wjEJNAlz5vW/+Vm3eJYmaKjM9s=;
        b=CLNOlfZtC9mtN2iVGVXYNcnFZ+gDM8xMAEHmww4FRJAuOCHNphD/yYDs300mknp02P
         plAQEu6C/SopF7xXQPdPxZZjTsCPVLON1wT2ock9LKxjs2M9OVwB+dajQBWD4RVAyxZo
         F7EzZJ6dRiYcZcjVWjCK4d5yMq42jNF/FK15ofraXiSjIUt74CTl/C0UclTAs8kwTAZ4
         ZB8UMOUrHt08kSLL/1RJllh0sxCKLA7AckjL68y6UH337lpww235enhpYz5VF1Up1jhR
         K8zdKlgKqMSDY91KNGnGf7JECxutGficsT/7RCpuI0xiMXHO8fHD6oVxHoJHj3DxoVCY
         mMLw==
X-Gm-Message-State: AC+VfDy+yIenv+oiAIIbOGaWEJxdn5zT2TjrJhuKCXZ3+NhCZeTxmRhj
	VFl0dnSEe9ujPQ81oSWrezng0apf/2U6Ow10GJjWqWWVMWj+WDokdrqyX/RE6k4NPmaIv5cs+jP
	jqwTOKyTpz38rjz8qPaPGrHlJdLfYld0wPg==
X-Received: by 2002:a7b:c04b:0:b0:3f3:2b37:dd30 with SMTP id u11-20020a7bc04b000000b003f32b37dd30mr12383618wmc.22.1683132517811;
        Wed, 03 May 2023 09:48:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56fiNEQZDfP2Tm1934ieEAruc8+1ILcJz/QHJqeHgdR5BRQ3sT/zoTBeqZ3Hs2TfbQLGlp0Q==
X-Received: by 2002:a7b:c04b:0:b0:3f3:2b37:dd30 with SMTP id u11-20020a7bc04b000000b003f32b37dd30mr12383601wmc.22.1683132517443;
        Wed, 03 May 2023 09:48:37 -0700 (PDT)
Date: Wed, 3 May 2023 12:48:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230503124212-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-2-parav@nvidia.com>
 <20230503011627-mutt-send-email-mst@kernel.org>
 <c0ece552-d618-cbe3-c841-6c6fe72e8f18@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <c0ece552-d618-cbe3-c841-6c6fe72e8f18@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 1/2] transport-pci: Introduce legacy registers access
 commands

On Wed, May 03, 2023 at 10:47:26AM -0400, Parav Pandit wrote:
> 
> 
> On 5/3/2023 1:42 AM, Michael S. Tsirkin wrote:
> > On Wed, May 03, 2023 at 06:26:58AM +0300, Parav Pandit wrote:
> 
> > > diff --git a/transport-pci-vf-regs.tex b/transport-pci-vf-regs.tex
> > > new file mode 100644
> > > index 0000000..16ced32
> > > --- /dev/null
> > > +++ b/transport-pci-vf-regs.tex
> > 
> > I'd like the name to reflect "legacy". Also I don't think this has
> > to be SRIOV generally. It's just legacy PCI over admin commands.
> > Except for virtio_admin_cmd_lq_notify_query_result
> > which refers to PCI? But that
> > one I can't say for sure what it does.
> > 
> It is for legacy now, in future it can be renamed if this is supported.
> We already discussed in v0 that non legacy should not involve hypervisor
> mediation. May be you still it should be. In such case lets park that
> discussion for future. This proposal is not limiting it.
> 
> > 
> > > @@ -0,0 +1,84 @@
> > > +\subsection{SR-IOV VFs Legacy Registers Access}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access}
> > > +
> > > +As described in PCIe base specification \hyperref[intro:PCIe]{[PCIe]} PCI VFs
> > > +do not support IOBAR. A PCI PF device can optionally enable driver to access
> > > +its member PCI VFs devices legacy common configuration and device configuration
> > > +registers using an administration virtqueue. A PCI PF group owner device that
> > > +supports its member VFs legacy registers access via the administration
> > > +virtqueue should supports following commands.
> > 
> > As above. It actually can work for any group if we want to.
> True. As defined by the PCIe spec, for virtualized VFs and SFs devices, VI
> is not necessary, and many devices in PCI space are avoiding hypervisor
> mediation, so whether to tunnel or not is really a question for future for
> non legacy registers.
> 
> > 
> > 
> > > +
> > > +\begin{enumerate}
> > > +\item Legacy Registers Write
> > > +\item Legacy Registers Read
> > > +\item Legacy Queue Notify Offset Query
> > > +\end{enumerate}
> > > +
> > 
> > Pls add some theory of operation. How can all this be used?
> > 
> ok. I will add in this section.
> 
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_lreg_rd_result {
> > > +	u8 registers[];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +\subsubsection{Legacy Queue Notify Offset Query}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / SR-IOV Legacy Registers Access / Legacy Queue Notify Offset Query}
> > > +
> > > +This command returns the notify offset of the member VF for queue
> > > +notifications.
> > 
> > What is this notify offset? It's never explained.
> > 
> ok. will add it.
> It is the notification offset where a hypervisor driver can perform driver
> notifications.
> 
> > > This command follows \field{struct virtio_admin_cmd}.
> > > +Driver sets command opcode \field{opcode} to VIRTIO_ADMIN_CMD_LQ_NOTIFY_QUERY.
> > > +There is no command specific data for this command.
> > > +Driver sets \field{group_type} to 1.
> > > +Driver sets \field{group_member_id} to a valid VF number.
> > 
> > I think ATM the limitation for this is that the member must be a pci
> > device, otherwise BAR is not well defined. We will have to
> > find a way to extend this for SIOV.
> 
> SIOV device will also have the BAR and offset of the parent PF.
> The limitation of current AQ is currently is it indicates the BAR of the
> member device (and does not allow group owner for SIOV), but we can craft it
> via SIOV device BAR and it will be fine. SIOV spec is not yet released for
> this details at all. So we can wait.
> 
> > But that is all, please do
> > not repeat documentation about virtio_admin_cmd header, we have that in
> > a central place.
> > 
> Make sense. I will omit it here.
> 
> > > +
> > > +When command completes successfully, command result contains the queue
> > > +notification address in the listed format:
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_admin_cmd_lq_notify_query_result {
> > > +	u8 bar; /* PCI BAR number of the member VF */
> > > +	u8 reserved[7];
> > > +	le64 offset; /* Byte offset within the BAR */
> > > +};
> > > +\end{lstlisting}
> > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > index ff889d3..b187576 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -1179,3 +1179,5 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
> > >           re-examine the configuration space to see what changed.
> > >       \end{itemize}
> > >   \end{itemize}
> > > +
> > > +\input{transport-pci-vf-regs.tex}
> > 
> > As simple as it is, I feel this falls far short of describing how
> > a device should operate.
> > Some issues:
> > 	- legacy device config offset changes as msi is enabled/disabled
> > 	  suggest separate commands for device/common config
> This is fine and covered here. The one who is making msix enable/disable
> knows which registers to access before/after disable/enable and device also
> knows it as it is supplying the register.
> So they just follow the standard legacy register access behavior.

But do VFs support INT#x? I will have to re-read the spec.

> > 	- legacy device endian-ness changes with guest
> > 	  suggest commands to enable LE and BE mode
> guest endianeness is not known to the device.

But is known to hypervisor.

> Currently it is only for the
> LE guests who had some legacy requirement.

I don't like tying this to LE implicitly some devices might be BE only.
With my idea device can support command to set LE, command to set BE or
both.

> and PCIe is LE anyway.

PCIE config endian-ness does not matter heere.

> > 	- legacy guests often assume INT#x support
> > 	  suggest a way to tunnel that too;
> INT#x is present on the PCI device itself. So no need to tunnel it.
> Also INT#x is very narrow case. When MSI-X is not supported, a hypervisor
> can choose not to even connect such device to the guest VM.

devices will support MSI. But *guest* might not support MSIX you only
find out late when it is driving the device.

> > 	  though supporting ISR is going to be a challenge :(
> > 	- I presume admin command is not the way to do kicks? Or is it ok?
> > 	- there's some kind of notify thing here?
> > 
> Right.
> We already discussed this in v0.
> Summary of it is: admin command can, but it wont work any performant way.
> The device and driver uses the notification region already present on the
> PCI VF device, which is queried using NOTIFY_QUERY command.
> 
> > I expected to see more statements along the lines of
> >          command ABC has the same effect as access
> >          to register DEF of the member through the legacy pci interface
> > 
> Yes, good point. I will add it in the theory of operation section for this
> mapping detail.

OK, and overall if you see an existing statement about legacy do not
copy it, just explain how it is mapped.

-- 
MST


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

