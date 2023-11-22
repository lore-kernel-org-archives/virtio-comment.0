Return-Path: <virtio-comment-return-8561-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CFAC61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:51:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 278BA22375
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:51:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 04AE09868A4
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:51:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E2C50986898; Wed, 22 Nov 2023 14:51:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2A51986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6wCPG21DPx6oZK76jgM3Hg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700664689; x=1701269489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMPtp3nZeQ1xICyhn4HBo8kj906aGBcHMbmMAA2g/Vk=;
        b=R78EKeA3vJUjX/T9ro7eX976EuS0zR+lRvCsR5sG1epXWVHnmBfE1sshGCTzY57lL0
         92BbiOnzxaGFzFn9QhNTbE/qh1PWyK5OWsHmwnVpbS2adkViGz2wxns+a3PACOy1INdn
         orQizvM81B6J41hQgWUtzX15HWlwBBjVHhTDicg9b0M9EVAN+sg+tVh8NVy2vj+QdbAD
         x+xVtVRV+uTnyhuzT59lkeElchc+GzRCWyqon6wSS5jTr2D7e7rqcaZTF+coHc54qdka
         EJqboet/YqQFtOqL4Dv9rpJV/OSh35VLOlCTZt9iTnv/QJnWw2io2sWYQMib7QdztB6+
         V0Vg==
X-Gm-Message-State: AOJu0YwGs8Y2K6lLfJAcKzUN4xR6LUg39yzL0W+zGL3VxmK9j+J/45ed
	K6GgmSgWFgLQLrxMoLC10R6ZthK2r+XmzarlILXnSQXB0VTLp6nJ2/y+MLiWLQPGLGU/QxSM1dJ
	N1XTh07iam04y0imfvXkl9g52UZxiNtRYPw==
X-Received: by 2002:ac2:5159:0:b0:502:f7a4:c31f with SMTP id q25-20020ac25159000000b00502f7a4c31fmr1960196lfd.45.1700664689214;
        Wed, 22 Nov 2023 06:51:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcbS1PN85wguoY8cTpfJme8JEMvhAe2QYn2ydC5icZPuNBBuBgsgV9DWlJqtCI4kUXKqZZjw==
X-Received: by 2002:ac2:5159:0:b0:502:f7a4:c31f with SMTP id q25-20020ac25159000000b00502f7a4c31fmr1960172lfd.45.1700664688611;
        Wed, 22 Nov 2023 06:51:28 -0800 (PST)
Date: Wed, 22 Nov 2023 09:51:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231122094431-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands

On Wed, Nov 22, 2023 at 02:10:29PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, November 22, 2023 7:32 PM
> > 
> > On Fri, Nov 10, 2023 at 02:38:50PM +0200, Parav Pandit wrote:
> > > The device responds flow filter capabilities using two commands.
> > > One command indicates generic flow filter device limits such as number
> > > of flow filters, number of flow filter groups, support or multiple
> > > transports etc.
> > >
> > > The second command indicates supported match types, and fields of the
> > > packet.
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > >
> > > ---
> > > changelog:
> > > v2->v3:
> > > - rebased on virtio-1.4 branch
> > > - removed reference for flow filter virtqueue
> > > v1->v2:
> > > - addressed comments from Satananda
> > > - added vlan type match field
> > > - kept space for types between l2, l3, l4 header match types
> > > - renamed mask to mask_supported with shorter width
> > > - made more fields reserved for furture
> > > - addressed comments from Heng
> > > - grammar correction
> > > - added field to indicate supported number of actions per flow
> > >   filter match entry
> > > - added missing documentation for max_flow_priorities_per_group
> > > v0->v1:
> > > - added mask field in the type to indicate supported mask by device
> > >   and also in later patch to use it to indicate mask on adding
> > >   flow filter. As a result removed the mask_supported capability
> > >   field
> > > ---
> > >  device-types/net/description.tex | 208
> > > ++++++++++++++++++++++++++++++-
> > >  1 file changed, 206 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/device-types/net/description.tex
> > > b/device-types/net/description.tex
> > > index 30220b5..eccd8d6 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:Device
> > > Types / Network Device / Device Ope
> > >
> > >  The device indicates the flow filter capabilities to the driver.
> > > These  capabilities include various maximum device limits and
> > > -supported packet match fields.
> > > +supported packet match fields. These control virtqueue commands are:
> > > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > > +Virtqueue / Flow Filter / Flow Filter Capabilities Get} and
> > > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> > >
> > >  The flow filters are grouped using a flow filter group. Each flow
> > > filter  group has a priority. The device first applies the flow
> > > filters of the highest @@ -1224,7 +1228,136 @@ \subsubsection{Flow
> > Filter}\label{sec:Device Types / Network Device / Device Ope
> > >        the flow filters in group_C, the flow filters of next level group_B are
> > applied.
> > >  \end{itemize}
> > >
> > > -\label{sec:Device Types / Network Device / Device Operation / Control
> > > Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> > > +\paragraph{Match Types and Fields}\label{sec:Device Types / Network
> > > +Device / Device Operation / Flow Filter / Match Types and Fields}
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_net_ff_match_type_cap {
> > > +        le16 type;
> > > +        u8 mask_supported;
> > > +        u8 reserved[5];
> > > +        le64 fields_bmap;
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The \field{type} corresponds to following table:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Type & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet \\
> > > +\hline
> > > +0x1   & VIRTIO_NET_FF_VLAN_TAG_HDR & VLAN tag of the packet \\
> > > +\hline
> > > +0x200   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
> > > +\hline
> > > +0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> > > +\hline
> > > +0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> > > +\hline
> > > +0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> > > +\hline
> > > +other   & -    & reserved \\
> > > +\hline
> > > +\end{tabular}
> > > +
> > > +When the \field{mask_supported} is set, for the specific
> > > +\field{type}, the device can perform masking packet fields with the
> > > +mask supplied in the flow filter match entry.
> > > +
> > > +For each \field{type} the \field{fields_bmap} indicates supported
> > > +fields of the packet header which can be matched.
> > > +
> > > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > > +represented by a bitmap in \field{fields_bmap} are following:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Bit & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet \\
> > > +\hline
> > > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> > > +\hline
> > > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > > +\hline
> > > +other   & -    & reserved \\
> > > +\hline
> > > +\end{tabular}
> > > +
> > > +For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
> > > +are represented by a bitmap in \field{fields_bmap} are following:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Bit & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_VLAN_TAG_TCI & Vlan tag TCI 16-bit field \\
> > > +\hline
> > > +other   & -    & reserved \\
> > > +\hline
> > > +\end{tabular}
> > > +
> > > +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields are
> > > +represented by a bitmap in \field{fields_bmap} are following:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Bit & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \\
> > > +\hline
> > > +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the packet \\
> > > +\hline
> > > +other   & -    & reserved \\
> > > +\hline
> > > +\end{tabular}
> > > +
> > > +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields are
> > > +represented by a bitmap in \field{fields_bmap} are following:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Bit & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \\
> > > +\hline
> > > +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the packet \\
> > > +\hline
> > > +other   & -    & reserved \\
> > > +\hline
> > > +\end{tabular}
> > > +
> > > +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields are
> > > +represented by a bitmap in \field{fields_bmap} are following:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Bit & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the packet \\
> > > +\hline
> > > +1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the packet
> > \\
> > > +\hline
> > > +other   & -    & reserved \\
> > > +\hline
> > > +\end{tabular}
> > > +
> > > +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields are
> > > +represented by a bitmap in \field{fields_bmap} are following:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Bit & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the packet \\
> > > +\hline
> > > +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the packet
> > \\
> > > +\hline
> > > +other   & -    & reserved  \\
> > > +\hline
> > > +\end{tabular}
> > > +
> > 
> > This is such an elaborate structure to report just 12 read only bits.
> > Please let's just follow the example of  le32 supported_tunnel_types and add
> > l32 supported_flow_control.
> > 
> supported_tunnel_types was let go because cvq is efficient.
> None of these fields are needed for init time configuration of the driver before DRIVER_OK.

I really basically disagree. Whether control flow is supported can
easily influence how many VQs are needed.


> 
> It is a very narrow view of 12 bits. It is going to grow and many.
> This is far more structured for each type done here.
> 
> > 
> > After you were trying to add kilobytes to megabytes of memory - I see little
> > reason to save 12 RO bits that can be shared by any number of VFs.
> > 
> Completely wrong reason and very late review and also does not align with every other command we did.

which other command? hash and rss are like this: capability in config
space config through cvq. For the same reason.

> > However, I do think we should create an option to access config space over
> > DMA (preferably admin commands). Let's add this quickly and then we don't
> > need to worry about legacy guests accessing flow filter through MMIO.
> 
> CVQ is already there as single interface forget and set for rss, rss context, vq moderation, statistics, flow filter caps and more.
> No reason to bifurcate.

The reason is so that we have a single consistent view where e.g. you want
to provision a device with a specific capability you just
specify how its config space looks.

If you start shuffling capabilities off to VQs that will be much
much harder.

> I won't be able to absorb this comment of DMA interface.
> If I discuss further, I will repeat the whole document [1] and I will avoid that now.
> 
> [1] https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1s73Ed6rOsmn6LfXc/edit#heading=h.qexbtyc2jpwr


I really worry about how provisioning will work. And I do not at all
cherish replicating all of these query capability commands for provisioning.
Instead, I propose commands for config space access to solve everything
in one go, for all device types.

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

