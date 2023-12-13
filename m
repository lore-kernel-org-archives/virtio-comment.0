Return-Path: <virtio-comment-return-8787-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9043EC4332F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 04:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF0D12CAD9
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 04:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82E459866B5
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 04:50:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 63FDF983FE2; Wed, 13 Dec 2023 04:50:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16917986561
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Dec 2023 04:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ZaN0qvqdO1mt691wJfzKuA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702442949; x=1703047749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaOtqQOKvS4gDnKYJIDw9JJ2KtpgswK+ICrcadktyB8=;
        b=kVsKF1lVip7Dd6AuKLMurI8iOEkpwhXfKh2S6SPB4ASJBDtp0oecbSgSHQeg8mzHzQ
         jCcRJtUnwd0qo+GCZax3OTVHWr8ZTo/yH6D7eJefSpo3CLBl4VVwHQMkQwr9WcIgB6fN
         TwTMVuGI5/VuzxlZWSSnTV6l1N+4DZ8QWdD0lDATiPkaFPRHZC4eMu85GDAOIjxU+Nks
         pxo7iN/0UUFhsec095YDJX35LKMeN6ux99ZtuGrl1BbGV7bXWHdUCupdmvq9NBHJe8Dr
         w94UUJK67Saui68soAKqc2NSaK6KCLG+Bmh7YKahNvYXKFr9xydGCcQCUqVc5mNVgs6U
         CO3g==
X-Gm-Message-State: AOJu0YzwkY06ILoWcChUOwsdMGiMXVTDEylUAZlg33G5nIYFE93+9OBV
	t3zU0TD2qKLw+5XmcSSR3UwkfPe4b1musFD0uF8nZw1rVWOIevoFE1w4ktlHvGdGeg+hNSd/EVE
	0uYU38Q0SNyYzeVOULtBMeZkGketoqPf4kC5axIEquE2K1Fb1FQ==
X-Received: by 2002:a17:90a:de14:b0:286:9464:1bc9 with SMTP id m20-20020a17090ade1400b0028694641bc9mr5698316pjv.26.1702442948571;
        Tue, 12 Dec 2023 20:49:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8l0KoGRkTXMmgvzlVOX44KKFrUAP/sHxnsR1qXnjVozJuaNR1VEPg0LFCF7SxXvdiOKI2NzyBLJU0fdOJIpo=
X-Received: by 2002:a17:90a:de14:b0:286:9464:1bc9 with SMTP id
 m20-20020a17090ade1400b0028694641bc9mr5698304pjv.26.1702442948100; Tue, 12
 Dec 2023 20:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20231110123853.2093309-1-parav@nvidia.com> <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org> <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org> <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231212105018-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231212105018-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 13 Dec 2023 12:48:55 +0800
Message-ID: <CACGkMEu3+-M6VmnSQgBvRPnNvgYOPOO3vfjH5Y+vjgL51ciiug@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
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

On Tue, Dec 12, 2023 at 11:52=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Fri, Nov 24, 2023 at 12:02:23PM +0800, Jason Wang wrote:
> > On Wed, Nov 22, 2023 at 10:51=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > >
> > > On Wed, Nov 22, 2023 at 02:10:29PM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Wednesday, November 22, 2023 7:32 PM
> > > > >
> > > > > On Fri, Nov 10, 2023 at 02:38:50PM +0200, Parav Pandit wrote:
> > > > > > The device responds flow filter capabilities using two commands=
.
> > > > > > One command indicates generic flow filter device limits such as=
 number
> > > > > > of flow filters, number of flow filter groups, support or multi=
ple
> > > > > > transports etc.
> > > > > >
> > > > > > The second command indicates supported match types, and fields =
of the
> > > > > > packet.
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
> > > > > > @@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:De=
vice
> > > > > > Types / Network Device / Device Ope
> > > > > >
> > > > > >  The device indicates the flow filter capabilities to the drive=
r.
> > > > > > These  capabilities include various maximum device limits and
> > > > > > -supported packet match fields.
> > > > > > +supported packet match fields. These control virtqueue command=
s are:
> > > > > > +\ref{sec:Device Types / Network Device / Device Operation / Co=
ntrol
> > > > > > +Virtqueue / Flow Filter / Flow Filter Capabilities Get} and
> > > > > > +\ref{sec:Device Types / Network Device / Device Operation / Co=
ntrol
> > > > > Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
> > > > > >
> > > > > >  The flow filters are grouped using a flow filter group. Each f=
low
> > > > > > filter  group has a priority. The device first applies the flow
> > > > > > filters of the highest @@ -1224,7 +1228,136 @@ \subsubsection{F=
low
> > > > > Filter}\label{sec:Device Types / Network Device / Device Ope
> > > > > >        the flow filters in group_C, the flow filters of next le=
vel group_B are
> > > > > applied.
> > > > > >  \end{itemize}
> > > > > >
> > > > > > -\label{sec:Device Types / Network Device / Device Operation / =
Control
> > > > > > Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> > > > > > +\paragraph{Match Types and Fields}\label{sec:Device Types / Ne=
twork
> > > > > > +Device / Device Operation / Flow Filter / Match Types and Fiel=
ds}
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
h the
> > > > > > +mask supplied in the flow filter match entry.
> > > > > > +
> > > > > > +For each \field{type} the \field{fields_bmap} indicates suppor=
ted
> > > > > > +fields of the packet header which can be matched.
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields a=
re
> > > > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the p=
acket \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet=
 \\
> > > > > > +\hline
> > > > > > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag f=
ields
> > > > > > +are represented by a bitmap in \field{fields_bmap} are followi=
ng:
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
> > > > > > +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields =
are
> > > > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the pack=
et \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the=
 packet \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields =
are
> > > > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the pack=
et \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the=
 packet \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields a=
re
> > > > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the pack=
et \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the=
 packet
> > > > > \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > > > +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields a=
re
> > > > > > +represented by a bitmap in \field{fields_bmap} are following:
> > > > > > +
> > > > > > +\begin{tabular}{|l|l|l|}
> > > > > > +\hline
> > > > > > +Bit & Name & Description \\
> > > > > > +\hline \hline
> > > > > > +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the pack=
et \\
> > > > > > +\hline
> > > > > > +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the=
 packet
> > > > > \\
> > > > > > +\hline
> > > > > > +other   & -    & reserved  \\
> > > > > > +\hline
> > > > > > +\end{tabular}
> > > > > > +
> > > > >
> > > > > This is such an elaborate structure to report just 12 read only b=
its.
> > > > > Please let's just follow the example of  le32 supported_tunnel_ty=
pes and add
> > > > > l32 supported_flow_control.
> > > > >
> > > > supported_tunnel_types was let go because cvq is efficient.
> > > > None of these fields are needed for init time configuration of the =
driver before DRIVER_OK.
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
> > > > > After you were trying to add kilobytes to megabytes of memory - I=
 see little
> > > > > reason to save 12 RO bits that can be shared by any number of VFs=
.
> > > > >
> > > > Completely wrong reason and very late review and also does not alig=
n with every other command we did.
> > >
> > > which other command? hash and rss are like this: capability in config
> > > space config through cvq. For the same reason.
> > >
> > > > > However, I do think we should create an option to access config s=
pace over
> > > > > DMA (preferably admin commands). Let's add this quickly and then =
we don't
> > > > > need to worry about legacy guests accessing flow filter through M=
MIO.
> > > >
> > > > CVQ is already there as single interface forget and set for rss, rs=
s context, vq moderation, statistics, flow filter caps and more.
> > > > No reason to bifurcate.
> > >
> > > The reason is so that we have a single consistent view where e.g. you=
 want
> > > to provision a device with a specific capability you just
> > > specify how its config space looks.
> > >
> > > If you start shuffling capabilities off to VQs that will be much
> > > much harder.
> > >
> > > > I won't be able to absorb this comment of DMA interface.
> > > > If I discuss further, I will repeat the whole document [1] and I wi=
ll avoid that now.
> > > >
> > > > [1] https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1=
s73Ed6rOsmn6LfXc/edit#heading=3Dh.qexbtyc2jpwr
> > >
> > >
> > > I really worry about how provisioning will work. And I do not at all
> > > cherish replicating all of these query capability commands for provis=
ioning.
> >
> > +1
> >
> > There's nothing that prevents the config space from being implemented
> > in a way other than registers.
>
> Jason I'm not sure what does your +1 mean here. Are you ok with the
> patchset as is? While I feel config space would be nicer I also find it
> unlikely drivers will actually bother to check the supported commands.
> So from that POV, for this use-case I am not too stressed out.

I meant I prefer config space access.

1) It simplifies the provisioning and compatibility check a lot.
2) We don't need a mini driver to probe the features

We could invent a DMA interface for config space if necessary
(actually there's one in the transport vq series).

Thanks

>
> --
> MST
>


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

