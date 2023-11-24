Return-Path: <virtio-comment-return-8597-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A4C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:03:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D2680330A2
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:03:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C4F329868B4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:03:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B8F6C9862D9; Fri, 24 Nov 2023 06:03:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AAF4A9868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: htZwzVWuNOuJsAGaFhm9og-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700805804; x=1701410604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OXbZttQKRz2JYVJfmQx1qr2J0sHs2YsnITqD3LIpIQ=;
        b=QGiA6f7ajMnO2UjL+08/+3bKSJ1+hHDklLb39+pW0dNXTDza2/Si8cKCAkGGEfKgLo
         qj8aGrgUYqDhggbegQReSSuzt3bL+IktWOMS64/zN/g+Zer4ETsAxmnGDAx7wZGkwv8K
         g3Q/4Vsyx67uni77i69d+69LgYLrfVbfeb5gN6LgawFXYiI7bVarKoDtoW/wJKBuWF8i
         AR4auYTTL86V0uML/fmZxCXi94fNLlliXVsWOxdwJUsjb2YaF7eFhlU2GLt4WtzDQICt
         499KAnM/2CVhjWPABl2NOnFt/FVW56d3pN1A91b0/G15g0v70FO3xfZhox6xMuSDaBJx
         RtvA==
X-Gm-Message-State: AOJu0YydevumgJ+Vrkrf0JSoL5zeotYwpV8gdvGQBCTrKKaxom0xTY1u
	FMJpjK9+oD35Y//cb541fiSnQl3FeMbz4n5XMjEhFZeowCLcz7z0PKVSJnJiOU6gcvYK77ZFDuZ
	wfDzbNx7sH4I2+7BpmRkfjazkf0Xq9EP6++w+86Uh4dxFTu1U3Q==
X-Received: by 2002:a19:5050:0:b0:500:c292:e44e with SMTP id z16-20020a195050000000b00500c292e44emr875744lfj.54.1700805804211;
        Thu, 23 Nov 2023 22:03:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6otbj7nnU9GANhd7aMKOCfSF41jF/VQOH0lQ+GwcFqlPEH5mlJKs8dOvRdP4A19SXRhTIh45cqq5TgUSpCGM=
X-Received: by 2002:a19:5050:0:b0:500:c292:e44e with SMTP id
 z16-20020a195050000000b00500c292e44emr875727lfj.54.1700805803646; Thu, 23 Nov
 2023 22:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20231110123853.2093309-1-parav@nvidia.com> <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org> <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org> <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 14:03:12 +0800
Message-ID: <CACGkMEvhUZJsYM-vmEtkidtLWrhentQ5x=jTD3O8UwGTOniZ7Q@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>, 
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Fri, Nov 24, 2023 at 12:13=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, November 24, 2023 9:32 AM
> >
> > On Wed, Nov 22, 2023 at 10:51=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com>
> > wrote:
> > >
> > > On Wed, Nov 22, 2023 at 02:10:29PM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Wednesday, November 22, 2023 7:32 PM
> > > > >
> > > > > On Fri, Nov 10, 2023 at 02:38:50PM +0200, Parav Pandit wrote:
> > > > > > The device responds flow filter capabilities using two commands=
.
> > > > > > One command indicates generic flow filter device limits such as
> > > > > > number of flow filters, number of flow filter groups, support o=
r
> > > > > > multiple transports etc.
> > > > > >
> > > > > > The second command indicates supported match types, and fields
> > > > > > of the packet.
> > > > > >
> > > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> > > > > > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > >
> > > > > > ---
> > > > > > changelog:
> > > > > > v2->v3:
> > > > > > - rebased on virtio-1.4 branch
> > > > > > - removed reference for flow filter virtqueue
> > > > > > v1->v2:
> > > > > > - addressed comments from Satananda
> > > > > > - added vlan type match field
> > > > > > - kept space for types between l2, l3, l4 header match types
> > > > > > - renamed mask to mask_supported with shorter width
> > > > > > - made more fields reserved for furture
> > > > > > - addressed comments from Heng
> > > > > > - grammar correction
> > > > > > - added field to indicate supported number of actions per flow
> > > > > >   filter match entry
> > > > > > - added missing documentation for max_flow_priorities_per_group
> > > > > > v0->v1:
> > > > > > - added mask field in the type to indicate supported mask by de=
vice
> > > > > >   and also in later patch to use it to indicate mask on adding
> > > > > >   flow filter. As a result removed the mask_supported capabilit=
y
> > > > > >   field
> > > > > > ---
> > > > > >  device-types/net/description.tex | 208
> > > > > > ++++++++++++++++++++++++++++++-
> > > > > >  1 file changed, 206 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/device-types/net/description.tex
> > > > > > b/device-types/net/description.tex
> > > > > > index 30220b5..eccd8d6 100644
> > > > > > --- a/device-types/net/description.tex
> > > > > > +++ b/device-types/net/description.tex
> > > > > > @@ -1173,7 +1173,11 @@ \subsubsection{Flow
> > > > > > Filter}\label{sec:Device Types / Network Device / Device Ope
> > > > > >
> > > > > >  The device indicates the flow filter capabilities to the drive=
r.
> > > > > > These  capabilities include various maximum device limits and
> > > > > > -supported packet match fields.
> > > > > > +supported packet match fields. These control virtqueue command=
s
> > are:
> > > > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > > > > > +Control Virtqueue / Flow Filter / Flow Filter Capabilities Get=
}
> > > > > > +and \ref{sec:Device Types / Network Device / Device Operation =
/
> > > > > > +Control
> > > > > Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> > > > > >
> > > > > >  The flow filters are grouped using a flow filter group. Each
> > > > > > flow filter  group has a priority. The device first applies the
> > > > > > flow filters of the highest @@ -1224,7 +1228,136 @@
> > > > > > \subsubsection{Flow
> > > > > Filter}\label{sec:Device Types / Network Device / Device Ope
> > > > > >        the flow filters in group_C, the flow filters of next
> > > > > > level group_B are
> > > > > applied.
> > > > > >  \end{itemize}
> > > > > >
> > > > > > -\label{sec:Device Types / Network Device / Device Operation /
> > > > > > Control Virtqueue / Setting Promiscuous Mode}%old label for
> > > > > > latexdiff
> > > > > > +\paragraph{Match Types and Fields}\label{sec:Device Types /
> > > > > > +Network Device / Device Operation / Flow Filter / Match Types
> > > > > > +and Fields}
> > > > > > +
> > > > > > +\begin{lstlisting}
> > > > > > +struct virtio_net_ff_match_type_cap {
> > > > > > +        le16 type;
> > > > > > +        u8 mask_supported;
> > > > > > +        u8 reserved[5];
> > > > > > +        le64 fields_bmap;
> > > > > > +};
> > > > > > +\end{lstlisting}
> > > > > > +
> > > > > > +The \field{type} corresponds to following table:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Type & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet \\
> > > > > > +\hline
> > > > > > +0x1   & VIRTIO_NET_FF_VLAN_TAG_HDR & VLAN tag of the packet \\
> > > > > > +\hline
> > > > > > +0x200   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \=
\
> > > > > > +\hline
> > > > > > +0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \=
\
> > > > > > +\hline
> > > > > > +0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> > > > > > +\hline
> > > > > > +0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +When the \field{mask_supported} is set, for the specific
> > > > > > +\field{type}, the device can perform masking packet fields wit=
h
> > > > > > +the mask supplied in the flow filter match entry.
> > > > > > +
> > > > > > +For each \field{type} the \field{fields_bmap} indicates
> > > > > > +supported fields of the packet header which can be matched.
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
> > > > > > +are represented by a bitmap in \field{fields_bmap} are followi=
ng:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the
> > packet \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet
> > \\
> > > > > > +\hline
> > > > > > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag
> > > > > > +fields are represented by a bitmap in \field{fields_bmap} are
> > following:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_VLAN_TAG_TCI & Vlan tag TCI 16-bit field \=
\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields
> > > > > > +are represented by a bitmap in \field{fields_bmap} are followi=
ng:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the pack=
et
> > \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the
> > packet \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
> > > > > > +are represented by a bitmap in \field{fields_bmap} are followi=
ng:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the pack=
et
> > \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the
> > packet \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
> > > > > > +are represented by a bitmap in \field{fields_bmap} are followi=
ng:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the
> > packet \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the
> > packet
> > > > > \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
> > > > > > +are represented by a bitmap in \field{fields_bmap} are followi=
ng:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the
> > packet \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the
> > packet
> > > > > \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved  \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > >
> > > > > This is such an elaborate structure to report just 12 read only b=
its.
> > > > > Please let's just follow the example of  le32
> > > > > supported_tunnel_types and add
> > > > > l32 supported_flow_control.
> > > > >
> > > > supported_tunnel_types was let go because cvq is efficient.
> > > > None of these fields are needed for init time configuration of the =
driver
> > before DRIVER_OK.
> > >
> > > I really basically disagree. Whether control flow is supported can
> > > easily influence how many VQs are needed.
> > >
> > >
> > > >
> > > > It is a very narrow view of 12 bits. It is going to grow and many.
> > > > This is far more structured for each type done here.
> > > >
> > > > >
> > > > > After you were trying to add kilobytes to megabytes of memory - I
> > > > > see little reason to save 12 RO bits that can be shared by any nu=
mber of
> > VFs.
> > > > >
> > > > Completely wrong reason and very late review and also does not alig=
n
> > with every other command we did.
> > >
> > > which other command? hash and rss are like this: capability in config
> > > space config through cvq. For the same reason.
> > >
> > > > > However, I do think we should create an option to access config
> > > > > space over DMA (preferably admin commands). Let's add this quickl=
y
> > > > > and then we don't need to worry about legacy guests accessing flo=
w
> > filter through MMIO.
> > > >
> > > > CVQ is already there as single interface forget and set for rss, rs=
s context,
> > vq moderation, statistics, flow filter caps and more.
> > > > No reason to bifurcate.
> > >
> > > The reason is so that we have a single consistent view where e.g. you
> > > want to provision a device with a specific capability you just specif=
y
> > > how its config space looks.
> > >
> > > If you start shuffling capabilities off to VQs that will be much much
> > > harder.
> > >
> > > > I won't be able to absorb this comment of DMA interface.
> > > > If I discuss further, I will repeat the whole document [1] and I wi=
ll avoid
> > that now.
> > > >
> > > > [1]
> > > > https://docs.google.com/document/d/1Iyn-
> > l3Nm0yls3pZaul4lZiVj8x1s73Ed
> > > > 6rOsmn6LfXc/edit#heading=3Dh.qexbtyc2jpwr
> > >
> > >
> > > I really worry about how provisioning will work. And I do not at all
> > > cherish replicating all of these query capability commands for provis=
ioning.
> >
> > +1
> >
>  - 1
>
> All points are discussed and not going to repeat 7th or 8th time.

Discussed by not converging.


>
> > There's nothing that prevents the config space from being implemented i=
n a
> > way other than registers.
> >
> It does.
> It is discussed 7th or 8th time.
>
> All the points are discussed already.
> [1] https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1s73Ed6=
rOsmn6LfXc/edit#heading=3Dh.qexbtyc2jpwr
>
> many things are done over cvq and statistics capabilities over cvq is the=
 latest approved.
> I wont be able to repeat the content of document [1] anymore.

We are discussing the provisioning. Hypervisor needs to know the
capabilities of a device in order to migrate it.

Exposing device specific capabilities in device configuration space is
the way we're using now. You don't need a mini-driver to get the
capability of a device.

It doesn't conflict with CVQ.

>
> > > Instead, I propose commands for config space access to solve
> > > everything in one go, for all device types.
> > >
> >
> > Something similar like:
> >
> > +\begin{lstlisting}
> > +#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
> > +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
> > +  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
> > +
> > +struct transportq_ctrl_mdev_config_get {
> > +       u32 offset;
> > +       u32 size;
> > +};
> > +
> > +struct transportq_ctrl_mdev_config_set {
> > +       u32 offset;
> > +       u32 size;
> > +       u8  data[];
> > +};
> > +\end{lstlisting}
> >
> > in the proposal of transport virtqueue.
> >
> > https://lists.oasis-open.org/archives/virtio-comment/202208/msg00005.ht=
ml
> >
> -1 as cvq already exists those services the role for caps and control far=
 beyond tiny register-based interface.

Again, device configuration space is not necessarily implemented in
registers. This seems to be a wrong assumption in your doc.

>
> As more features grow, tunneling commands through a I2C or SPI or GPIO ki=
nd of register interface is turning the clock back.
> A command interface is way more extendible than register interface.

I don't get here, device configuration space itself can be extended as
described in the spec:

"
Where configuration fields are optional, their existence is indicated
by feature bits: Future versions of this specification will likely
extend the device configuration space by adding extra fields at the
tail.
"

Thanks


>
> We wont be able to support this change that does not align with all the i=
mprovements done in 1.3 for notification coalescing, hash, stats and more.


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

