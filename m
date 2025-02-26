Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB198152196
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740549364; cv=none; b=MRCkm5GsrzxBu1Mv9fM7h6+AmLgBwGn8NVGnomOZHM/zNiVF+pG/uct507xPsxdOatxRFkBJn4j9dUxN5LVQ5eHLOI6AYMnIn9W+h5a1gT27uDDdZmCUxVt5H01LD5jXQ3NCJdfvz1S1WDDh3WT68mpVKSE0nvC6i2Xc7PHKGWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740549364; c=relaxed/simple;
	bh=l/ZJrGi0Nmng9V5PTrnDTL2vkh6dD1Zej9pKSkWMmZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpsSFggb2hEENcGKEJ/7qTEC3xJPJEW9KyT1JTDpUratKTnuqTYvo4RuWR7gy6O99YrgzB8qoccx+5KXvB075K7gJdupmZHvdYSVFZcGUX/vSCtXO9Pq6CC3l19Ia1XQwPpY6RmTVfqrNbCDKQPajMbYbJ/uJb0ktzHnaI6qzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fsQmGlNJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fsQmGlNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740549360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00EdWVHPoMQHvlzIUwN8uPs6Nz8Xc2iFclE8/2Qqlew=;
	b=fsQmGlNJjcj8Ao2WFzVcciqcRfFCiCQdzjyXJabSXTBx4z1kC2V72ETbOxylbd4a7hJLt4
	7FudiIcGce52/CqWZps3qaCTVx1/5FEZRoaXc7QHRMTzY1yGwEXQu8/zuZ9P8eFMQy53kg
	ipQqfbDPy5arf3/iSw6wLFtyXgdMW7U=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-GasNoNU-PS-g47jpML1EqA-1; Wed, 26 Feb 2025 00:55:59 -0500
X-MC-Unique: GasNoNU-PS-g47jpML1EqA-1
X-Mimecast-MFC-AGG-ID: GasNoNU-PS-g47jpML1EqA_1740549357
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fe870bc003so481113a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 21:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740549356; x=1741154156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00EdWVHPoMQHvlzIUwN8uPs6Nz8Xc2iFclE8/2Qqlew=;
        b=Xk80wnC4Ownj8f+XJRNLYjZlzI1BRr5xr/o1qTTlEtAIk0V7SsPLEI2nZchaqa6kH0
         dcG/RbWH8UKf6A+/i5qdYTFvpugo77b4rqK7hiTaNJs7s4r7Uc5rtj0IDiIjRY+pXrrY
         JcMxKLrL1qBSGlDSPhkALa+q6Lr8UdsrgWO8/EDSJrWZ0T4/IuNPGNQFNsc0abHVJG1k
         QZ9uKUBleMEBqeRUzqy8Szvj14XW2CkEFDzD2WAV5s3SfHZCyhwplBxxfAsUEGtYYMwa
         WNXzcRcUfyMvrhB4IhagcuLuLaC8X5eeoZlUgn4KvDSYgy8ly1HKwY3bupFwGKtlC20P
         5wig==
X-Forwarded-Encrypted: i=1; AJvYcCUgobdF1gscckFB3Zl5QIE9TBox1msGnFqQVbeuX0qGL1jVsXCo2JBHzDTcbmAjBIvlm43NIzHJcUrAFCM5og==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg8RVIC/5lNEFo9Yplk0vDDmh4PyF4wp+kodCAk4Dq6ttfjtdE
	dkMuFyoKlJpewVoE69t13jcDYpBdEKtD7GRW2fSLcRsT8DYjCnQTLhy48CZ+gcTfw7nTBgpUx/u
	vNA6H4sWTi9WUIHxxa4I73fx6iCrzyClcNjVgV4EuoJn+ldJns9xnRaNz4pa1DwLICshZcra4Cw
	evd8sB/w7WltiuQ1rXMIALHmUOa6p6grGjV5uJ9qDXDHvKUT/z7feSeT4=
X-Gm-Gg: ASbGncsUuHGIm616rsDQHgg0qoSf2TrlKyPEbo789U8QKudCwWPKKOCRaPipDYtCHic
	+ly+hspylOj3Gp+H7PLtMsDrMKbbDSCycIIS1sL+i7DARnwuFMrvIZohJTKN/Ne7vDaqQCkkOEA
	==
X-Received: by 2002:a17:90b:3883:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-2fccc0f838amr38036582a91.3.1740549356434;
        Tue, 25 Feb 2025 21:55:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk97iXEFnGt57SX3WuIURN5w0UtApBCHGNS/tjVdRDkC29XbM1MZOjFaHqRlKDFxrVFmK4JA83+4rMU9pflpw=
X-Received: by 2002:a17:90b:3883:b0:2fa:42f3:e3e4 with SMTP id
 98e67ed59e1d1-2fccc0f838amr38036561a91.3.1740549356041; Tue, 25 Feb 2025
 21:55:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217172509.107212-1-kshankar@marvell.com> <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
 <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com> <DM4PR18MB42695701DC0DB5AB4FABE902DFC02@DM4PR18MB4269.namprd18.prod.outlook.com>
In-Reply-To: <DM4PR18MB42695701DC0DB5AB4FABE902DFC02@DM4PR18MB4269.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 26 Feb 2025 13:55:44 +0800
X-Gm-Features: AWEUYZk4ungrntkvJyw6zcRji_4MMy5pfNWFhJPZ2z6RFfkOUTOVy-xNHPdOUVI
Message-ID: <CACGkMEuUsQuQ5zNu=kqdTQ9-zWsNc3zdFYVre03fuNnE6tKjog@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
To: Shiva Shankar Kommula <kshankar@marvell.com>
Cc: "pabeni@redhat.com" <pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>, 
	"parav@nvidia.com" <parav@nvidia.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>, Jerin Jacob <jerinj@marvell.com>, 
	Rahul Bhansali <rbhansali@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _JfeaCZmqwKi3ByAEy5Jh2Vlkux66Qvee2CTd2o43Ik_1740549357
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 1:48=E2=80=AFAM Shiva Shankar Kommula
<kshankar@marvell.com> wrote:
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, February 20, 2025 7:20 AM
> > To: Shiva Shankar Kommula <kshankar@marvell.com>
> > Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio-
> > comment@lists.linux.dev; Nithin Kumar Dabilpuram
> > <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> > Bhansali <rbhansali@marvell.com>
> > Subject: Re: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new fiel=
d to
> > indicate outer network header offset
> >
> > On Wed, Feb 19, 2025 at 2:=E2=80=8A40 PM Shiva Shankar Kommula
> > <kshankar@=E2=80=8Amarvell.=E2=80=8Acom> wrote: > > > > > -----Original=
 Message----- > >
> > From: Jason Wang <jasowang@=E2=80=8Aredhat.=E2=80=8Acom> > > Sent: Wedn=
esday, February
> > 19, 2025
> > On Wed, Feb 19, 2025 at 2:40=E2=80=AFPM Shiva Shankar Kommula
> > <kshankar@marvell.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, February 19, 2025 9:00 AM
> > > > To: Shiva Shankar Kommula <kshankar@marvell.com>
> > > > Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio=
-
> > > > comment@lists.linux.dev; Nithin Kumar Dabilpuram
> > > > <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> > > > Bhansali <rbhansali@marvell.com>
> > > > Subject: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new fiel=
d
> > > > to indicate outer network header offset
> > > >
> > > > On Tue, Feb 18, 2025 at 1:=E2=80=8A25 AM Kommula Shiva Shankar <ksh=
ankar@
> > > > marvell.=E2=80=8Acom> wrote: > > This patch introduces a new field =
in the
> > > > virtio_net_header called out_nh_offset, along with a new net device
> > > > feature, VIRTIO_NET_F_OUT_NET_HEADER.
> > > > On Tue, Feb 18, 2025 at 1:25=E2=80=AFAM Kommula Shiva Shankar
> > > > <kshankar@marvell.com> wrote:
> > > > >
> > > > > This patch introduces a new field in the virtio_net_header called
> > > > out_nh_offset, along with a new net device feature,
> > > > VIRTIO_NET_F_OUT_NET_HEADER.
> > > > >
> > > > > Currently, drivers lack a dedicated field to signal the start of
> > > > > the network header to the device when performing checksum offload
> > > > > and
> > > > segmentation offload. This requires reading packet, which
> > > > significantly affects performance in datapath.
> > > > > Additionally, some hardware implementations requrie knowledege of
> > > > > the
> > > > outer L3 offset (aka L2 length) for inline IPSec hardware accelerat=
ion.
> > > > >
> > > > > To address this limitation, we propose splitting the csum_offset
> > > > > field into
> > > > two 8-bit fields named csum_offset and out_nh_offset.
> > > > > The csum_offset indicates the offset value from the csum_start an=
d
> > > > > may not exceed 256B bits(2^8) for protocols that use a 16-bit
> > > > > one's complement checksum
> > > > >
> > > > > Following table lists such protocols and their checksum offset
> > > > > fields within their headers
> > > > >
> > > > > +-----+--------+
> > > > > |Proto|csum_off|
> > > > > +-----+--------+
> > > > > | IPV4| 10B    |
> > > > > | ICMP| 2B     |
> > > > > | IGMP| 2B     |
> > > > > |  TCP| 16B    |
> > > > > |  UDP| 6B     |
> > > > > +-----+--------+
> > > > >
> > > > > The out_nh_offset represents the start byte offset of the outer
> > > > > network header from the beginning of the packet
> > > > >
> > > > > This issue was briefly discussed on the mailing list in a
> > > > > different thread, which can be found here
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kerne=
l.o
> > > > > rg_a
> > > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o=
rg_
> > > a  >> > > ll_DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2-
> > > > 40DM4PR18MB4269.namprd18.pro
> > > > >
> > > >
> > d.outlook.com_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3b
> > > > CCyFq0M
> > > > > EWPS2176D_oSryc7cD-
> > > > 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_
> > > > > nHyksxDbHI3UT0OFedi-b&s=3DMR9AX0Md9PFbZjQM-
> > > > bwJAmO13ZwETRZJCm9qFIYDy6E&e=3D
> > > > >
> > > > > v2 -> v3:
> > > > >  - Rebase to virtio-1.4
> > > > >  - Addressed pending review commnets related to wording.
> > > > >
> > > > > v2 -
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kerne=
l.o
> > > > > rg_a
> > > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o=
rg_
> > > a  >> > > ll_20250128142152.3662988-2D1-2Dkshankar-
> > > > 40marvell.com_&d=3DDwIFaQ&c=3DnKj
> > > > >
> > Wec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS2176D_oSryc7cD-
> > > > 0TRPs&m=3Dja
> > > > >
> > jIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT0OFedi-
> > > > b&s=3DjvYZB
> > > > > QtOwWyydI5lFvCFz4hF94jDmU70nROTU44Ma0M&e=3D
> > > > >
> > > > > v1 -> v2:
> > > > >  - explicitly state that the out_nh_offset can be set only when a
> > > > > valid
> > > > network header is present.
> > > > >  - updated out_nh_offset usage in the RX direction.
> > > > >  - minor word cleanup.
> > > > >
> > > > > v1 -
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kerne=
l.o
> > > > > rg_v
> > > <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.o=
rg_
> > > v  >> > > irtio-2Dcomment_20250114171636.3175670-2D1-2Dkshankar-
> > > > 40marvell.com_&d
> > > > >
> > > >
> > =3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS217
> > > > 6D_oSryc7
> > > > > cD-
> > > >
> > 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT
> > > > 0OF
> > > > > edi-b&s=3DrzyoQrmZTznG5V9N03u7bpPbG1uQC0WPFmypJJKS9r8&e=3D
> > > > >
> > > > > Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> > > > > ---
> > > > >  device-types/net/description.tex | 37
> > > > > ++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 37 insertions(+)
> > > > >
> > > > > diff --git a/device-types/net/description.tex
> > > > > b/device-types/net/description.tex
> > > > > index b546cd7..2a4aa66 100644
> > > > > --- a/device-types/net/description.tex
> > > > > +++ b/device-types/net/description.tex
> > > > > @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device
> > > > > Types / Network Device / Feature bits
> > > > >
> > > > >  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device
> > > > handles packets
> > > > >    carried by a UDP tunnel with partial csum for the outer header=
.
> > > > > +
> > > > > +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the
> > > > > +start of \field{out_nh_offset}  value. Device gains advantage by
> > > > > +not reading packet to calculate outer network  header offset
> > > > >  \end{description}
> > > > >
> > > > >  \subsubsection{Feature bit requirements}\label{sec:Device Types =
/
> > > > > Network Device / Feature bits / Feature bit requirements} @@
> > > > > -592,6
> > > > +596,13 @@ \subsection{Device Operation}\label{sec:Device Types /
> > > > +Network
> > > > Device / Device O
> > > > >          le16 hdr_len;
> > > > >          le16 gso_size;
> > > > >          le16 csum_start;
> > > > > +        union {
> > > > > +                le16 csum_offset;
> > > > > +                struct {        /* Only if VIRTIO_NET_F_OUT_NET_=
HEADER
> > > > negotiated */
> > > > > +                        le8 csum_offset;
> > > > > +                        le8 out_nh_offset;
> > > >
> > > > Need some explanation why reusing csum_offset is better than
> > > > introducing new fields.
> > > Our objective is to preserve the current size of the virtio_net_hdr s=
tructure,
> > to ensure compatibility with the existing header size.
> > > (unlike other features such as hash reporting). Given that the
> > > csum_offset represents an offset within the header and may not exceed
> > 2^8, we propose utilizing the existing space to accommodate this newly
> > introduced field.
> > >
> > > Would it be more prudent to add a new field for this feature ? Do you
> > foresee any issues with this approach ?
> >
> > It might have some compatibility issue. For example in the current Linu=
x
> > implementation, csum_offset were 1:1 mapped to skb->csum_offset which i=
s
> > a u16.
> >
> > I haven't checked all the protocols (especially the tunnels) but if one=
 day
> > there's a protocol that uses a csum_offset >=3D 256, it would be proble=
matic.
> >
> I agree with the 1:1 mapping between csum_offset and skb->checksum_offset=
.
> Given that the virtio net header size is already a scarce resource for ad=
ding new fields,
> additionally increasing it for every new feature might impact performance=
 in the data path.

New fields were added when new features were added. It doesn't harm
too much as long as it doesn't cost more than one cacheline.

And addressing this "issue" seems to be orthogonal to the proposal
here. Once we get a better way to place vnet header, network header
will work there as well.

> Would it be fine to add a note stating that when the VIRTIO_NET_F_OUT_NET=
_HEADER
> feature is negotiated, checksum_offset cannot exceed 2^8 offset ?

So if one day there's a protocol that uses a cusm_offset >=3D 256 with
the network header, we need to invent new fields which are kind of not
elegant.

I think it would be cleaner if we just introduce a new field.

Thanks

>
> > Thanks
> >
> > > >
> > > > > +                };
> > > > > +        };
> > > > >          le16 csum_offset;
> > > >
> > > > It seems like it needs to be removed.
> > > ACK .
> > > Inadvertently included in version 3. Will fix up and send version4
> > > >
> > > > >          le16 num_buffers;
> > > > >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPOR=
T
> > > > negotiated)
> > > >
> > > > Thanks
> > >
>

